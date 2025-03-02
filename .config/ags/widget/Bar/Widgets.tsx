import {bind, Variable} from "astal"

import BatteryAPI from "gi://AstalBattery"

import {getBatteryIcon} from "../utils/battery"

export function Battery({css}: { css: string }) {
    const battery = BatteryAPI.get_default()

    let batteryWarningInterval: GLib.Source | null = null

    function warningSound() {
        execAsync('bash -c "play $HOME/.config/hypr/assets/sounds/battery-low.ogg"')
    }

    const batteryVar = Variable.derive([
        bind(battery, "percentage"),
        bind(battery, "state")
    ])

    return <label
        css={css}
        className={batteryVar((value) => {
            if (value[0] > 0.04 || battery.state === BatteryAPI.State.CHARGING) {
                if (batteryWarningInterval != null) {
                    batteryWarningInterval.destroy()
                    batteryWarningInterval = null
                }
                return "iconButton"
            } else {
                if (batteryWarningInterval === null && battery.isBattery) {
                    batteryWarningInterval = setInterval(() => {
                        warningSound()
                    }, 120_000)
                    warningSound()
                }
                return "warningIconButton"
            }
        })}
        label={batteryVar(() => getBatteryIcon(battery) + " " + battery.percentage * 100 + "%")}
        visible={bind(battery, "isBattery")}/>
}

export function Time({css}: { css: string }) {
    const time = Variable("").poll(1000, "date")

    return <label css={css} label={ time(t => `🕗  ${t}`) }/>
}
