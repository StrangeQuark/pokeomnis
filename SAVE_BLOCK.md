# Save System and Save Block Deep Dive

This repo uses the Emerald-style dual-slot flash save system. A normal save is
not one contiguous blob in flash: it is split into 14 logical sectors, written to
one of two rotating slots, with a checksum and counter on every sector. At
runtime, the save blocks are also moved by a small random offset, so almost all
gameplay code accesses save data through `gSaveBlock1Ptr`, `gSaveBlock2Ptr`, and
`gPokemonStoragePtr` rather than the raw globals.

The current primary save payload is:

| Runtime block | Struct size | Wrapper size | Saved logical sectors |
| --- | ---: | ---: | --- |
| `struct SaveBlock2` | `0xF30` / 3888 | `0xFB0` | sector 0 |
| `struct SaveBlock1` | `0x3D88` / 15752 | `0x3E08` | sectors 1-4 |
| `struct PokemonStorage` | `0x83D0` / 33744 | `0x8450` | sectors 5-13 |

The wrappers are larger because each one includes `SAVEBLOCK_MOVE_RANGE` bytes
of padding for runtime pointer randomization. Only the inner `block` structs are
written to flash.

## Source Map

The save system is spread across these files:

| File | Role |
| --- | --- |
| `include/save.h` | Flash sector constants, save status codes, sector structs, save entry points. |
| `src/save.c` | Flash slot validation, sector writes, checksums, save/load core, special sectors. |
| `include/load_save.h` | ASLR wrapper structs and runtime save-block pointer APIs. |
| `src/load_save.c` | Save block pointer movement, clear/default init, bag staging, party/object copy. |
| `include/global.h` | `struct SaveBlock2`, `struct SaveBlock1`, and most nested save structs. |
| `include/pokemon_storage_system.h` | `struct PokemonStorage` and PC box data. |
| `src/start_menu.c` | Manual save UI and normal overworld save entry point. |
| `src/main_menu.c` | New game setup, player gender/name/region selection. |
| `src/intro.c` | Boot-time save pointer setup and initial load. |
| `src/new_game.c` | New-game save data initialization. |
| `src/overworld.c` | Continue game loading, warps, object and party save/load helpers. |
| `src/save_location.c` | Special continue/save warp flag helpers. |
| `src/event_data.c` | Saved flags/vars and transient special flags/vars. |
| `src/save_failed_screen.c` | Damaged-sector recovery UI and retry path. |
| `src/hall_of_fame.c` | Hall of Fame special-sector consumers. |
| `src/recorded_battle.c` | Recorded battle special-sector consumer. |
| `src/ereader_helpers.c` | Trainer Hill e-Reader special-sector consumer. |
| `src/rom_header_gf.c` | External save-data offset metadata for linked tools. |

## Flash Layout

The game targets 1 Mbit flash:

- Flash base: `0x0E000000`
- Total flash size: `0x20000` / 131072 bytes
- Sector size: `0x1000` / 4096 bytes
- Sector count: 32 sectors
- Data bytes per regular save sector: `0xF80` / 3968 bytes
- Footer bytes per sector: `0x80` / 128 bytes

Logical save sectors are:

| Logical sector id | Meaning |
| ---: | --- |
| 0 | `SaveBlock2` |
| 1-4 | `SaveBlock1` |
| 5-13 | `PokemonStorage` |

Physical flash sectors are:

| Physical sector range | Meaning |
| --- | --- |
| 0-13 | Primary save slot A |
| 14-27 | Primary save slot B |
| 28 | Hall of Fame sector 1 |
| 29 | Hall of Fame sector 2 |
| 30 | Trainer Hill e-Reader sector |
| 31 | Recorded Battle sector |

The two primary slots alternate on every full save. The special sectors are not
part of the dual-slot rotation.

`ClearSaveData()` erases all 32 physical sectors, including both regular slots
and all special sectors.

## Regular Sector Format

Regular save sectors use `struct SaveSector`:

| Offset | Size | Field |
| ---: | ---: | --- |
| `0x000` | `0xF80` | `data` payload |
| `0xF80` | `0x74` | unused footer padding |
| `0xFF4` | `0x02` | logical sector id |
| `0xFF6` | `0x02` | checksum |
| `0xFF8` | `0x04` | signature, always `0x08012025` for valid regular sectors |
| `0xFFC` | `0x04` | save counter |

