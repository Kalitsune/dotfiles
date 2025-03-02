import {bind, Variable} from "astal"
import { Widget } from "astal/gtk3"

import Battery from "gi://AstalBattery"

import {getBatteryIcon} from "../utils/battery"

export function BatteryWidget(css: string) {
    const battery = Battery.get_default()

    let batteryWarningInterval: GLib.Source | null = null

    function warningSound() {
        execAsync('bash -c "play $HOME/.config/hypr/assets/sounds/battery-low.ogg"')
    }

    const batteryVar = Variable.derive([
        bind(battery, "percentage"),
        bind(battery, "state")
    ])

    return new Widget.Label({
        css,
        className: batteryVar(value => {
            if (value[0] > 0.04 || battery.state === Battery.State.CHARGING) {
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
        }),
        label: batteryVar(() => getBatteryIcon(battery) + " " + Math.round(battery.percentage * 100) + "%"),
        visible: bind(battery, "isBattery")
    })
}

export function TimeWidget(css: string) {
    const time = Variable("").poll(1000, "date")

    return new Widget.Label(
        {
            css: css,
            label: time(_ =>
                new Date().getHours()
                + (new Date().getSeconds() % 2 ? " " : ":") 
                + new Date().getMinutes()
                +  " 🕗"
            ) 
        }
    ) 
}

export function DateWidget(css: string) {
    const time = Variable("").poll(1000, "date")

    return new Widget.Label(
        {
            css: css,
            label: time(_ => new Date().toLocaleDateString("en-US", {
                    month: "short",
                    day: "numeric",
                }) +  " 📅"
            ) 
        }
    ) 
}

