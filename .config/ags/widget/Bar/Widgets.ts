import { bind, Variable } from "astal"
import { Widget } from "astal/gtk3"

import Hyprland from "gi://AstalHyprland"
import Battery from "gi://AstalBattery"

export function WorkspaceWidget(css: string) {
    const hyprland = Hyprland.get_default();
}

export function BatteryWidget(css: string) {
    const battery = Battery.get_default()

    const batteryVar = Variable.derive([
        bind(battery, "percentage"),
        bind(battery, "batteryIconName")
    ])

    return new Widget.Box(
        {
            css,
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
                label: batteryVar(_ => Math.round(battery.percentage * 100).toString()),
                visible: bind(battery, "isBattery")
            }),
            new Widget.Label({ label: "%" }),
        )
    )
}

export function TimeWidget(css: string) {
    const time = Variable("").poll(1000, "date")

    let date;
    return new Widget.Label(
        {
            css: css,
            label: time(_ => {
                date = new Date();
                return date.getHours()
                    + (date.getSeconds() % 2 ? " " : ":") // blinking : 
                    + (date.getMinutes() < 10 ? "0" : "") // to add a zero to single digits
                    + date.getMinutes()
                    + " 🕗"
            })
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
            }) + " 📅"
            )
        }
    )
}

