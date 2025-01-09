	.include "MPlayDef.s"

	.equ	mus_goldenrod_grp, voicegroup191
	.equ	mus_goldenrod_pri, 0
	.equ	mus_goldenrod_rev, reverb_set+50
	.equ	mus_goldenrod_mvl, 75
	.equ	mus_goldenrod_key, 0
	.equ	mus_goldenrod_tbs, 1
	.equ	mus_goldenrod_exg, 1
	.equ	mus_goldenrod_cmp, 1

	.section .rodata
	.global	mus_goldenrod
	.align	2

@**************** Track 1 (Midi-Chn.1) ****************@

mus_goldenrod_1:
	.byte	KEYSH , mus_goldenrod_key+0
@ 000   ----------------------------------------
	.byte	TEMPO , 136*mus_goldenrod_tbs/2
	.byte		VOICE , 29
	.byte		VOL   , 115*mus_goldenrod_mvl/mxv
	.byte		PAN   , c_v+6
	.byte		MOD   , 0
	.byte	W96
@ 001   ----------------------------------------
	.byte	W72
	.byte	TEMPO , 136*mus_goldenrod_tbs/2
	.byte	W24
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
mus_goldenrod_1_B1:
	.byte	W16
	.byte		N01   , Cs4 , v100
	.byte		N01   , Fn4 
	.byte	W24
	.byte		N07   , Gs3 , v092
	.byte		N07   , Cs4 , v100
	.byte	W08
	.byte		N01   , Gs3 , v092
	.byte		N01   , Ds4 , v100
	.byte	W24
	.byte		N19   , Gs3 , v092
	.byte		N19   , Cn4 , v100
	.byte	W24
@ 005   ----------------------------------------
	.byte		N15   , Fn3 , v096
	.byte		N15   , Cs4 , v100
	.byte	W16
	.byte		N02   , Fn3 , v072
	.byte		N02   , Cn4 , v080
	.byte	W08
	.byte		N15   , Fn3 , v084
	.byte		N15   , As3 , v088
	.byte	W16
	.byte		N02   , Fn3 , v072
	.byte		N02   , Cn4 , v080
	.byte	W08
	.byte		N36   , Fn3 , v092, gtp3
	.byte		N36   , Gs3 , v100, gtp3
	.byte	W48
@ 006   ----------------------------------------
	.byte	W16
	.byte		N02   , Fs3 , v092
	.byte		N02   , As3 , v100
	.byte	W24
	.byte		N07   , Gs3 , v092
	.byte		N07   , Cs4 , v100
	.byte	W08
	.byte		        Fs3 , v092
	.byte		N07   , As3 , v100
	.byte	W16
	.byte		N02   , Cs4 
	.byte		N02   , As4 
	.byte	W08
	.byte		N15   , Cn4 , v092
	.byte		N15   , Gs4 , v100
	.byte	W16
	.byte		N03   , As3 , v092
	.byte		N03   , Fs4 , v100
	.byte	W08
@ 007   ----------------------------------------
	.byte		N15   , As3 , v084
	.byte		N15   , Fn4 , v088
	.byte	W16
	.byte		N02   , Cn4 , v072
	.byte		N02   , Fs4 , v080
	.byte	W08
	.byte		N15   , Cn4 , v084
	.byte		N15   , Gs4 , v088
	.byte	W16
	.byte		N02   , Cn4 , v072
	.byte		N02   , Fn4 , v080
	.byte	W08
	.byte		N36   , Gs3 , v092, gtp3
	.byte		N36   , Ds4 , v100, gtp3
	.byte	W48
@ 008   ----------------------------------------
	.byte	W16
	.byte		N30   , Fn3 , v100, gtp1
	.byte		N30   , Cs4 , v108, gtp1
	.byte	W32
	.byte		N03   , Ds3 , v096
	.byte		N03   , Cn4 , v104
	.byte	W24
	.byte		        Gs3 , v096
	.byte		N03   , Ds4 , v108
	.byte	W24
@ 009   ----------------------------------------
	.byte	W16
	.byte		        Fn3 , v096
	.byte		N03   , Cs4 , v104
	.byte	W32
	.byte		N07   , Ds3 , v096
	.byte		N07   , Cn4 , v104
	.byte	W08
	.byte		        Dn3 , v084
	.byte		N07   , Bn3 , v092
	.byte	W08
	.byte		        Cs3 
	.byte		N07   , As3 , v096
	.byte	W08
	.byte		N23   , Cn3 , v088
	.byte		N23   , Gs3 , v096
	.byte	W24
@ 010   ----------------------------------------
	.byte	W16
	.byte		N03   , As2 
	.byte		N03   , Fs3 , v100
	.byte	W32
	.byte		N23   , As2 , v096
	.byte		N23   , Fs3 , v100
	.byte	W24
	.byte		        Cs3 , v092
	.byte		N23   , As3 , v100
	.byte	W24
@ 011   ----------------------------------------
	.byte		N03   , Cn3 
	.byte		N03   , Gs3 
	.byte	W24
	.byte		N19   , Cn3 
	.byte		N19   , Gs3 
	.byte	W24
	.byte		N23   , Cs3 , v092
	.byte		N23   , As3 , v100
	.byte	W24
	.byte		N19   , Ds3 , v096
	.byte		N19   , Cn4 , v108
	.byte	W24
@ 012   ----------------------------------------
	.byte		N36   , Cs4 , v120, gtp3
	.byte	W40
	.byte		N03   , Fn4 , v124
	.byte	W24
	.byte		N30   , Cs4 , v120, gtp1
	.byte	W32
@ 013   ----------------------------------------
	.byte		N36   , Cn4 , v120, gtp3
	.byte	W40
	.byte		N03   , Ds4 
	.byte	W24
	.byte		N30   , Cn4 , v116, gtp1
	.byte	W32
@ 014   ----------------------------------------
	.byte		N36   , As3 , v116, gtp3
	.byte	W40
	.byte		N03   , Cs4 , v120
	.byte	W24
	.byte		N30   , As3 , v112, gtp1
	.byte	W32
@ 015   ----------------------------------------
	.byte		N07   , Cn4 , v120
	.byte	W24
	.byte		N23   , Gs3 , v112
	.byte	W24
	.byte		        As3 , v104
	.byte	W24
	.byte		N07   , Gs3 , v112
	.byte	W08
	.byte		        As3 
	.byte	W08
	.byte		        Cn4 , v120
	.byte	W08
@ 016   ----------------------------------------
	.byte		N36   , Cs4 , v120, gtp3
	.byte	W40
	.byte		N03   , Fn4 
	.byte	W24
	.byte		N30   , Cs4 , v120, gtp1
	.byte	W32
@ 017   ----------------------------------------
	.byte		N36   , Cn4 , v120, gtp3
	.byte	W40
	.byte		N03   , Ds4 , v124
	.byte	W24
	.byte		N07   , Cn4 , v120
	.byte	W08
	.byte		        Ds4 
	.byte	W08
	.byte		        Cs4 , v116
	.byte	W08
	.byte		        Cn4 , v120
	.byte	W08
@ 018   ----------------------------------------
	.byte		N36   , As3 , v116, gtp3
	.byte	W40
	.byte		N03   , Cs4 
	.byte	W24
	.byte		N30   , As3 , v100, gtp1
	.byte	W32
@ 019   ----------------------------------------
	.byte		N03   , Cn4 , v120
	.byte	W24
	.byte		N22   , Gs3 
	.byte	W24
	.byte		        As3 , v108
	.byte	W24
	.byte		N19   , Cn4 , v120
	.byte	W24
@ 020   ----------------------------------------
	.byte	W96
@ 021   ----------------------------------------
	.byte	W96
@ 022   ----------------------------------------
	.byte	W96
@ 023   ----------------------------------------
	.byte	W96
	.byte	GOTO
	 .word	mus_goldenrod_1_B1
	.byte	FINE

@**************** Track 2 (Midi-Chn.2) ****************@

mus_goldenrod_2:
	.byte	KEYSH , mus_goldenrod_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 20
	.byte		VOL   , 120*mus_goldenrod_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		MOD   , 0
	.byte		N03   , Cs3 , v100
	.byte	W48
	.byte		        Gs2 
	.byte	W48
@ 001   ----------------------------------------
mus_goldenrod_2_001:
	.byte		N03   , Ds3 , v100
	.byte	W48
	.byte		        Gs2 
	.byte	W48
	.byte	PEND
@ 002   ----------------------------------------
mus_goldenrod_2_002:
	.byte		N03   , Cs3 , v100
	.byte	W48
	.byte		        Gs2 
	.byte	W48
	.byte	PEND