The checksum is calculated by summing 32-bit words over the exact payload size
for that logical sector, then adding the high and low 16-bit halves of the sum.
The current payload sizes are all 4-byte aligned. If a future payload size is not
4-byte aligned, the trailing 1-3 bytes will not be included by the existing
checksum routine.

Every regular sector stores its logical id, checksum, signature, and save
counter. A slot is considered valid only if every expected logical sector can be
found in the slot and each sector passes signature and checksum validation.

## Save Slot Rotation

There are two layers of rotation:

1. The active slot alternates between physical sectors `0-13` and `14-27`.
2. Logical sectors are rotated within the active slot by `gLastWrittenSector`.

On a full save, `RestoreSaveBackupVarsAndIncrement()` advances
`gLastWrittenSector`, increments `gSaveCounter`, and writes all logical sectors.
The physical sector for a logical sector is:

```c
physicalSector = (logicalSectorId + gLastWrittenSector) % 14
               + 14 * (gSaveCounter % 2);
```

This means logical sector 0 is not always stored in physical sector 0 or 14. The
footer id is the source of truth when loading.

If any sector write fails, `gDamagedSaveSectors` records the failed sectors,
`gSaveCounter` and `gLastWrittenSector` are restored to the previous known-good
values, and the save is treated as failed.

## Current Logical Sector Payload Map

The layout is defined in `sSaveSlotLayout` in `src/save.c`.

| Logical sector | Struct | Struct offset | Bytes written | Free bytes in sector data |
| ---: | --- | ---: | ---: | ---: |
| 0 | `SaveBlock2` | `0x0000` | `0x0F30` | `0x050` |
| 1 | `SaveBlock1` | `0x0000` | `0x0F80` | `0x000` |
| 2 | `SaveBlock1` | `0x0F80` | `0x0F80` | `0x000` |
| 3 | `SaveBlock1` | `0x1F00` | `0x0F80` | `0x000` |
| 4 | `SaveBlock1` | `0x2E80` | `0x0F08` | `0x078` |
| 5 | `PokemonStorage` | `0x0000` | `0x0F80` | `0x000` |
| 6 | `PokemonStorage` | `0x0F80` | `0x0F80` | `0x000` |
| 7 | `PokemonStorage` | `0x1F00` | `0x0F80` | `0x000` |
| 8 | `PokemonStorage` | `0x2E80` | `0x0F80` | `0x000` |
| 9 | `PokemonStorage` | `0x3E00` | `0x0F80` | `0x000` |
| 10 | `PokemonStorage` | `0x4D80` | `0x0F80` | `0x000` |
| 11 | `PokemonStorage` | `0x5D00` | `0x0F80` | `0x000` |
| 12 | `PokemonStorage` | `0x6C80` | `0x0F80` | `0x000` |
| 13 | `PokemonStorage` | `0x7C00` | `0x07D0` | `0x7B0` |

The total slot capacity for regular payload data is `14 * 0xF80 = 0xD900`
bytes. The current regular payload uses `0xD088` bytes, leaving `0x878` bytes of
unused sector-data capacity across the slot. The free space is not a single
contiguous area: it is tied to the end of sector 0, sector 4, and sector 13.

## Save Loading

Boot-time load begins in `CB2_InitCopyrightScreenAfterBootup()`:

1. `SetSaveBlocksPointers(GetSaveBlocksPointersBaseOffset())` initializes the
   movable save block pointers.
2. `Save_ResetSaveCounters()` resets global save counter state.
3. `LoadGameSave(SAVE_NORMAL)` validates and loads the newest valid save slot.
4. If the save is empty or corrupt, `Sav2_ClearSetDefault()` clears `SaveBlock2`
   and restores default options.

`LoadGameSave()` calls `TryLoadSaveSlot(FULL_SAVE_SLOT, ...)`. That path:

1. Calls `GetSaveValidStatus()` to validate both slots.
2. Selects the newest valid slot by comparing sector counters.
3. Calls `CopySaveSlotData()` to copy each logical sector payload into the
   correct runtime block.
4. Calls `CopyPartyAndObjectsFromSave()` for normal saves.
5. Stores the status in `gSaveFileStatus`.

