/**
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 */
using Conecto;

namespace MConnect {

    public class MousepadHandler : GLib.Object, PacketHandlerInterface {

        public const string MOUSEPAD = "kdeconnect.mousepad";
        public const string MOUSEPAD_REQUEST = "kdeconnect.mousepad.request";

        private unowned X.Display display;

        public bool enabled { get; set; default = true; }

        public string get_pkt_type () {
            return MOUSEPAD_REQUEST;
        }

        construct {
            display = (Gdk.Display.get_default () as Gdk.X11.Display).get_xdisplay ();
        }

        public MousepadHandler () { }

        public static MousepadHandler instance () {
            return new MousepadHandler ();
        }

        public void use_device (Device device) {
            device.message.connect (message);
        }

        public void release_device (Device device) {
            device.message.disconnect (message);
        }

        private void move_cursor (double dx, double dy) {
            XTestFork.fake_relative_motion_event (display, (int) dx, (int) dy, 0);
        }

        public void message (Device device, Packet pkt) {
            if (pkt.pkt_type != MOUSEPAD_REQUEST) {
                return;
            }

            Plugin.Mousepad plugin_mousepad = (Plugin.Mousepad) device.get_plugin (MOUSEPAD);
            if (plugin_mousepad.is_active) {
                double dx = pkt.body.get_double_member ("dx");
                double dy = pkt.body.get_double_member ("dy");

                if (dx != 0 || dy != 0) {
                    move_cursor (dx, dy);
                }
            }
        }
    }
}
