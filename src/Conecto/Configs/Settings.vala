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

namespace Conecto.Configs {

    /**
     * The {@code Settings} class is responsible for defining all
     * the texts that are displayed in the application and must be translated.
     *
     * @see Glib.Settings
     * @since 1.0.0
     */
    public class Settings : GLib.Settings {

        /**
         * This static property represents the {@code Settings} type.
         */
        private static Settings? instance;

        /**
         * Constructs a new {@code Settings} object.
         */
        private Settings () {
            Object (
                schema_id: Constants.ID
            );
        }

        /**
         * Returns a single instance of this class.
         *
         * @return {@code Settings}
         */
        public static unowned Settings get_instance () {
            if (instance == null) {
                instance = new Settings ();
            }

            return instance;
        }
    }
}