@ 003   ----------------------------------------
	.byte		        Ds3 
	.byte	W48
	.byte		N23   , Gs2 
	.byte	W24
	.byte		N07   , Gs1 
	.byte	W08
	.byte		        As1 , v088
	.byte	W08
	.byte		        Cn2 , v096
	.byte	W08
@ 004   ----------------------------------------
mus_goldenrod_2_004:
mus_goldenrod_2_B1:
	.byte		N06   , Cs2 , v108
	.byte	W18
	.byte		N01   , Cs2 , v052
	.byte	W06
	.byte		N06   , Fn2 , v096
	.byte	W16
	.byte		N03   , Cs2 , v100
	.byte	W08
	.byte		N06   , Cn2 , v108
	.byte	W24
	.byte		        Gs2 , v100
	.byte	W16
	.byte		N03   , Cn2 
	.byte	W08
	.byte	PEND
@ 005   ----------------------------------------
mus_goldenrod_2_005:
	.byte		N06   , As1 , v108
	.byte	W24
	.byte		        As2 , v100
	.byte	W16
	.byte		N03   , As1 
	.byte	W08
	.byte		N06   , Gs1 , v112
	.byte	W24
	.byte		        Gs2 , v100
	.byte	W16
	.byte		N03   , Gs1 
	.byte	W08
	.byte	PEND
@ 006   ----------------------------------------
mus_goldenrod_2_006:
	.byte		N06   , Fs1 , v108
	.byte	W24
	.byte		        Fs2 , v100
	.byte	W16
	.byte		N03   , Cs2 
	.byte	W08
	.byte		N06   , Ds2 , v108
	.byte	W24
	.byte		        As2 , v100
	.byte	W16
	.byte		N03   , Ds2 
	.byte	W08
	.byte	PEND
@ 007   ----------------------------------------
mus_goldenrod_2_007:
	.byte		N06   , Gs1 , v100
	.byte	W24
	.byte		N06   
	.byte	W24
	.byte		        As1 
	.byte	W24
	.byte		N07   , Gs1 
	.byte	W08
	.byte		        As1 
	.byte	W08
	.byte		N03   , Cn2 
	.byte	W08
	.byte	PEND
@ 008   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_2_004
@ 009   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_2_005
@ 010   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_2_006
@ 011   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_2_007
@ 012   ----------------------------------------
	.byte		N06   , Cs2 , v108
	.byte	W18
	.byte		N01   , Cs2 , v052
	.byte	W06
	.byte		N04   , Fn2 , v096
	.byte	W16
	.byte		N03   , Cs2 , v100
	.byte	W08
	.byte		N06   , Gs1 , v108
	.byte	W18
	.byte		N01   , Cs2 , v052
	.byte	W06
	.byte		N04   , Fn2 , v096
	.byte	W16
	.byte		N03   , Cs2 , v100
	.byte	W08
@ 013   ----------------------------------------
	.byte		N06   , Cn2 , v108
	.byte	W24
	.byte		N04   , Gs2 , v100
	.byte	W16
	.byte		N03   , Cn2 
	.byte	W08
	.byte		N06   , Gs1 , v112
	.byte	W24
	.byte		N04   , Gs2 , v100
	.byte	W16
	.byte		N03   , Gs1 
	.byte	W08
@ 014   ----------------------------------------
	.byte		N06   , As1 , v108
	.byte	W24
	.byte		N04   , Fs2 , v100
	.byte	W16
	.byte		N03   , As1 
	.byte	W08
	.byte		N06   , Fs1 , v108
	.byte	W24
	.byte		N04   , Fs2 , v100
	.byte	W16
	.byte		N03   , Ds2 
	.byte	W08
@ 015   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_2_007
@ 016   ----------------------------------------
	.byte		N06   , Cs2 , v108
	.byte	W18
	.byte		N01   , Cs2 , v052
	.byte	W06
	.byte		N06   , Fn2 , v096
	.byte	W16
	.byte		N03   , Cs2 , v100
	.byte	W08
	.byte		N06   , Gs1 , v108
	.byte	W18
	.byte		N01   , Cs2 , v052
	.byte	W06
	.byte		N06   , Fn2 , v096
	.byte	W16
	.byte		N03   , Cs2 , v100
	.byte	W08
@ 017   ----------------------------------------
	.byte		N06   , Cn2 , v108
	.byte	W24
	.byte		        Gs2 , v100
	.byte	W16
	.byte		N03   , Cn2 
	.byte	W08
	.byte		N06   , Gs1 , v112
	.byte	W24
	.byte		        Ds2 , v100
	.byte	W16
	.byte		N03   , Gs1 
	.byte	W08
@ 018   ----------------------------------------
	.byte		N06   , As1 , v108
	.byte	W24
	.byte		        Fs2 , v100
	.byte	W16
	.byte		N03   , Cs2 
	.byte	W08
	.byte		N06   , Fs1 , v108
	.byte	W24
	.byte		        Fs2 , v100
	.byte	W16
	.byte		N03   , Cs2 
	.byte	W08
@ 019   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_2_007
@ 020   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_2_002
@ 021   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_2_001
@ 022   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_2_002
@ 023   ----------------------------------------
	.byte		N03   , Ds3 , v100
	.byte	W48
	.byte		N23   , Gs2 
	.byte	W24
	.byte		N07   , Gs1 
	.byte	W08
	.byte		        As1 , v088
	.byte	W08
	.byte		        Cn2 , v096
	.byte	W08
	.byte	GOTO
	 .word	mus_goldenrod_2_B1
	.byte	FINE

@**************** Track 3 (Midi-Chn.3) ****************@

mus_goldenrod_3:
	.byte	KEYSH , mus_goldenrod_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 26
	.byte		VOL   , 95*mus_goldenrod_mvl/mxv
	.byte		PAN   , c_v+56
	.byte		MOD   , 0
	.byte	W24
	.byte		N03   , Cs4 , v096
	.byte		N03   , Gs4 , v100
	.byte	W48
	.byte		        Cs4 
	.byte		N03   , Gs4 
	.byte	W24
@ 001   ----------------------------------------
mus_goldenrod_3_001:
	.byte	W24
	.byte		N03   , Ds4 , v100
	.byte		N03   , Gs4 
	.byte	W48
	.byte		        Ds4 
	.byte		N03   , Gs4 
	.byte	W24
	.byte	PEND
@ 002   ----------------------------------------
mus_goldenrod_3_002:
	.byte	W24
	.byte		N03   , Cs4 , v092
	.byte		N03   , Gs4 , v100
	.byte	W48
	.byte		        Cs4 , v080
	.byte		N03   , Gs4 , v100
	.byte	W24
	.byte	PEND
@ 003   ----------------------------------------
	.byte		        Ds4 , v104
	.byte		N03   , Gs4 , v100
	.byte	W96
@ 004   ----------------------------------------
mus_goldenrod_3_B1:
	.byte		N05   , Cs3 
	.byte	W16
	.byte		        Gs3 
	.byte	W08
	.byte		        Cs4 
	.byte		N05   , Fn4 
	.byte	W24
	.byte		        Cn3 
	.byte	W16
	.byte		        Gs3 
	.byte	W08
	.byte		        Cn4 
	.byte		N05   , Ds4 
	.byte	W24
@ 005   ----------------------------------------
	.byte		        As2 
	.byte	W16
	.byte		        Fn3 
	.byte	W08
	.byte		        As3 
	.byte		N05   , Cs4 
	.byte	W24
	.byte		        Gs2 
	.byte	W16
	.byte		        Ds3 
	.byte	W08
	.byte		        Gs3 
	.byte		N05   , Cn4 
	.byte	W24
@ 006   ----------------------------------------
	.byte		        Fs2 
	.byte	W16
	.byte		        Fn3 
	.byte	W08
	.byte		        As3 
	.byte		N05   , Cs4 
	.byte	W24
	.byte		        Ds2 
	.byte	W16
	.byte		        Fs3 
	.byte	W08
	.byte		        As3 
	.byte		N05   , Cs4 
	.byte	W24
@ 007   ----------------------------------------
	.byte		        Gs2 
	.byte		N05   , Gs3 
	.byte		N05   , Cn4 
	.byte	W24
	.byte		        Gs2 
	.byte		N05   , Gs3 
	.byte		N05   , Cn4 
	.byte	W24
	.byte		        As2 
	.byte		N05   , As3 
	.byte		N05   , Cs4 
	.byte	W24
	.byte		        Cn3 
	.byte		N05   , Cn4 
	.byte		N05   , Ds4 
	.byte	W24
