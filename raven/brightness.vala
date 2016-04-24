/*
 * This widget is based on the sound widget (sound.vala) and was
 * created on 03-21-2016
 *
 * Copyright (C) 2016 Gregor Müller-Riederer
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 */
[DBus (name = "org.gnome.SettingsDaemon.Power.Screen")]
interface Screen : GLib.Object {
    public abstract int StepDown() throws IOError;
    public abstract int StepUp() throws IOError;
    public abstract int Brightness { owned get; owned set;}
}

public class BrightnessWidget : Gtk.Box
{
    private Screen? screen = null;
    public bool ScreenInterfaceFound { get { return screen != null; } }
    private Gtk.Scale? scale = null;
    private ulong scale_id = 0;
    private string backlight_controller;
    private int max_brightness;

    private Budgie.HeaderWidget? header = null;

    
    public BrightnessWidget()
    {
        Object(orientation: Gtk.Orientation.VERTICAL);

        get_style_context().add_class("brightness-widget");

        scale = new Gtk.Scale.with_range(Gtk.Orientation.HORIZONTAL, 0, 100, 10);
        scale.set_draw_value(false);
        scale_id = scale.value_changed.connect(on_brightness_scale_change);

        header = new Budgie.HeaderWidget("", "display-brightness-symbolic", false, scale);
        pack_start(header, false, false);

        backlight_controller = ""; 

        /* Default value for max brightness in case there's no max_brightness file present */
         max_brightness = 976; 

        try
        {
            screen = GLib.Bus.get_proxy_sync (BusType.SESSION, "org.gnome.SettingsDaemon.Power", "/org/gnome/SettingsDaemon/Power");

        } catch (IOError e) {
            stderr.printf ("%s\n", e.message);
        }     
    }

    /**
     * New brightness from our scale
     */
    private void on_brightness_scale_change()
    {
        write_brightness((int)scale.get_value());
    }

    public void update_scale()
    {
        var brightness = read_brightness();
        scale.set_value(brightness);        
    }

    /**
     * Read the brightness value
     */
    private int read_brightness()
    {
        if(screen != null)
        {
            return screen.Brightness;
        }

        return 0;
    }

    /**
     * Write the new brightness value
     */
    private void write_brightness(int brightness) throws IOError
    {
        if(screen != null)
        {

            screen.Brightness = brightness;
        }
    }

    

} // End class

/*
 * Editor modelines  -  https://www.wireshark.org/tools/modelines.html
 *
 * Local variables:
 * c-basic-offset: 4
 * tab-width: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vi: set shiftwidth=4 tabstop=4 expandtab:
 * :indentSize=4:tabSize=4:noTabs=true:
 */
