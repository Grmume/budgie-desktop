/* budgie-1.0.vapi generated by vapigen-0.30, do not modify. */

[CCode (cprefix = "Budgie", gir_namespace = "Budgie", gir_version = "1.0", lower_case_cprefix = "budgie_")]
namespace Budgie {
	[CCode (cheader_filename = "plugin.h", type_id = "budgie_applet_get_type ()")]
	public class Applet : Gtk.Bin, Atk.Implementor, Gtk.Buildable {
		[CCode (has_construct_function = false)]
		public Applet ();
		public GLib.Settings get_applet_settings (string uuid);
		public unowned string get_settings_prefix ();
		public unowned string get_settings_schema ();
		public virtual Gtk.Widget? get_settings_ui ();
		public Budgie.PanelAction get_supported_actions ();
		public virtual void invoke_action (Budgie.PanelAction action);
		public void set_settings_prefix (string prefix);
		public void set_settings_schema (string schema);
		public virtual bool supports_settings ();
		public virtual void update_popovers (Budgie.PopoverManager? manager);
		public string settings_prefix { get; set; }
		public string settings_schema { get; set; }
		[NoAccessorMethod]
		public Budgie.PanelAction supported_actions { get; set; }
		public virtual signal void panel_size_changed (int panel_size, int icon_size, int small_icon_size);
	}
	[CCode (cheader_filename = "plugin.h", type_id = "budgie_applet_info_get_type ()")]
	public class AppletInfo : GLib.Object {
		[CCode (has_construct_function = false)]
		public AppletInfo (Peas.PluginInfo plugin_info, string uuid, Budgie.Applet applet, GLib.Settings settings);
		[NoAccessorMethod]
		public string alignment { owned get; set; }
		[NoAccessorMethod]
		public Budgie.Applet applet { owned get; set construct; }
		[NoAccessorMethod]
		public string description { owned get; set; }
		[NoAccessorMethod]
		public string icon { owned get; set; }
		[NoAccessorMethod]
		public string name { owned get; set; }
		[NoAccessorMethod]
		public int position { get; set; }
		[NoAccessorMethod]
		public GLib.Settings settings { owned get; set construct; }
		[NoAccessorMethod]
		public string uuid { owned get; set; }
	}
	[CCode (cheader_filename = "plugin.h", type_id = "budgie_plugin_get_type ()")]
	public interface Plugin : GLib.Object {
		public abstract Budgie.Applet get_panel_widget (string uuid);
	}
	[CCode (cheader_filename = "plugin.h", type_id = "budgie_popover_manager_get_type ()")]
	public interface PopoverManager : GLib.Object {
		public abstract void register_popover (Gtk.Widget? widget, Gtk.Popover? popover);
		public abstract void show_popover (Gtk.Widget? widget);
		public abstract void unregister_popover (Gtk.Widget? widget);
	}
	[CCode (cheader_filename = "plugin.h", cprefix = "BUDGIE_PANEL_ACTION_", type_id = "budgie_panel_action_get_type ()")]
	[Flags]
	public enum PanelAction {
		NONE,
		MENU,
		MAX
	}
	[CCode (cheader_filename = "plugin.h", cname = "BUDGIE_APPLET_KEY_ALIGN")]
	public const string APPLET_KEY_ALIGN;
	[CCode (cheader_filename = "plugin.h", cname = "BUDGIE_APPLET_KEY_NAME")]
	public const string APPLET_KEY_NAME;
	[CCode (cheader_filename = "plugin.h", cname = "BUDGIE_APPLET_KEY_POS")]
	public const string APPLET_KEY_POS;
}