@ 008   ----------------------------------------
	.byte		N03   , Cs3 
	.byte	W08
	.byte		        Gs3 
	.byte	W08
	.byte		        Cs4 
	.byte	W08
	.byte		        Fn4 
	.byte	W24
	.byte		        Cn3 
	.byte	W08
	.byte		        Gs3 
	.byte	W08
	.byte		        Cn4 
	.byte	W08
	.byte		        Ds4 
	.byte	W24
@ 009   ----------------------------------------
	.byte		        As2 
	.byte	W08
	.byte		        Fn3 
	.byte	W08
	.byte		        Gs3 
	.byte	W08
	.byte		        Cs4 
	.byte	W24
	.byte		        Gs2 
	.byte	W08
	.byte		        Ds3 
	.byte	W08
	.byte		        Gs3 
	.byte	W08
	.byte		        Cn4 
	.byte	W24
@ 010   ----------------------------------------
	.byte		        Fs2 
	.byte	W08
	.byte		        Cs3 
	.byte	W08
	.byte		        Fs3 
	.byte	W08
	.byte		        As3 
	.byte	W24
	.byte		        Ds2 
	.byte	W08
	.byte		        Cs3 
	.byte	W08
	.byte		        Fs3 
	.byte	W08
	.byte		        As3 
	.byte	W24
@ 011   ----------------------------------------
	.byte		        Gs2 
	.byte		N03   , Cn4 
	.byte	W24
	.byte		        Gs2 
	.byte		N03   , Cn4 
	.byte	W08
	.byte		        Ds3 
	.byte	W08
	.byte		        Cn4 
	.byte	W08
	.byte		        As2 
	.byte		N03   , Cs4 
	.byte	W08
	.byte		        Fn3 
	.byte	W08
	.byte		        Cs4 
	.byte	W08
	.byte		        Cn3 
	.byte		N07   , Ds4 
	.byte	W08
	.byte		N03   , Gs3 
	.byte	W08
	.byte		        Ds4 
	.byte	W08
@ 012   ----------------------------------------
	.byte	W96
@ 013   ----------------------------------------
	.byte	W96
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	W96
@ 017   ----------------------------------------
	.byte	W96
@ 018   ----------------------------------------
	.byte	W96
@ 019   ----------------------------------------
	.byte	W96
@ 020   ----------------------------------------
	.byte	W24
	.byte		        Cs4 , v096
	.byte		N03   , Gs4 , v100
	.byte	W48
	.byte		        Cs4 
	.byte		N03   , Gs4 
	.byte	W24
@ 021   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_3_001
@ 022   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_3_002
@ 023   ----------------------------------------
	.byte		N03   , Ds4 , v104
	.byte		N03   , Gs4 , v100
	.byte	W96
	.byte	GOTO
	 .word	mus_goldenrod_3_B1
	.byte	FINE

@**************** Track 4 (Midi-Chn.4) ****************@

mus_goldenrod_4:
	.byte	KEYSH , mus_goldenrod_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 3
	.byte		VOL   , 110*mus_goldenrod_mvl/mxv
	.byte		PAN   , c_v-32
	.byte		MOD   , 0
	.byte		N03   , Cs3 , v116
	.byte	W16
	.byte		        Gs3 , v096
	.byte	W08
	.byte		        Cs4 
	.byte		N03   , Fn4 , v116
	.byte	W16
	.byte		        Gs3 , v100
	.byte	W08
	.byte		        Gs2 , v120
	.byte	W16
	.byte		        Gs3 , v088
	.byte	W08
	.byte		        Cs4 , v096
	.byte		N03   , Fn4 , v112
	.byte	W16
	.byte		        Gs3 , v100
	.byte	W08
@ 001   ----------------------------------------
mus_goldenrod_4_001:
	.byte		N03   , Ds3 , v108
	.byte	W16
	.byte		        As3 , v104
	.byte	W08
	.byte		        Cs4 , v108
	.byte		N03   , Fs4 , v116
	.byte	W08
	.byte		        As3 , v108
	.byte	W08
	.byte		        Cs4 
	.byte		N03   , Fs4 , v116
	.byte	W08
	.byte		        Gs2 , v096
	.byte	W16
	.byte		        As3 
	.byte	W08
	.byte		        Cs4 
	.byte		N03   , Fs4 , v120
	.byte	W16
	.byte		        As3 , v100
	.byte	W08
	.byte	PEND
@ 002   ----------------------------------------
mus_goldenrod_4_002:
	.byte		N03   , Cs3 , v112
	.byte	W16
	.byte		        Gs3 , v100
	.byte	W08
	.byte		        Cs4 , v108
	.byte		N03   , Fn4 , v116
	.byte	W16
	.byte		        Gs3 , v096
	.byte	W08
	.byte		        Gs2 , v116
	.byte	W16
	.byte		        Gs3 , v100
	.byte	W08
	.byte		        Cs4 , v088
	.byte		N03   , Fn4 , v116
	.byte	W16
	.byte		        Gs3 , v068
	.byte	W08
	.byte	PEND
@ 003   ----------------------------------------
	.byte		        Ds3 , v108
	.byte		N03   , As3 , v092
	.byte		N03   , Cs4 , v100
	.byte		N03   , Fs4 
	.byte	W48
	.byte		N44   , Gs2 , v104, gtp3
	.byte		N44   , An3 , v112, gtp3
	.byte		N44   , Cn4 , v116, gtp3
	.byte		N23   , Fn4 
	.byte	W24
	.byte		        Ds4 , v108
	.byte	W24
@ 004   ----------------------------------------
mus_goldenrod_4_B1:
	.byte		N03   , Cs3 , v100
	.byte	W08
	.byte		        Gs3 
	.byte	W08
	.byte		        Cs4 
	.byte	W08
	.byte		        Fn4 
	.byte	W24
	.byte		        Cn3 
	.byte	W08
	.byte		        Gs3 
	.byte	W08
	.byte		        Cn4 
	.byte	W08
	.byte		        Ds4 
	.byte	W24
@ 005   ----------------------------------------
	.byte		        As2 
	.byte	W08
	.byte		        Fn3 
	.byte	W08
	.byte		        Gs3 
	.byte	W08
	.byte		        Cs4 
	.byte	W24
	.byte		        Gs2 
	.byte	W08
	.byte		        Ds3 
	.byte	W08
	.byte		        Gs3 
	.byte	W08
	.byte		        Cn4 
	.byte	W24
@ 006   ----------------------------------------
	.byte		        Fs2 
	.byte	W08
	.byte		        Cs3 
	.byte	W08
	.byte		        Fs3 
	.byte	W08
	.byte		        As3 
	.byte	W24
	.byte		        Ds2 
	.byte	W08
	.byte		        Cs3 
	.byte	W08
	.byte		        Fs3 
	.byte	W08
	.byte		        As3 
	.byte	W24
@ 007   ----------------------------------------
	.byte		        Gs2 
	.byte		N03   , Cn4 
	.byte	W24
	.byte		        Gs2 
	.byte		N03   , Cn4 
	.byte	W08
	.byte		        Ds3 
	.byte	W08
	.byte		        Cn4 
	.byte	W08
	.byte		        As2 
	.byte		N03   , Cs4 
	.byte	W08
	.byte		        Fn3 
	.byte	W08
	.byte		        Cs4 
	.byte	W08
	.byte		        Cn3 
	.byte		N07   , Ds4 
	.byte	W08
	.byte		N03   , Gs3 
	.byte	W08
	.byte		        Ds4 
	.byte	W08
@ 008   ----------------------------------------
	.byte		N05   , Cs3 
	.byte	W16
	.byte		        Gs3 
	.byte	W08
	.byte		        Cs4 
	.byte		N05   , Fn4 
	.byte	W24
	.byte		        Cn3 
	.byte	W16
	.byte		        Gs3 
	.byte	W08
	.byte		        Cn4 
	.byte		N05   , Ds4 
	.byte	W24
@ 009   ----------------------------------------
	.byte		        As2 
	.byte	W16
	.byte		        Fn3 
	.byte	W08
	.byte		        As3 
	.byte		N05   , Cs4 
	.byte	W24
	.byte		        Gs2 
	.byte	W16
	.byte		        Ds3 
	.byte	W08
	.byte		        Gs3 
	.byte		N05   , Cn4 
	.byte	W24
