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
 * gyan000 <gyan000 (at] ijaz.fr>
 * Hannes Schulze <haschu0103 (at) gmail.com>
 */
using Conecto.Plugin;
using Conecto.Plugin.Windows;
using Conecto.Widgets;
using Conecto.Configs;
using Gee;
using MConnect;
using Unity;

namespace Conecto {

    public class Application : Granite.Application {
        public HashMap<string, Device> devices_map;
        public ContactsInterface contacts_interface;
        private SMSHistory sms_history_view;
        private MainWindow main_window;

        construct {
            application_id = Constants.ID;
            flags = ApplicationFlags.FLAGS_NONE;
            program_name = Constants.PROGRAM_NAME;
            build_version = Constants.VERSION;

            devices_map = new HashMap<string, Device> ();
        }

        public override void activate ()
        {
            Contractor.create_if_not_exists_contract_dir ();
            Contractor.clean_contractor_directory.begin ();
            MConnectThread mconnect_thread = new MConnectThread (this, devices_map);

            sms_history_view = new SMSHistory (devices_map);

            main_window = new MainWindow (this, sms_history_view);
            main_window.show_all ();
            main_window.delete_event.connect ((event) => {
                // When from launcher menu is clicked.
                if (event.send_event == (int8)0) {
                    foreach (var device_entry in devices_map.entries) {
                        Contractor.destroy_contract (device_entry.value);
                    }
                    main_window.destroy ();
                } else { // When close button from the main window is clicked.
                    main_window.iconify ();
                }
                return true;
            });

            init_sms_store.begin (() => {
                init_sms_history_tab.begin ();
            });


            mconnect_thread.devices_updated.connect (() => {
                Idle.add (() => {
                    main_window.update_ui (devices_map);
                    sms_history_view.update_available_device_combobox ();
                    return Source.REMOVE;
                });
            });

            mconnect_thread.devices_status_updated.connect (() => {
                Idle.add (() => {
                    sms_history_view.update_available_device_combobox ();
                    return Source.REMOVE;
                });
            });

            shutdown.connect (() => {
                mconnect_thread.shutdown();
            });

            new Thread<int> ("MConnect Thread", mconnect_thread.run);
        }



        private async void init_sms_store () {
            SMSStore.instance ();
        }

        private async void init_sms_history_tab () {

            SimpleAction simple_action = new SimpleAction ("telephony-open-sms-tab", null);
            simple_action.activate.connect (() => {
                main_window.main_stack.set_visible_child_name ("sms_history_view");
            });

            this.add_action (simple_action);

            SMSStore.instance ().sms_handled.connect ( (sms) => {
                sms_history_view.update_message_ui_adding_sms (sms);
            });

            SMSStore.instance ().contacts_updated.connect ( (sms_contact_map) => {
                sms_history_view.update_ui (sms_contact_map);
            });

            SMSStore.instance ().contact_updated.connect ((sms_contact) => {
                sms_history_view.update_list_box_ui (sms_contact);
            });

            SMSStore.instance ().refresh_contact_list ();

            contacts_interface = new EContacts ();
            contacts_interface.load_contacts ();
            contacts_interface.contact_loaded.connect ((contact ) => {
                SMSStore.instance ().merge_contact (contact);
            });

            sms_history_view.contacts_interface = contacts_interface;
        }
    }
}
