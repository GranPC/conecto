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
     * The {@code Constants} class is responsible for defining all
     * the constants used in the application.
     *
     * @since 0.1.0
     */
    public class Constants {
        public abstract const string ID = "com.github.hannesschulze.conecto";
        public abstract const string VERSION = "0.1.0";
        public abstract const string PROGRAM_NAME = "Conecto";
        public abstract const string APP_YEARS = "2019";
        public abstract const string ABOUT_COMMENTS = "Integrate your Android-phone with your PC - a GTK client for KDEConnect.";
        public abstract const string TRANSLATOR_CREDITS = "Translators";
        public abstract const string MAIN_URL = "https://github.com/hannesschulze/conecto";
        public abstract const string BUG_URL = "https://github.com/hannesschulze/conecto/issues";
        public abstract const string HELP_URL = "https://github.com/hannesschulze/conecto";
        public abstract const string TRANSLATE_URL = "https://github.com/hannesschulze/conecto";
        public abstract const string TEXT_FOR_ABOUT_DIALOG_WEBSITE = "Website";
        public abstract const string TEXT_FOR_ABOUT_DIALOG_WEBSITE_URL = "https://github.com/hannesschulze/conecto";
        public abstract const string URL_CSS = "/com/github/hannesschulze/conecto/css/style.css";
        public abstract const string [] ABOUT_AUTHORS = {
            "gyan000 <gyan000 (at] ijaz.fr>",
            "Hannes Schulze <haschu0103@gmail.com>"
        };
        public abstract const Gtk.License ABOUT_LICENSE_TYPE = Gtk.License.GPL_2_0;
        public abstract const string GSETTINGS_SCHEMA_PATH = "/com/github/hannesschulze/conecto";
    }
}