@ 010   ----------------------------------------
	.byte		        Fs2 
	.byte	W16
	.byte		        Fn3 
	.byte	W08
	.byte		        As3 
	.byte		N05   , Cs4 
	.byte	W24
	.byte		        Ds2 
	.byte	W16
	.byte		        Fs3 
	.byte	W08
	.byte		        As3 
	.byte		N05   , Cs4 
	.byte	W24
@ 011   ----------------------------------------
	.byte		        Gs2 
	.byte		N05   , Gs3 
	.byte		N05   , Cn4 
	.byte	W24
	.byte		        Gs2 
	.byte		N05   , Gs3 
	.byte		N05   , Cn4 
	.byte	W24
	.byte		        As2 
	.byte		N05   , As3 
	.byte		N05   , Cs4 
	.byte	W24
	.byte		        Cn3 
	.byte		N05   , Cn4 
	.byte		N05   , Ds4 
	.byte	W24
@ 012   ----------------------------------------
	.byte		N36   , Fn3 , v120, gtp3
	.byte		N36   , Cs4 , v116, gtp3
	.byte	W40
	.byte		N03   , Gs3 , v120
	.byte		N03   , Fn4 
	.byte	W24
	.byte		N24   , Fn3 , v124, gtp3
	.byte		N24   , Cs4 , v116, gtp3
	.byte	W32
@ 013   ----------------------------------------
	.byte		N32   , Ds3 , v108, gtp3
	.byte		N32   , Cn4 , v120, gtp3
	.byte	W40
	.byte		N03   , Gs3 , v116
	.byte		N03   , Ds4 , v120
	.byte	W24
	.byte		N24   , Ds3 , v116, gtp3
	.byte		N24   , Cn4 , v120, gtp3
	.byte	W32
@ 014   ----------------------------------------
	.byte		N32   , Cs3 , v112, gtp3
	.byte		N32   , As3 , v112, gtp3
	.byte	W40
	.byte		N03   , Fs3 
	.byte		N03   , Cs4 
	.byte	W24
	.byte		N24   , Cs3 , v116, gtp3
	.byte		N24   , As3 , v108, gtp3
	.byte	W32
@ 015   ----------------------------------------
	.byte		N07   , Gs3 , v112
	.byte		N07   , Cn4 , v120
	.byte	W24
	.byte		N19   , Ds3 
	.byte		N19   , Gs3 
	.byte	W24
	.byte		        Ds3 , v084
	.byte		N19   , As3 , v112
	.byte	W24
	.byte		        Ds3 , v116
	.byte		N19   , Cn4 , v120
	.byte	W24
@ 016   ----------------------------------------
	.byte	W16
	.byte		N07   , Fn3 , v116
	.byte	W08
	.byte		        Cs4 , v100
	.byte		N07   , Fn4 , v120
	.byte	W08
	.byte		        Fn3 , v096
	.byte	W08
	.byte		        Cs4 , v076
	.byte		N07   , Fn4 , v120
	.byte	W24
	.byte		        Fn3 
	.byte	W08
	.byte		        Cs4 , v108
	.byte		N07   , Fn4 , v120
	.byte	W08
	.byte		        Fn3 , v104
	.byte	W08
	.byte		        Cs4 , v076
	.byte		N07   , Fn4 , v104
	.byte	W08
@ 017   ----------------------------------------
	.byte	W16
	.byte		        Ds3 , v108
	.byte	W08
	.byte		        Cn4 , v116
	.byte		N07   , Ds4 , v120
	.byte	W08
	.byte		        Ds3 , v092
	.byte	W08
	.byte		        Cn4 , v096
	.byte		N07   , Ds4 , v112
	.byte	W24
	.byte		        Ds3 , v116
	.byte	W08
	.byte		        Gs3 , v112
	.byte		N07   , Cn4 , v116
	.byte	W08
	.byte		        Ds3 
	.byte	W08
	.byte		        Gs3 , v072
	.byte		N07   , Cn4 , v096
	.byte	W08
@ 018   ----------------------------------------
	.byte	W16
	.byte		        Cs3 , v108
	.byte	W08
	.byte		        Fs3 , v104
	.byte		N07   , As3 , v112
	.byte	W08
	.byte		        Cs3 , v108
	.byte	W08
	.byte		        Fs3 , v088
	.byte		N07   , As3 , v076
	.byte	W24
	.byte		        Fn3 , v120
	.byte	W08
	.byte		        As3 , v088
	.byte		N07   , Cs4 , v096
	.byte	W08
	.byte		        Fn3 , v100
	.byte	W08
	.byte		        As3 , v068
	.byte		N07   , Cs4 , v088
	.byte	W08
@ 019   ----------------------------------------
	.byte		N11   , Gs3 , v116
	.byte		N11   , Cn4 , v120
	.byte	W24
	.byte		N21   , Ds3 , v112
	.byte		N21   , Gs3 
	.byte	W24
	.byte		        Fn3 , v084
	.byte		N21   , As3 , v108
	.byte	W24
	.byte		        Ds3 , v104
	.byte		N21   , Cn4 , v120
	.byte	W24
@ 020   ----------------------------------------
	.byte		N03   , Cs3 , v116
	.byte	W16
	.byte		        Gs3 , v096
	.byte	W08
	.byte		        Cs4 
	.byte		N03   , Fn4 , v116
	.byte	W16
	.byte		        Gs3 , v100
	.byte	W08
	.byte		        Gs2 , v120
	.byte	W16
	.byte		        Gs3 , v088
	.byte	W08
	.byte		        Cs4 , v096
	.byte		N03   , Fn4 , v112
	.byte	W16
	.byte		        Gs3 , v100
	.byte	W08
@ 021   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_4_001
@ 022   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_4_002
@ 023   ----------------------------------------
	.byte		N03   , Ds3 , v108
	.byte		N03   , As3 , v092
	.byte		N03   , Cs4 , v100
	.byte		N03   , Fs4 
	.byte	W48
	.byte		N44   , Gs2 , v104, gtp3
	.byte		N44   , An3 , v112, gtp3
	.byte		N44   , Cn4 , v116, gtp3
	.byte		N23   , Fn4 
	.byte	W24
	.byte		        Ds4 , v108
	.byte	W24
	.byte	GOTO
	 .word	mus_goldenrod_4_B1
	.byte	FINE

@**************** Track 5 (Midi-Chn.5) ****************@

mus_goldenrod_5:
	.byte	KEYSH , mus_goldenrod_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 39
	.byte		VOL   , 85*mus_goldenrod_mvl/mxv
	.byte		PAN   , c_v-44
	.byte		MOD   , 0
	.byte		N03   , Gn3 , v052
	.byte	W16
	.byte		        Gn3 , v020
	.byte	W08
	.byte		        Gn3 , v052
	.byte	W16
	.byte		        Gn3 , v020
	.byte	W08
	.byte		        Gn3 , v052
	.byte	W16
	.byte		        Gn3 , v020
	.byte	W08
	.byte		        Gn3 , v052
	.byte	W16
	.byte		        Gn3 , v020
	.byte	W08
@ 001   ----------------------------------------
mus_goldenrod_5_001:
	.byte		N03   , Gn3 , v052
	.byte	W16
	.byte		        Gn3 , v020
	.byte	W08
	.byte		        Gn3 , v052
	.byte	W16
	.byte		        Gn3 , v020
	.byte	W08
	.byte		        Gn3 , v052
	.byte	W16
	.byte		        Gn3 , v020
	.byte	W08
	.byte		        Gn3 , v052
	.byte	W16
	.byte		        Gn3 , v020
	.byte	W08
	.byte	PEND
@ 002   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_5_001
@ 003   ----------------------------------------
	.byte		N03   , Gn3 , v052
	.byte	W48
	.byte		N03   
	.byte	W16
	.byte		        Gn3 , v020
	.byte	W08
	.byte		        Gn3 , v052
	.byte	W16
	.byte		        Gn3 , v020
	.byte	W08
@ 004   ----------------------------------------
mus_goldenrod_5_004:
mus_goldenrod_5_B1:
	.byte		N15   , An2 , v100
	.byte	W16
	.byte		N03   , Gn3 , v064
	.byte	W08
	.byte		N11   , Cs1 , v100
	.byte	W16
	.byte		N03   , Gn3 , v064
	.byte	W08
	.byte		        Gn3 , v092
	.byte	W16
	.byte		        Gn3 , v064
	.byte	W08
	.byte		N11   , Cs1 , v100
	.byte	W16
	.byte		N03   , Gn3 , v064
	.byte	W08
	.byte	PEND