The newest-slot logic has special handling for counter wraparound: counters
`0` and `0xFFFFFFFF` are treated as adjacent when deciding which slot is newer.

`CopySaveSlotData()` determines the sector rotation by finding the physical
sector in the selected slot whose footer id is logical sector 0. It then uses
that offset to load logical sectors 0-13.

If one slot is valid and the other slot has a bad signature or checksum,
`GetSaveValidStatus()` still points `gSaveCounter` at the valid slot, but returns
`SAVE_STATUS_ERROR`. That lets the game load the usable slot while still
reporting that one save slot was damaged.

## Save Entry Points and Save Types

The public save entry point is `TrySavingData(saveType)`. It first checks
`gFlashMemoryPresent`, then dispatches through `HandleSavingData()`.

| Save type | Behavior |
| --- | --- |
| `SAVE_NORMAL` | Copies party and object events into `SaveBlock1`, then writes all 14 regular sectors. |
| `SAVE_LINK` | Copies party/object data, then writes only `SaveBlock2` and `SaveBlock1` sectors 0-4. PC storage is skipped. |
| `SAVE_EREADER` | Same sector range as link save: sectors 0-4 only. |
| `SAVE_HALL_OF_FAME` | Increments the Hall of Fame game stat, writes all 14 regular sectors, then writes Hall of Fame sectors 28 and 29. |
| `SAVE_OVERWRITE_DIFFERENT_FILE` | Erases special sectors 28-31, then writes all 14 regular sectors. |
| `SAVE_HALL_OF_FAME_ERASE_BEFORE` | Unused in normal code; erases special sectors before Hall of Fame style handling. |

Manual overworld saves enter through `SaveGame()` in `src/start_menu.c`:

1. `InitSave()`
2. `SaveMapView()`
3. confirmation dialogs
4. `SaveDoSaveCallback()`
5. `TrySavingData(SAVE_NORMAL)` or `TrySavingData(SAVE_OVERWRITE_DIFFERENT_FILE)`

`SAVE_OVERWRITE_DIFFERENT_FILE` is used when `gDifferentSaveFile` is true. New
game initialization sets `gDifferentSaveFile = TRUE`, so the first save for a new
file clears Hall of Fame, Trainer Hill, and recorded battle data.

## Link and Incremental Saves

The link/minigame save path can write one sector per frame instead of blocking
on a full 14-sector write.

The important functions are:

- `LinkFullSave_Init()`
- `LinkFullSave_WriteSector()`
- `LinkFullSave_ReplaceLastSector()`
- `LinkFullSave_SetLastSectorSignature()`
- `Task_LinkFullSave()`

The incremental full-save flow initializes a new slot and counter, then writes
logical sectors progressively. The final sector is written with a staged
signature: `LinkFullSave_ReplaceLastSector()` writes the sector while skipping
the first byte of the signature, and `LinkFullSave_SetLastSectorSignature()`
writes that byte afterward. This makes the last sector become valid only at the
commit point.

`Task_LinkFullSave()` also temporarily sets the continue warp to the dynamic
warp before saving, then clears that continue-warp status after the save commits.
This gives the game a safer place to resume if the link/minigame save is
interrupted.

Some link battle paths write `SaveBlock2` and then SaveBlock1 sectors one at a
time using `WriteSaveBlock2()` and `WriteSaveBlock1Sector()`.

## Runtime Save Block Pointers

The actual globals are ASLR-style wrappers:

```c
struct SaveBlock2ASLR
{
    struct SaveBlock2 block;
    u8 aslr[SAVEBLOCK_MOVE_RANGE];
};

struct SaveBlock1ASLR
{
    struct SaveBlock1 block;
    u8 aslr[SAVEBLOCK_MOVE_RANGE];
};

struct PokemonStorageASLR
{
    struct PokemonStorage block;
    u8 aslr[SAVEBLOCK_MOVE_RANGE];
};
```

`SAVEBLOCK_MOVE_RANGE` is 128 bytes. `SetSaveBlocksPointers(offset)` adds a
random value, masks it to a 4-byte aligned value in the range `0-124`, then
points each runtime pointer into its wrapper:

- `gSaveBlock2Ptr`
- `gSaveBlock1Ptr`
- `gPokemonStoragePtr`

