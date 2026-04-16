#ifndef GUARD_CLOCK_H
#define GUARD_CLOCK_H

#include "main.h"

// TODO: time of day and seconds in a day defines

void StartWallClockWithCallback(MainCallback callback);
void DoTimeBasedEvents(void);

#endif // GUARD_CLOCK_H
