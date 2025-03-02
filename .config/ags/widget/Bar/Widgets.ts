import {bind, Variable} from "astal"
import { Widget } from "astal/gtk3"

import Battery from "gi://AstalBattery"

import {getBatteryIconName} from "./battery-utils"

export function BatteryWidget(css: string) {
    const battery = Battery.get_default()

    let batteryWarningInterval: GLib.Source | null = null

    function warningSound() {
        execAsync('bash -c "play $HOME/.config/hypr/assets/sounds/battery-low.ogg"')
    }

    const batteryVar = Variable.derive([
        bind(battery, "percentage"),
        bind(battery, "batteryIconName")
    ])

    return new Widget.Box(
        {
            spacing: 10
        }, 
        new Widget.Icon({
            icon: batteryVar(_ => battery.batteryIconName),            
        }),
        new Widget.Box(
            {
                spacing: 5
            },
            new Widget.Label({
                css,
                label: batteryVar(_ => Math.round(battery.percentage * 100).toString()),
                visible: bind(battery, "isBattery")
            }),
            new Widget.Label({label: "%"}),
        )
    )
}

export function TimeWidget(css: string) {
    const time = Variable("").poll(1000, "date")

    return new Widget.Label(
        {
            css: css,
            label: time(_ =>
                new Date().getHours()
                + (new Date().getSeconds() % 2 ? " " : ":") // blinking : 
                + (new Date().getMinutes() < 10 ? "0" : "") // to add a zero to single digits
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

