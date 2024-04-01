{ config, pkgs, ... }: {
    services.xserver.enable = true; # Enable the X11 windowing system.

    # Configure keymap in X11
    services.xserver = {
        enable = true;
        layout = "us";
        xkbVariant = "";
        displayManager.gdm.enable = true;
        # desktopManager.gnome.enable = true;
    };

    ## Hyprland
    programs.hyprland.enable = true;
    xdg.portal = {
        gtk.enable = true;
        gnome.enable = true;
        wlr.enable = true;
        hyprland.enable = true;
    }

    services.printing.enable = true; # Enable CUPS to print documents.

    ## Misc ##

    # Enable sound with pipewire.
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        #jack.enable = true; # If you want to use JACK applications, uncomment this
    };

    services.openssh.enable = true;
    services.snap.enable = true;

}
