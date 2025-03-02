import { App, Astal, Gtk, Gdk, Widget } from "astal/gtk3"

import {
    BatteryWidget,
    TimeWidget,
    DateWidget
} from "./Widgets";

export default function Bar(gdkmonitor: Gdk.Monitor) {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor
    let widgetCss = "";

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