@ 005   ----------------------------------------
mus_goldenrod_5_005:
	.byte		N03   , Gn3 , v092
	.byte	W16
	.byte		        Gn3 , v064
	.byte	W08
	.byte		N11   , Cs1 , v100
	.byte	W16
	.byte		N03   , Gn3 , v064
	.byte	W08
	.byte		        Gn3 , v092
	.byte	W16
	.byte		        Gn3 , v064
	.byte	W08
	.byte		N11   , Cs1 , v100
	.byte	W16
	.byte		N03   , Gn3 , v064
	.byte	W08
	.byte	PEND
@ 006   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_5_005
@ 007   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_5_005
@ 008   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_5_005
@ 009   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_5_005
@ 010   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_5_005
@ 011   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_5_005
@ 012   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_5_004
@ 013   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_5_005
@ 014   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_5_005
@ 015   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_5_005
@ 016   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_5_005
@ 017   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_5_005
@ 018   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_5_005
@ 019   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_5_005
@ 020   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_5_001
@ 021   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_5_001
@ 022   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_5_001
@ 023   ----------------------------------------
	.byte		N03   , Gn3 , v052
	.byte	W48
	.byte		N03   
	.byte	W16
	.byte		        Gn3 , v020
	.byte	W08
	.byte		        Gn3 , v052
	.byte	W16
	.byte		        Gn3 , v020
	.byte	W08
	.byte	GOTO
	 .word	mus_goldenrod_5_B1
	.byte	FINE

@**************** Track 6 (Midi-Chn.6) ****************@

mus_goldenrod_6:
	.byte	KEYSH , mus_goldenrod_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 23
	.byte		VOL   , 90*mus_goldenrod_mvl/mxv
	.byte		PAN   , c_v-34
	.byte		MOD   , 0
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
mus_goldenrod_6_B1:
	.byte	W96
@ 005   ----------------------------------------
	.byte	W96
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte	W96
@ 009   ----------------------------------------
	.byte	W96
@ 010   ----------------------------------------
	.byte	W96
@ 011   ----------------------------------------
	.byte	W72
	.byte	W02
	.byte		N01   , As1 , v084
	.byte		N01   , Fs2 
	.byte	W02
	.byte		        Cn2 , v092
	.byte		N01   , Gs2 
	.byte	W02
	.byte		        Cs2 , v096
	.byte		N01   , As2 
	.byte	W02
	.byte		        Ds2 
	.byte		N01   , Cn3 
	.byte	W02
	.byte		        Fn2 , v100
	.byte		N01   , Cs3 
	.byte	W02
	.byte		        Gn2 
	.byte		N01   , Ds3 
	.byte	W02
	.byte		        Gs2 , v104
	.byte		N01   , Fn3 
	.byte	W02
	.byte		        As2 , v108
	.byte		N01   , Fs3 
	.byte	W02
	.byte		        Cn3 , v112
	.byte		N01   , Gs3 
	.byte	W02
	.byte		        Cs3 
	.byte		N01   , As3 
	.byte	W02
	.byte		        Ds3 , v116
	.byte		N01   , Cn4 
	.byte	W02
@ 012   ----------------------------------------
	.byte		N54   , Fn3 , v112, gtp1
	.byte		N54   , Cs4 , v116, gtp1
	.byte	W40
	.byte	W04
	.byte	W04
	.byte	W04
	.byte	W04
	.byte	W08
	.byte		N30   , Gs3 , v100, gtp1
	.byte		N30   , Fn4 , v108, gtp1
	.byte	W24
	.byte	W04
	.byte	W04
@ 013   ----------------------------------------
	.byte		N54   , Gs3 , v088, gtp1
	.byte		N54   , Ds4 , v116, gtp1
	.byte	W36
	.byte	W03
	.byte	W04
	.byte	W04
	.byte	W04
	.byte	W04
	.byte	W08
	.byte	W01
	.byte		N30   , Ds3 , v112, gtp1
	.byte		N30   , Cn4 , v120, gtp1
	.byte	W23
	.byte	W04
	.byte	W04
	.byte	W01
@ 014   ----------------------------------------
	.byte		N54   , Fs3 , v116, gtp1
	.byte		N54   , Cs4 , v108, gtp1
	.byte	W40
	.byte	W04
	.byte	W04
	.byte	W04
	.byte	W04
	.byte	W08
	.byte		N30   , Cs3 , v112, gtp1
	.byte		N30   , As3 , v112, gtp1
	.byte	W24
	.byte	W04
	.byte	W04
@ 015   ----------------------------------------
	.byte		N07   , Ds3 , v092
	.byte		N07   , Cn4 , v116
	.byte	W24
	.byte		N23   , Ds3 , v104
	.byte		N23   , Cn4 , v120
	.byte	W24
	.byte		        Fn3 , v116
	.byte		N23   , Cs4 
	.byte	W24
	.byte		N07   , Ds3 , v096
	.byte		N07   , Cn4 
	.byte	W08
	.byte		        Fn3 , v104
	.byte		N07   , Cs4 
	.byte	W08
	.byte		        Fs3 , v112
	.byte		N07   , Ds4 , v120
	.byte	W08
@ 016   ----------------------------------------
	.byte		N32   , Gs3 , v096, gtp3
	.byte		N32   , Fn4 , v120, gtp3
	.byte	W20
	.byte	W04
	.byte	W04
	.byte	W04
	.byte	W04
	.byte	W04
	.byte		N07   , Gs3 , v116
	.byte		N07   , Cs4 
	.byte	W24
	.byte		N30   , Gs3 , v108, gtp1
	.byte		N30   , Fn4 , v120, gtp1
	.byte	W20
	.byte	W04
	.byte	W04
	.byte	W04
@ 017   ----------------------------------------
	.byte		N36   , Gs3 , v112, gtp3
	.byte		N36   , Ds4 , v120, gtp3
	.byte	W20
	.byte	W04
	.byte	W04
	.byte	W04
	.byte	W04
	.byte	W04
	.byte		N07   , Gs3 , v112
	.byte		N07   , Cn4 , v116
	.byte	W24
	.byte		N30   , Gs3 , v120, gtp1
	.byte		N30   , Ds4 , v120, gtp1
	.byte	W20
	.byte	W04
	.byte	W04
	.byte	W04
@ 018   ----------------------------------------
	.byte		N36   , Fs3 , v092, gtp3
	.byte		N36   , Cs4 , v116, gtp3
	.byte	W20
	.byte	W04
	.byte	W04
	.byte	W04
	.byte	W04
	.byte	W04
	.byte		N07   , Fs3 , v112
	.byte		N07   , As3 
	.byte	W24
	.byte		N30   , Fs3 , v108, gtp1
	.byte		N30   , Cs4 , v116, gtp1
	.byte	W20
	.byte	W04
	.byte	W04
	.byte	W04
@ 019   ----------------------------------------
	.byte		N07   , Ds3 , v120
	.byte		N07   , Cn4 
	.byte	W24
	.byte		N23   , Ds3 , v104
	.byte		N23   , Cn4 , v116
	.byte	W24
	.byte		        Fn3 
	.byte		N23   , Cs4 
	.byte	W24
	.byte		        Fs3 , v112
	.byte		N23   , Ds4 , v120
	.byte	W24
@ 020   ----------------------------------------
	.byte	W96
@ 021   ----------------------------------------
	.byte	W96
@ 022   ----------------------------------------
	.byte	W96
@ 023   ----------------------------------------
	.byte	W96
	.byte	GOTO
	 .word	mus_goldenrod_6_B1
	.byte	FINE

@**************** Track 7 (Midi-Chn.7) ****************@

mus_goldenrod_7:
	.byte	KEYSH , mus_goldenrod_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 35
	.byte		VOL   , 102*mus_goldenrod_mvl/mxv
	.byte		PAN   , c_v+6
	.byte		MOD   , 0
	.byte	W96
@ 001   ----------------------------------------
mus_goldenrod_7_001:
	.byte		N03   , Fn4 , v104
	.byte		N03   , Gs4 
	.byte	W16
	.byte		N07   , Fn4 , v056
	.byte		N07   , Gs4 
	.byte	W08
	.byte		        Fs4 , v060
	.byte		N07   , As4 
	.byte	W08
	.byte		        Fn4 , v064
	.byte		N07   , Gs4 
	.byte	W08
	.byte		        Fs4 
	.byte		N07   , As4 
	.byte	W08
	.byte		        Fn4 , v072
	.byte		N07   , Gs4 
	.byte	W08
	.byte		        Fs4 , v084
	.byte		N07   , As4 
	.byte	W08
	.byte		        Fn4 , v092
	.byte		N07   , Gs4 
	.byte	W08
	.byte		        Fs4 , v100
	.byte		N07   , As4 
	.byte	W08
	.byte		        Fn4 , v108
	.byte		N07   , Gs4 
	.byte	W08
	.byte		        Fs4 , v104
	.byte		N07   , As4 
	.byte		N07   
	.byte	W08
	.byte	PEND
