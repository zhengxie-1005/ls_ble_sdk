#ifndef SLEEP_H_
#define SLEEP_H_
#include <stdint.h>
#include <stdbool.h>
#define XTAL_STB_VAL (0x20)
#define XTAL_STARTUP_CYCLES (XTAL_STB_VAL + 4)

uint8_t get_deep_sleep_enable(void);

void dcdc_on(void);

void dcdc_off(void);

void cpu_sleep_recover_init(void);

void low_power_mode_set(uint8_t mode);

void deep_sleep(void);

void ble_sleep(void);

void ble_irq_clr_and_enable(void);

void ble_wkup_status_set(bool);

bool ble_wkup_status_get(void);

void clr_ble_wkup_req(void);

void irq_disable_before_wfi(void);

#endif