The offset seed comes from `GetSaveBlocksPointersBaseOffset()`, which reads the
newest SaveBlock2 sector directly from flash and sums the four trainer ID bytes.
At boot, this lets the game choose the same broad pointer range before the save
is loaded.

Because the pointers move, gameplay code should not use `&gSaveblock1.block`
directly. It should use the runtime pointers.

`MoveSaveBlocks_ResetHeap()` backs up the current save blocks into heap memory,
chooses new save block pointer locations based on the trainer ID bytes, restores
the backed-up blocks, resets the heap, then generates a new encryption key for
encrypted save fields.

## Save Working Buffers

Several globals support save I/O but are not themselves the durable save data:

| Global | Size | Role |
| --- | ---: | --- |
| `gSaveDataBuffer` | `0x1000` | Temporary sector buffer used for reads and writes. |
| `gRamSaveSectorLocations` | `0x70` | Runtime table of data pointers and sizes for logical sectors 0-13. Rebuilt by `UpdateSaveAddresses()`. |
| `gLoadedSaveData` | `0x528` | Staging area for bag pockets and mail loaded out of `SaveBlock1`. |
| `gReadWriteSector` | pointer | Points at the active sector buffer, normally `gSaveDataBuffer`. |
| `gIncrementalSectorId` | `u16` | Tracks sector progress for incremental/link saves. |
| `gDamagedSaveSectors` | `u32` bitfield | Tracks failed physical sectors during a save attempt. |

`UpdateSaveAddresses()` must run before save I/O because the save block pointers
can move. It fills `gRamSaveSectorLocations` with the current data pointer and
size for every logical sector.

## Encrypted Fields

`gSaveBlock2Ptr->encryptionKey` is used to XOR selected numeric save fields:

| Data | Location | Notes |
| --- | --- | --- |
| Money | `SaveBlock1.money` | Accessed through `GetMoney()` / `SetMoney()`. |
| Coins | `SaveBlock1.coins` | Accessed through coin helpers. |
| Game stats | `SaveBlock1.gameStats` | Re-keyed by `ApplyNewEncryptionKeyToGameStats()`. |
| Bag item quantities | Bag pockets in `SaveBlock1` | PC item quantities are not encrypted. |
| Berry powder | Berry powder module | Re-keyed with the save key. |

Bag item storage has an extra staging step. `LoadPlayerBag()` copies bag pockets
and mail from `SaveBlock1` into `gLoadedSaveData`. `SavePlayerBag()` writes that
staged data back into `SaveBlock1`, applying the current encryption key as
needed.

If code modifies encrypted fields directly, it can easily save nonsense. Use the
existing accessors and re-key helpers.

## SaveBlock2

`SaveBlock2` stores player identity, global options, Pokedex ownership state,
time offsets, encryption key, multiplayer records, Battle Frontier state, and
this romhack's saved player region.

Current size: `0xF30`.

| Offset | Field | Notes |
| ---: | --- | --- |
| `0x000` | `playerName[PLAYER_NAME_LENGTH + 1]` | Saved player name. |
| `0x008` | `playerGender` | `MALE` / `FEMALE`. |
| `0x009` | `specialSaveWarpFlags` | Continue, Poke Center, lobby, champion, and related save-warp bits. |
| `0x00A` | `playerTrainerId[TRAINER_ID_LENGTH]` | Also seeds save-block pointer movement. |
| `0x00E` | `playTimeHours` | Part of saved play time. |
| `0x010` | `playTimeMinutes` | Part of saved play time. |
| `0x011` | `playTimeSeconds` | Part of saved play time. |
| `0x012` | `playTimeVBlanks` | Frame counter portion of play time. |
| `0x013` | `optionsButtonMode` | Button mode option. |
| `0x014` | option bitfields | Text speed, window frame type, sound, battle style, battle scene, and region map zoom. |
| `0x018` | `pokedex` | Pokedex flags and owned data. |
| `0x090` | `filler_90[0x8]` | Unused/reserved bytes. |
| `0x098` | `localTimeOffset` | RTC offset. |
| `0x0A0` | `lastBerryTreeUpdate` | Last berry update timestamp. |
| `0x0A8` | `gcnLinkFlags` | GameCube/link flags. |
| `0x0AC` | `encryptionKey` | XOR key for selected save fields. |
| `0x0B0` | `playerApprentice` | Battle Frontier apprentice data. |
| `0x0DC` | `apprentices[4]` | Apprentice records. |
| `0x1EC` | `berryCrush` | Berry Crush records. |
| `0x1FC` | `pokeJump` | Pokemon Jump records. |
| `0x20C` | `berryPick` | Dodrio Berry Picking records. |
| `0x21C` | `hallRecords1P` | Single-player Hall records. |
| `0x57C` | `hallRecords2P` | Link Hall records. |
| `0x624` | `contestLinkResults` | Link contest results. |
| `0x64C` | `frontier` | Battle Frontier state, extending through `0xF2B`. |
| `0xF2C` | `playerRegion` | Romhack field: `KANTO`, `JOHTO`, or `HOENN`. |
| `0xF2D` | padding | Struct padding to 4-byte alignment. |

