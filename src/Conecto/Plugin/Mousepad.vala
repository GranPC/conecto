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
using Conecto.Widgets;
using Conecto.Plugin;
using MConnect;

namespace Conecto.Plugin {

    public class Mousepad : PluginInterface {

        construct {
            name  = _("Mousepad");
            icon_name = "input-mouse";
            capability_name = MousepadHandler.MOUSEPAD;
            description = _("Control your computer remotely");
            settings_key_is_active = "kdeconnect-mousepad-active";
            show_configure_button = false;
        }
    }
}
