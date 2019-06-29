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
 * AUTHORS
 * Hannes Schulze <haschu0103 (at) gmail.com>
 */

namespace Conecto {

    public class Main {

        public static int main (string [] args) {
            // Needed for mousepad protocol handler.
            Gdk.init (ref args);

            // Needed for clipboard sharing.
            Gtk.init (ref args);

            if (!Thread.supported ()) {
                error ("Cannot run without thread support.\n");
            }

            message ("Report any issues/bugs you might find to https://github.com/hannesschulze/conecto/issues");

            var application = new Application ();
            return application.run (args);
        }
    }
}