The comment near `SaveBlock2` still says `sizeof=0xF2C`, but the compiled size is
`0xF30` because `playerRegion` was added after the Battle Frontier data and the
struct is padded to alignment.

### Player Region

This repo adds `playerRegion` to `SaveBlock2`. It is set during new-game intro
flow in `src/main_menu.c` after gender selection and before the player name
flow. Valid values are defined in `include/constants/global.h`:

| Constant | Value |
| --- | ---: |
| `KANTO` | 0 |
| `JOHTO` | 1 |
| `HOENN` | 2 |

The field is used by:

- intro/player sprite selection in `src/main_menu.c`
- battle controller player sprite selection
- string/player-name utility code
- scripts through the `checkplayerregion` command

`checkplayerregion` is script command `0xE4`. It writes the saved region to
`VAR_RESULT`.

## SaveBlock1

`SaveBlock1` stores most mutable gameplay state: map position, party, money,
bag, overworld objects, flags, vars, berries, secret bases, TV data, mail,
Mystery Gift, roaming Pokemon, scripts, and many activity records.

Current size: `0x3D88`.

| Offset | Field | Notes |
| ---: | --- | --- |
| `0x0000` | `pos` | Player map coordinates. |
| `0x0004` | `location` | Current map group/number. |
| `0x000C` | `continueGameWarp` | Resume warp when continue-warp status is set. |
| `0x0014` | `dynamicWarp` | Dynamic warp slot. |
| `0x001C` | `lastHealLocation` | Heal location warp. |
| `0x0024` | `escapeWarp` | Escape Rope/dungeon exit warp. |
| `0x002C` | map state bytes | Saved music, weather, flash level, map layout id. |
| `0x0034` | `mapView[0x100]` | Saved visible map tiles for continue/load transition. |
| `0x0234` | `playerPartyCount` | Party count. |
| `0x0238` | `playerParty[PARTY_SIZE]` | Six party Pokemon. |
| `0x0490` | `money` | Encrypted. |
| `0x0494` | `coins` | Encrypted. |
| `0x0496` | `registeredItem` | Registered key item. |
| `0x0498` | `pcItems` | PC item storage; quantities are not bag-encrypted. |
| `0x0560` | `bagPocket_Items` | Main item pocket. |
| `0x05D8` | `bagPocket_KeyItems` | Key item pocket. |
| `0x0650` | `bagPocket_PokeBalls` | Ball pocket. |
| `0x0690` | `bagPocket_TMHM` | TM/HM pocket. |
| `0x0790` | `bagPocket_Berries` | Berry pocket. |
| `0x0848` | `pokeblocks` | Pokeblock case. |
| `0x0988` | `seen1` | Pokedex seen flags copy. |
| `0x09BC` | `berryBlenderRecords[3]` | Berry Blender records. |
| `0x09C2` | `unused_9C2[6]` | Unused bytes. |
| `0x09C8` | `trainerRematchStepCounter` | Trainer rematch step counter. |
| `0x09CA` | `trainerRematches` | Trainer rematch table. |
| `0x0A30` | `objectEvents[OBJECT_EVENTS_COUNT]` | Saved active object events. |
| `0x0C70` | `objectEventTemplates[OBJECT_EVENT_TEMPLATES_COUNT]` | Saved object templates. |
| `0x1270` | `flags[NUM_FLAG_BYTES]` | Persistent event flags. |
| `0x139C` | `vars[VARS_COUNT]` | Persistent event vars. |
| `0x159C` | `gameStats` | Encrypted counters. |
| `0x169C` | `berryTrees` | Berry tree state. |
| `0x1A9C` | `secretBases` | Secret base records. |
| `0x271C` | decoration inventories | Desk, chair, plant, ornament, mat, poster, doll, cushion inventories. |
| `0x27CC` | `tvShows` | TV show state. |
| `0x2B50` | `pokeNews` | Pokemon News records. |
| `0x2B90` | outbreak data | Mass outbreak species, map, level, moves, probability, and days left. |
| `0x2BA4` | Gabby/Ty data | Interviewer state. |
| `0x2BB0` | `easyChatProfile` | Easy Chat profile phrase. |
| `0x2BBC` | `easyChatBattleStart` | Battle-start Easy Chat phrase. |
| `0x2BC8` | `easyChatBattleWon` | Battle-won Easy Chat phrase. |
| `0x2BD4` | `easyChatBattleLost` | Battle-lost Easy Chat phrase. |
| `0x2BE0` | `mail` | Mail storage. |
| `0x2E20` | `unlockedTrendySayings` | Dewford trendy phrase bitfield. |
| `0x2E28` | `oldMan` | Dewford old man data. |
| `0x2E64` | `dewfordTrends` | Dewford trend records. |
| `0x2E90` | `contestWinners` | Contest winner records. |
| `0x3030` | `daycare` | Daycare Pokemon and daycare state. |
| `0x3150` | link battle records | Link battle wins/losses/draws. |
| `0x31A8` | `giftRibbons` | Gift ribbon flags. |
| `0x31B3` | external event data | Event data exposed to external tooling. |
| `0x31C7` | external event flags | Event flags exposed to external tooling. |
| `0x31DC` | `roamer` | Roaming Pokemon state. |
| `0x31F8` | `enigmaBerry` | Enigma Berry data. |
| `0x322C` | `mysteryGift` | Mystery Gift state. |
| `0x3598` | `unused_3598[0x180]` | Unused reserved bytes. |
| `0x3718` | `trainerHillTimes` | Trainer Hill records. |
| `0x3728` | `ramScript` | Saved RAM script. |
| `0x3B14` | `recordMixingGift` | Record-mixing gift. |
| `0x3B24` | `seen2` | Second Pokedex seen flags copy. |
| `0x3B58` | Lilycove lady data | Lilycove lady state. |
| `0x3B98` | `trainerNameRecords[20]` | Trainer name records. |
| `0x3C88` | registered Union Room chat texts | Saved easy chat texts. |
| `0x3D5A` | `unused_3D5A[10]` | Unused bytes. |
| `0x3D64` | `trainerHill` | Trainer Hill challenge state. |
| `0x3D70` | Walda phrase data | Rustboro Walda phrase and icon state. |

