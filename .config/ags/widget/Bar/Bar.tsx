import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable } from "astal"

import {
    Battery,
    Time,
} from "./Widgets";

export default function Bar(gdkmonitor: Gdk.Monitor) {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor
    let iconCss = "";

    return <window
        className="Bar"
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP | LEFT | RIGHT}
        application={App}>
        <centerbox
            className="window"
            css={`
                padding: 2px;
                min-height: 30px;
            `}
        >
            <box halign={Gtk.Align.START}>
            </box>
            <box>
                <Time css={iconCss}/>
            </box>
            <box halign={Gtk.Align.END}>
                <Battery css={iconCss}/>
            </box>
        </centerbox>
    </window>
}