@ 002   ----------------------------------------
	.byte		N03   , Fn4 , v088
	.byte		N03   , Gs4 
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
mus_goldenrod_7_B1:
	.byte	W10
	.byte		N01   , Cs5 , v052
	.byte	W01
	.byte		        Ds5 , v080
	.byte		N07   , Fn5 , v124
	.byte	W28
	.byte	W01
	.byte		        Cs5 , v120
	.byte	W08
	.byte		N03   , Ds5 , v112
	.byte	W24
	.byte		N23   , Cn5 , v120
	.byte	W24
@ 005   ----------------------------------------
mus_goldenrod_7_005:
	.byte		N15   , Cs5 , v108
	.byte	W16
	.byte		N07   , Cn5 , v112
	.byte	W08
	.byte		N15   , As4 , v116
	.byte	W16
	.byte		N07   , Cn5 
	.byte	W08
	.byte		N36   , Gs4 , v116, gtp3
	.byte	W48
	.byte	PEND
@ 006   ----------------------------------------
	.byte	W12
	.byte		N03   , Gs4 , v120
	.byte	W04
	.byte		        As4 , v124
	.byte	W24
	.byte		N07   , Cs5 , v116
	.byte	W08
	.byte		N11   , As4 , v120
	.byte	W16
	.byte		N07   , As5 
	.byte	W08
	.byte		N15   , Gs5 
	.byte	W16
	.byte		N07   , Fs5 , v112
	.byte	W08
@ 007   ----------------------------------------
	.byte		N15   , Fn5 , v120
	.byte	W16
	.byte		N07   , Fs5 , v108
	.byte	W08
	.byte		N15   , Gs5 , v116
	.byte	W16
	.byte		N07   , Fn5 , v120
	.byte	W08
	.byte		N32   , Ds5 , v112, gtp3
	.byte	W48
@ 008   ----------------------------------------
	.byte	W10
	.byte		N01   , Cs5 , v088
	.byte	W02
	.byte		N03   , Ds5 , v116
	.byte	W04
	.byte		N07   , Fn5 , v124
	.byte	W24
	.byte		        Cs5 , v120
	.byte	W08
	.byte		N03   , Ds5 , v112
	.byte	W24
	.byte		N23   , Cn5 , v120
	.byte	W24
@ 009   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_7_005
@ 010   ----------------------------------------
	.byte	W12
	.byte		N03   , Gs4 , v100
	.byte	W04
	.byte		        As4 , v124
	.byte	W24
	.byte		N07   , Cs5 , v116
	.byte	W08
	.byte		N11   , As4 , v120
	.byte	W16
	.byte		N07   , As5 
	.byte	W08
	.byte		N15   , Gs5 
	.byte	W16
	.byte		N07   , Fs5 , v112
	.byte	W08
@ 011   ----------------------------------------
	.byte		N15   , Gs5 , v120
	.byte	W16
	.byte		N07   , As5 , v108
	.byte	W08
	.byte		N15   , Cn6 , v116
	.byte	W16
	.byte		N07   , Cs6 , v120
	.byte	W08
	.byte		N36   , Ds6 , v112, gtp3
	.byte	W48
@ 012   ----------------------------------------
	.byte		N32   , Cs5 , v120, gtp3
	.byte	W40
	.byte		N03   , Fn5 , v124
	.byte	W24
	.byte		N28   , Cs5 , v120, gtp1
	.byte	W32
@ 013   ----------------------------------------
	.byte		N36   , Cn5 , v120, gtp1
	.byte	W36
	.byte	W01
	.byte		N04   , Cs5 , v112
	.byte	W03
	.byte		N05   , Ds5 , v120
	.byte	W22
	.byte		N30   , Cn5 , v124, gtp1
	.byte	W32
	.byte	W02
@ 014   ----------------------------------------
	.byte		N36   , As4 , v120, gtp1
	.byte	W36
	.byte	W02
	.byte		N04   , Cn5 
	.byte	W03
	.byte		N05   , Cs5 
	.byte	W22
	.byte		N30   , As4 , v120, gtp1
	.byte	W32
	.byte	W01
@ 015   ----------------------------------------
	.byte		N07   , Cn5 , v124
	.byte	W24
	.byte		N21   , Gs4 , v120
	.byte	W24
	.byte		        As4 
	.byte	W24
	.byte		        Cn5 
	.byte	W24
@ 016   ----------------------------------------
	.byte		N32   , Cs5 , v116, gtp3
	.byte	W36
	.byte		N06   , Ds5 
	.byte	W04
	.byte		N05   , Fn5 , v124
	.byte	W22
	.byte		N28   , Cs5 , v116, gtp1
	.byte	W32
	.byte	W02
@ 017   ----------------------------------------
	.byte		N36   , Cn5 , v120
	.byte	W36
	.byte		N06   , Cs5 , v108
	.byte	W03
	.byte		N05   , Ds5 , v120
	.byte	W24
	.byte	W01
	.byte		N07   , Cn5 
	.byte	W08
	.byte		N09   , Ds5 , v112
	.byte	W07
	.byte		N07   , Cs5 
	.byte	W08
	.byte		        Cn5 , v120
	.byte	W08
	.byte		N30   , As4 , v116, gtp1
	.byte	W01
@ 018   ----------------------------------------
	.byte	W36
	.byte		N06   , As4 , v092
	.byte	W03
	.byte		N04   , Cn5 , v112
	.byte	W01
	.byte		N08   , Cs5 , v120
	.byte	W24
	.byte		N30   , As4 , v120, gtp1
	.byte	W30
	.byte	W01
	.byte		N05   , Cn5 , v124
	.byte	W01
@ 019   ----------------------------------------
	.byte	W24
	.byte		N21   , Gs4 , v120
	.byte	W24
	.byte		N23   , As4 
	.byte	W24
	.byte		N21   , Cn5 , v124
	.byte	W24
@ 020   ----------------------------------------
	.byte	W96
@ 021   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_7_001
@ 022   ----------------------------------------
	.byte		N03   , Fn4 , v088
	.byte		N03   , Gs4 
	.byte	W96
@ 023   ----------------------------------------
	.byte	W96
	.byte	GOTO
	 .word	mus_goldenrod_7_B1
	.byte	FINE

@**************** Track 8 (Midi-Chn.8) ****************@

mus_goldenrod_8:
	.byte	KEYSH , mus_goldenrod_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 4
	.byte		VOL   , 45*mus_goldenrod_mvl/mxv
	.byte		PAN   , c_v+56
	.byte		MOD   , 0
	.byte	W06
	.byte		N03   , Cs3 , v116
	.byte	W16
	.byte		        Gs3 , v096
	.byte	W08
	.byte		        Cs4 
	.byte		N03   , Fn4 , v116
	.byte	W16
	.byte		        Gs3 , v100
	.byte	W08
	.byte		        Gs2 , v120
	.byte	W16
	.byte		        Gs3 , v088
	.byte	W08
	.byte		        Cs4 , v096
	.byte		N03   , Fn4 , v112
	.byte	W16
	.byte		        Gs3 , v100
	.byte	W02
@ 001   ----------------------------------------
mus_goldenrod_8_001:
	.byte	W06
	.byte		N03   , Ds3 , v108
	.byte	W16
	.byte		        As3 , v104
	.byte	W08
	.byte		        Cs4 , v108
	.byte		N03   , Fs4 , v116
	.byte	W08
	.byte		        As3 , v108
	.byte	W08
	.byte		        Cs4 
	.byte		N03   , Fs4 , v116
	.byte	W08
	.byte		        Gs2 , v096
	.byte	W16
	.byte		        As3 
	.byte	W08
	.byte		        Cs4 
	.byte		N03   , Fs4 , v120
	.byte	W16
	.byte		        As3 , v100
	.byte	W02
	.byte	PEND
@ 002   ----------------------------------------
mus_goldenrod_8_002:
	.byte	W06
	.byte		N03   , Cs3 , v112
	.byte	W16
	.byte		        Gs3 , v100
	.byte	W08
	.byte		        Cs4 , v108
	.byte		N03   , Fn4 , v116
	.byte	W16
	.byte		        Gs3 , v096
	.byte	W08
	.byte		        Gs2 , v116
	.byte	W16
	.byte		        Gs3 , v100
	.byte	W08
	.byte		        Cs4 , v088
	.byte		N03   , Fn4 , v116
	.byte	W16
	.byte		        Gs3 , v068
	.byte	W02
	.byte	PEND