`SaveBlock1` is already spread across four sectors. Sectors 1-3 are full; only
sector 4 has unused room at the end.

## PokemonStorage

`PokemonStorage` is the PC box system.

Current size: `0x83D0`.

| Field | Meaning |
| --- | --- |
| `currentBox` | Active PC box index. |
| `boxes[TOTAL_BOXES_COUNT][IN_BOX_COUNT]` | 14 boxes of 30 boxed Pokemon. |
| `boxNames[TOTAL_BOXES_COUNT]` | PC box names. |
| `boxWallpapers[TOTAL_BOXES_COUNT]` | PC box wallpaper ids. |

`PokemonStorage` uses logical sectors 5-13. Link/Frontier saves that use
`SAVE_LINK` intentionally skip this block, so changes to PC data are not
persisted by those save paths.

## Event Flags and Vars

Persistent event state lives in `SaveBlock1`:

- `gSaveBlock1Ptr->flags`
- `gSaveBlock1Ptr->vars`

Important ranges:

| Range | Meaning |
| --- | --- |
| `VARS_START` `0x4000` through `VARS_END` `0x40FF` | 256 persistent vars saved in `SaveBlock1.vars`. |
| `TEMP_VARS_START` `0x4000` through `TEMP_VARS_END` `0x400F` | First 16 persistent-var slots are cleared as temporary vars. |
| `SPECIAL_VARS_START` `0x8000` through `SPECIAL_VARS_END` `0x8015` | Runtime-only special vars in `gSpecialVars`, not saved. |
| flags below `SPECIAL_FLAGS_START` | Persistent flags saved in `SaveBlock1.flags`. |
| temp flags `0x000` through `0x01F` | Cleared by `ClearTempFieldEventData()`. |
| daily flags `0x920` through `0x95F` | Cleared by `ClearDailyFlags()`. |
| special flags `0x4000` through `0x407F` | Runtime-only `sSpecialFlags`, not saved. |

