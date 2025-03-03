import { App, Astal, Gtk, Gdk, Widget } from "astal/gtk3"

import {
    BatteryWidget,
    TimeWidget,
    DateWidget
} from "./Widgets";

export default function Bar(gdkmonitor: Gdk.Monitor) {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor
    let widgetCss = `
        background: #1e1e2e;
        border-radius: 10px;
        margin: 8px;

        padding-left:   20px;
        padding-right:  20px;
        padding-top:    6px;
        padding-bottom: 6px;
    `;

    return new Widget.Window(
        {
            className: "Bar",
            gdkmonitor: gdkmonitor,
            exclusivity: Astal.Exclusivity.EXCLUSIVE,
            anchor: TOP | LEFT | RIGHT,
            application: App,
        },
        new Widget.CenterBox(
            {
                className: "window",
                css: `
                    padding: 2px;
                    padding-left: 15px;
                    padding-right: 15px;
                    min-height: 30px;
                `,
            },
            new Widget.Box(
                {
                    halign: Gtk.Align.START,
                },
            ),
            new Widget.Box(
                {
                    spacing: 10,
                },
                DateWidget(widgetCss),
                TimeWidget(widgetCss),
            ),
            new Widget.Box(
                {
                    halign: Gtk.Align.END,
                },
                BatteryWidget(widgetCss),
            ),
        )
    ) 
}