@ 003   ----------------------------------------
mus_goldenrod_8_003:
	.byte	W06
	.byte		N03   , Ds3 , v108
	.byte		N03   , As3 , v092
	.byte		N03   , Cs4 , v100
	.byte		N03   , Fs4 
	.byte	W48
	.byte		N44   , Gs2 , v104, gtp3
	.byte		N44   , An3 , v112, gtp3
	.byte		N44   , Cn4 , v116, gtp3
	.byte		N23   , Fn4 
	.byte	W24
	.byte		        Ds4 , v108
	.byte	W18
	.byte	PEND
@ 004   ----------------------------------------
mus_goldenrod_8_B1:
	.byte	W96
@ 005   ----------------------------------------
	.byte	W96
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte	W96
@ 009   ----------------------------------------
	.byte	W96
@ 010   ----------------------------------------
	.byte	W96
@ 011   ----------------------------------------
	.byte	W96
@ 012   ----------------------------------------
	.byte	W96
@ 013   ----------------------------------------
	.byte	W96
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	W96
@ 017   ----------------------------------------
	.byte	W96
@ 018   ----------------------------------------
	.byte	W96
@ 019   ----------------------------------------
	.byte	W96
@ 020   ----------------------------------------
	.byte	W06
	.byte		N03   , Cs3 , v116
	.byte	W16
	.byte		        Gs3 , v096
	.byte	W08
	.byte		        Cs4 
	.byte		N03   , Fn4 , v116
	.byte	W16
	.byte		        Gs3 , v100
	.byte	W08
	.byte		        Gs2 , v120
	.byte	W16
	.byte		        Gs3 , v088
	.byte	W08
	.byte		        Cs4 , v096
	.byte		N03   , Fn4 , v112
	.byte	W16
	.byte		        Gs3 , v100
	.byte	W02
@ 021   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_8_001
@ 022   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_8_002
@ 023   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_8_003
	.byte	GOTO
	 .word	mus_goldenrod_8_B1
	.byte	FINE

@**************** Track 9 (Midi-Chn.9) ****************@

mus_goldenrod_9:
	.byte	KEYSH , mus_goldenrod_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 35
	.byte		VOL   , 45*mus_goldenrod_mvl/mxv
	.byte		PAN   , c_v+56
	.byte		MOD   , 0
	.byte	W96
@ 001   ----------------------------------------
mus_goldenrod_9_001:
	.byte	W06
	.byte		N03   , Fn4 , v092
	.byte		N03   , Gs4 
	.byte	W16
	.byte		N07   , Fn4 , v056
	.byte		N07   , Gs4 
	.byte	W08
	.byte		        Fs4 , v060
	.byte		N07   , As4 
	.byte	W08
	.byte		        Fn4 , v064
	.byte		N07   , Gs4 
	.byte	W08
	.byte		        Fs4 
	.byte		N07   , As4 
	.byte	W08
	.byte		        Fn4 , v072
	.byte		N07   , Gs4 
	.byte	W08
	.byte		        Fs4 , v084
	.byte		N07   , As4 
	.byte	W08
	.byte		        Fn4 , v092
	.byte		N07   , Gs4 
	.byte	W08
	.byte		        Fs4 , v100
	.byte		N07   , As4 
	.byte	W08
	.byte		        Fn4 , v108
	.byte		N07   , Gs4 
	.byte	W08
	.byte		        Fs4 , v104
	.byte		N07   , As4 
	.byte		N07   
	.byte	W02
	.byte	PEND
@ 002   ----------------------------------------
	.byte	W06
	.byte		N03   , Fn4 , v088
	.byte		N03   , Gs4 
	.byte	W90
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
mus_goldenrod_9_B1:
	.byte	W16
	.byte		N01   , Cs5 , v052
	.byte	W01
	.byte		        Ds5 , v080
	.byte		N07   , Fn5 , v124
	.byte	W28
	.byte	W01
	.byte		        Cs5 , v120
	.byte	W08
	.byte		N03   , Ds5 , v112
	.byte	W24
	.byte		N23   , Cn5 , v120
	.byte	W18
@ 005   ----------------------------------------
mus_goldenrod_9_005:
	.byte	W06
	.byte		N15   , Cs5 , v108
	.byte	W16
	.byte		N07   , Cn5 , v112
	.byte	W08
	.byte		N15   , As4 , v116
	.byte	W16
	.byte		N07   , Cn5 
	.byte	W08
	.byte		N36   , Gs4 , v116, gtp3
	.byte	W42
	.byte	PEND
@ 006   ----------------------------------------
	.byte	W18
	.byte		N03   , Gs4 , v120
	.byte	W04
	.byte		        As4 , v124
	.byte	W24
	.byte		N07   , Cs5 , v116
	.byte	W08
	.byte		N11   , As4 , v120
	.byte	W16
	.byte		N07   , As5 
	.byte	W08
	.byte		N15   , Gs5 
	.byte	W16
	.byte		N07   , Fs5 , v112
	.byte	W02
@ 007   ----------------------------------------
	.byte	W06
	.byte		N15   , Fn5 , v120
	.byte	W16
	.byte		N07   , Fs5 , v108
	.byte	W08
	.byte		N15   , Gs5 , v116
	.byte	W16
	.byte		N07   , Fn5 , v120
	.byte	W08
	.byte		N32   , Ds5 , v112, gtp3
	.byte	W42
@ 008   ----------------------------------------
	.byte	W16
	.byte		N01   , Cs5 , v088
	.byte	W02
	.byte		N03   , Ds5 , v116
	.byte	W04
	.byte		N07   , Fn5 , v124
	.byte	W24
	.byte		        Cs5 , v120
	.byte	W08
	.byte		N03   , Ds5 , v112
	.byte	W24
	.byte		N23   , Cn5 , v120
	.byte	W18
@ 009   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_9_005
@ 010   ----------------------------------------
	.byte	W18
	.byte		N03   , Gs4 , v100
	.byte	W04
	.byte		        As4 , v124
	.byte	W24
	.byte		N07   , Cs5 , v116
	.byte	W08
	.byte		N11   , As4 , v120
	.byte	W16
	.byte		N07   , As5 
	.byte	W08
	.byte		N15   , Gs5 
	.byte	W16
	.byte		N07   , Fs5 , v112
	.byte	W02
@ 011   ----------------------------------------
	.byte	W06
	.byte		N15   , Gs5 , v120
	.byte	W16
	.byte		N07   , As5 , v108
	.byte	W08
	.byte		N15   , Cn6 , v116
	.byte	W16
	.byte		N07   , Cs6 , v120
	.byte	W08
	.byte		N36   , Ds6 , v112, gtp3
	.byte	W42
@ 012   ----------------------------------------
	.byte	W06
	.byte		N32   , Cs5 , v120, gtp3
	.byte	W40
	.byte		N03   , Fn5 , v124
	.byte	W24
	.byte		N28   , Cs5 , v120, gtp1
	.byte	W24
	.byte	W02
@ 013   ----------------------------------------
	.byte	W06
	.byte		N36   , Cn5 , v120, gtp1
	.byte	W36
	.byte	W01
	.byte		N04   , Cs5 , v112
	.byte	W03
	.byte		N05   , Ds5 , v120
	.byte	W22
	.byte		N30   , Cn5 , v124, gtp1
	.byte	W28
@ 014   ----------------------------------------
	.byte	W06
	.byte		N36   , As4 , v120, gtp1
	.byte	W36
	.byte	W02
	.byte		N04   , Cn5 
	.byte	W03
	.byte		N05   , Cs5 
	.byte	W22
	.byte		N30   , As4 , v120, gtp1
	.byte	W24
	.byte	W03
@ 015   ----------------------------------------
	.byte	W06
	.byte		N07   , Cn5 , v124
	.byte	W24
	.byte		N21   , Gs4 , v120
	.byte	W24
	.byte		        As4 
	.byte	W24
	.byte		        Cn5 
	.byte	W18
@ 016   ----------------------------------------
	.byte	W06
	.byte		N32   , Cs5 , v116, gtp3
	.byte	W36
	.byte		N06   , Ds5 
	.byte	W04
	.byte		N05   , Fn5 , v124
	.byte	W22
	.byte		N28   , Cs5 , v116, gtp1
	.byte	W28