Current persistent flag storage is `NUM_FLAG_BYTES = 0x12C` bytes, enough for
`0x960` persistent flag bits. Current persistent var storage is `0x200` bytes,
or 256 `u16` vars.

`InitEventData()` clears all persistent saved flags and vars, and also clears
runtime special flags. `ClearTempFieldEventData()` clears the temporary flag and
var ranges when entering field contexts that should discard temporary state.

For future Omnis story state, the safest default is still to use the existing
persistent flag/var system unless the state needs a typed struct or a larger data
shape. The currently implemented romhack-specific durable choice field is
`SaveBlock2.playerRegion`.

## Continue Warp and Save State

`SaveBlock2.specialSaveWarpFlags` controls several resume/save-warp behaviors:

| Bit | Constant | Meaning |
| ---: | --- | --- |
| 0 | `CONTINUE_GAME_WARP` | Continue should use `SaveBlock1.continueGameWarp`. |
| 1 | `POKECENTER_SAVEWARP` | Saved in a Poke Center-style map. |
| 2 | `LOBBY_SAVEWARP` | Saved in the Battle Tower lobby. |
| 3 | `UNK_SPECIAL_SAVE_WARP_FLAG_3` | Reserved/unknown; this repo has no maps that set it. |
| 7 | `CHAMPION_SAVEWARP` | Champion-related save warp. |

`TrySetMapSaveWarpStatus()` sets Poke Center and lobby flags based on the
current map. Continue-warp status is manipulated by helpers in `load_save.c` and
used by `CB2_ContinueSavedGame()` in `src/overworld.c`.

`SaveMapView()` stores a 0x100-byte snapshot of visible map metatile behavior
into `SaveBlock1.mapView`. It is called by normal and link save flows before the
save is written.

## Party and Object Event Copies

The live party and object events are not automatically identical to the saved
copies at all times.

Before saving, `CopyPartyAndObjectsToSave()` calls:

- `SavePlayerParty()`
- `SaveObjectEvents()`

After loading, `CopyPartyAndObjectsFromSave()` calls:

- `LoadPlayerParty()`
- `LoadObjectEvents()`

`SaveObjectEvents()` stores live `gObjectEvents` into
`gSaveBlock1Ptr->objectEvents`, byte-swaps `graphicsId`, and sets `spriteId` to
127. `LoadObjectEvents()` reverses this for current saves. If it sees an older
save whose saved `spriteId` was not 127, it masks `graphicsId` down to 8 bits for
vanilla compatibility, then clears `spriteId`.

## New Game Initialization

`NewGameInitData()` clears and initializes most saved state, but it does not
wipe all of `SaveBlock2`. That matters in this repo because the intro flow has
already written `playerName`, `playerGender`, and `playerRegion` before
`CB2_NewGame()` calls `NewGameInitData()`.

- clears `SaveBlock1`
- resets selected `SaveBlock2` substructures and fields, including Pokedex,
  Battle Frontier records, special save warp flags, GCN link flags, trainer id,
  play time, minigame records, apprentices, ranking hall records, and contest
  link results
- resets encrypted money/coins with a zero key
- initializes party, PC storage, event data, TV, berries, secret
  bases, roaming Pokemon, registered text, and similar systems
- sets `gDifferentSaveFile = TRUE`
- warps the player to the truck intro
- runs `EventScript_ResetAllMapFlags`

`playerRegion` is selected in the main menu flow before this point and is
preserved through new-game initialization because `NewGameInitData()` does not
call `ClearSav2()`.

`Sav2_ClearSetDefault()` is the fallback used for empty or corrupt saves. It
clears `SaveBlock2` and restores default option settings.

## Special Sectors

Sectors 28-31 are not part of the regular dual-slot save. They have their own
formats and consumers.

### Hall of Fame

Hall of Fame uses sectors 28 and 29. `SAVE_HALL_OF_FAME` writes a normal full
save first, then writes two Hall of Fame sectors from `gDecompressionBuffer`.

Hall of Fame sectors use `HandleWriteSectorNBytes()` rather than the regular
slot layout. They still write `SECTOR_SIGNATURE`, but the checksum is stored in
the sector's `id` field and there is no normal save counter.

### Trainer Hill and Recorded Battle

Trainer Hill e-Reader data uses sector 30. Recorded Battle data uses sector 31.

These use `TryWriteSpecialSaveSector()` / `TryReadSpecialSaveSector()`. Their
format is:

| Offset | Field |
| ---: | --- |
| `0x000` | `SPECIAL_SECTOR_SENTINEL` (`0xB39D`) |
| `0x004` | caller-owned payload |

Their payload structs include their own checksums. They do not use the regular
save sector footer id/checksum/signature/counter protocol. Both consumers have
static asserts requiring their payloads to fit before `SECTOR_COUNTER_OFFSET`.

## Save Failure Handling

Flash writes go through `ProgramFlashSectorAndVerify()`, which attempts the
write up to three times. If a sector still fails, the corresponding bit is set in
`gDamagedSaveSectors`.

When `TrySavingData()` sees damaged sectors, it runs `DoSaveFailedScreen()`.
That screen:

1. Shows a save failure message.
2. Attempts to wipe each damaged sector by repeatedly writing zero bytes.
3. Retries the original save type.
4. Reports success or failure.
5. Soft-resets if there is no continuation callback, or returns to the callback
   if one is set.

The save failure screen preserves the save type it was trying to perform, so a
failed Hall of Fame or link save retries the correct path.

## External Offset Metadata

`src/rom_header_gf.c` builds a `GFRomHeader` with save block sizes and offsets
for external/link tooling. Many entries are generated with `offsetof`, including
player name, trainer id, gender, Pokedex fields, seen flags, PC items, gift
ribbons, Enigma Berry, external event data, and GCN link flags.

Changing save block layouts can therefore affect external tooling even if the
game itself still builds. When adding or moving fields, check this header and any
tooling that consumes it.

## Compatibility and Extension Rules

- Add gameplay state to existing event flags/vars when the state is naturally a
  boolean, small integer, or script-facing story value.
- Add a typed field only when flags/vars are too small, too awkward, or not
  expressive enough.
- Do not exceed the sector space assigned to a block without updating
  `sSaveSlotLayout` and carefully considering old save compatibility.
- `SaveBlock2` sector 0 has `0x50` bytes free after the current struct.
- `SaveBlock1` sector 4 has `0x78` bytes free after the current struct.
- `PokemonStorage` sector 13 has `0x7B0` bytes free after the current struct.
- Sectors 1-3 and 5-12 are full.
- Never access encrypted fields by raw assignment unless the value is already in
  encrypted form.
- Normal saves persist PC storage. `SAVE_LINK` and `SAVE_EREADER` do not.
- Special sectors 28-31 are erased when saving over a different save file.
- Runtime-only special vars and special flags are not saved.
- Temporary flags and vars are saved only until the code clears them; they should
  not be used for durable story progress.
- Prefer `gSaveBlock1Ptr`, `gSaveBlock2Ptr`, and `gPokemonStoragePtr` over raw
  wrapper globals.
- If `SaveBlock2` changes, remember that `GetSaveBlocksPointersBaseOffset()`
  reads sector 0 directly from flash before normal save loading.

## Practical Checklist for Save Changes

When changing saved data, verify all of the following:

1. The target block has enough space in its assigned sectors.
2. The struct remains 4-byte aligned or checksum behavior is intentionally
   understood.
3. All initialization paths set a sane value:
   `NewGameInitData()`, clear/default helpers, migration code if any, and
   empty/corrupt save fallback.
4. All access uses the runtime save block pointers.
5. Encrypted values use the existing accessor/re-key pattern.
6. Link save behavior is acceptable if the data is in `PokemonStorage`, because
   some link save types skip PC storage.
7. Any script-facing state has constants in the appropriate flag/var headers.
8. Any external-tool-facing offset changes are reflected in or checked against
   `src/rom_header_gf.c`.
9. Save-over-different-file behavior is correct for related special sectors.
10. Existing saves either remain compatible or have an intentional migration or
    reset strategy.