@ 017   ----------------------------------------
	.byte	W06
	.byte		N36   , Cn5 , v120
	.byte	W36
	.byte		N06   , Cs5 , v108
	.byte	W03
	.byte		N05   , Ds5 , v120
	.byte	W24
	.byte	W01
	.byte		N07   , Cn5 
	.byte	W08
	.byte		N09   , Ds5 , v112
	.byte	W07
	.byte		N07   , Cs5 
	.byte	W08
	.byte		        Cn5 , v120
	.byte	W03
@ 018   ----------------------------------------
	.byte	W05
	.byte		N30   , As4 , v116, gtp1
	.byte	W36
	.byte	W01
	.byte		N06   , As4 , v092
	.byte	W03
	.byte		N04   , Cn5 , v112
	.byte	W01
	.byte		N08   , Cs5 , v120
	.byte	W24
	.byte		N30   , As4 , v120, gtp1
	.byte	W24
	.byte	W02
@ 019   ----------------------------------------
	.byte	W05
	.byte		N05   , Cn5 , v124
	.byte	W24
	.byte	W01
	.byte		N21   , Gs4 , v120
	.byte	W24
	.byte		N23   , As4 
	.byte	W24
	.byte		N21   , Cn5 , v124
	.byte	W18
@ 020   ----------------------------------------
	.byte	W96
@ 021   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_9_001
@ 022   ----------------------------------------
	.byte	W06
	.byte		N03   , Fn4 , v088
	.byte		N03   , Gs4 
	.byte	W90
	.byte   W02
@ 023   ----------------------------------------
	.byte	W96
	.byte	GOTO
	 .word	mus_goldenrod_9_B1
	.byte	FINE

@**************** Track 10 (Midi-Chn.11) ****************@

mus_goldenrod_10:
	.byte	KEYSH , mus_goldenrod_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 8
	.byte		VOL   , 98*mus_goldenrod_mvl/mxv
	.byte		PAN   , c_v-44
	.byte		MOD   , 0
	.byte		N56   , Fn3 , v092, gtp3
	.byte	W48
	.byte	W04
	.byte	W04
	.byte	W40
@ 001   ----------------------------------------
	.byte	W48
	.byte	W04
	.byte	W04
	.byte	W04
	.byte	W36
@ 002   ----------------------------------------
	.byte		        Fn3 , v092, gtp3
	.byte	W48
	.byte	W04
	.byte	W04
	.byte	W40
@ 003   ----------------------------------------
	.byte	W48
	.byte	W04
	.byte	W04
	.byte	W04
	.byte	W32
	.byte	W04
@ 004   ----------------------------------------
mus_goldenrod_10_004:
mus_goldenrod_10_B1:
	.byte		N42   , Fn3 , v092, gtp1
	.byte	W48
	.byte		        Ds3 , v096, gtp1
	.byte	W48
	.byte	PEND
@ 005   ----------------------------------------
	.byte		        Cs3 , v092, gtp1
	.byte	W48
	.byte		        Cn3 , v096, gtp1
	.byte	W48
@ 006   ----------------------------------------
	.byte		N60   , As2 , v092, gtp3
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_10_004
@ 009   ----------------------------------------
	.byte		N42   , Cs3 , v092, gtp1
	.byte	W48
	.byte		N23   , Cn3 
	.byte	W24
	.byte		        Fn3 , v096
	.byte	W24
@ 010   ----------------------------------------
	.byte		N66   , As2 , v092, gtp1
	.byte	W96
@ 011   ----------------------------------------
	.byte	W96
@ 012   ----------------------------------------
mus_goldenrod_10_012:
	.byte		N56   , Cs3 , v100, gtp3
	.byte	W48
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W36
	.byte	W03
	.byte	PEND
@ 013   ----------------------------------------
	.byte	W96
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_10_012
@ 017   ----------------------------------------
	.byte	W96
@ 018   ----------------------------------------
	.byte	W96
@ 019   ----------------------------------------
	.byte	W96
@ 020   ----------------------------------------
	.byte		N44   , Fn3 , v080, gtp3
	.byte	W96
@ 021   ----------------------------------------
	.byte		        Fs3 , v080, gtp3
	.byte	W96
@ 022   ----------------------------------------
	.byte		N42   , Cs3 , v080, gtp1
	.byte	W48
	.byte		        Fn3 , v088, gtp1
	.byte	W48
@ 023   ----------------------------------------
	.byte		N10   , Ds3 , v080
	.byte	W96
	.byte	GOTO
	 .word	mus_goldenrod_10_B1
	.byte	FINE

@**************** Track 11 (Midi-Chn.12) ****************@

mus_goldenrod_11:
	.byte	KEYSH , mus_goldenrod_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 8
	.byte		VOL   , 40*mus_goldenrod_mvl/mxv
	.byte		PAN   , c_v+56
	.byte		MOD   , 0
	.byte	W18
	.byte		N56   , Fn3 , v092, gtp3
	.byte	W48
	.byte	W04
	.byte	W04
	.byte	W22
@ 001   ----------------------------------------
	.byte	W18
	.byte	W48
	.byte	W04
	.byte	W04
	.byte	W04
	.byte	W18
@ 002   ----------------------------------------
	.byte	W18
	.byte		        Fn3 , v092, gtp3
	.byte	W48
	.byte	W04
	.byte	W04
	.byte	W22
@ 003   ----------------------------------------
	.byte	W18
	.byte	W48
	.byte	W04
	.byte	W04
	.byte	W04
	.byte	W18
@ 004   ----------------------------------------
mus_goldenrod_11_B1:
	.byte	W14
	.byte	W04
	.byte		N42   , Fn3 , v092, gtp1
	.byte	W48
	.byte		        Ds3 , v096, gtp1
	.byte	W30
@ 005   ----------------------------------------
	.byte	W18
	.byte		        Cs3 , v092, gtp1
	.byte	W48
	.byte		        Cn3 , v096, gtp1
	.byte	W30
@ 006   ----------------------------------------
	.byte	W18
	.byte		N60   , As2 , v092, gtp3
	.byte	W78
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte	W18
	.byte		N42   , Fn3 , v092, gtp1
	.byte	W48
	.byte		        Ds3 , v096, gtp1
	.byte	W30
@ 009   ----------------------------------------
	.byte	W18
	.byte		        Cs3 , v092, gtp1
	.byte	W48
	.byte		N23   , Cn3 
	.byte	W24
	.byte		        Fn3 , v096
	.byte	W06
@ 010   ----------------------------------------
	.byte	W18
	.byte		N66   , As2 , v092, gtp1
	.byte	W78
@ 011   ----------------------------------------
	.byte	W96
@ 012   ----------------------------------------
mus_goldenrod_11_012:
	.byte	W18
	.byte		N56   , Cs3 , v100, gtp3
	.byte	W48
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W21
	.byte	PEND
@ 013   ----------------------------------------
	.byte	W18
	.byte	W78
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	PATT
	 .word	mus_goldenrod_11_012
@ 017   ----------------------------------------
	.byte	W18
	.byte	W78
@ 018   ----------------------------------------
	.byte	W96
@ 019   ----------------------------------------
	.byte	W96
@ 020   ----------------------------------------
	.byte	W18
	.byte		N44   , Fn3 , v080, gtp3
	.byte	W78
@ 021   ----------------------------------------
	.byte	W18
	.byte		        Fs3 , v080, gtp3
	.byte	W78
@ 022   ----------------------------------------
	.byte	W18
	.byte		N42   , Cs3 , v080, gtp1
	.byte	W48
	.byte		        Fn3 , v088, gtp1
	.byte	W30
@ 023   ----------------------------------------
	.byte	W18
	.byte		N10   , Ds3 , v072
	.byte	W78
	.byte	GOTO
	 .word	mus_goldenrod_11_B1
	.byte	FINE

@******************************************************@
	.align	2

mus_goldenrod:
	.byte	11	@ NumTrks
	.byte	0	@ NumBlks
	.byte	mus_goldenrod_pri	@ Priority
	.byte	mus_goldenrod_rev	@ Reverb.

	.word	mus_goldenrod_grp

	.word	mus_goldenrod_1
	.word	mus_goldenrod_2
	.word	mus_goldenrod_3
	.word	mus_goldenrod_4
	.word	mus_goldenrod_5
	.word	mus_goldenrod_6
	.word	mus_goldenrod_7
	.word	mus_goldenrod_8
	.word	mus_goldenrod_9
	.word	mus_goldenrod_10
	.word	mus_goldenrod_11

	.end
