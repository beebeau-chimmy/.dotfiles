# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }: {

    imports = [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ./services.nix
        ./gpu_amd.nix
    ];

    # Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "auggienix"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "America/Phoenix";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.defaultUserShell = pkgs.zsh;
    users.users.august = {
        isNormalUser = true;
        description = "august";
        extraGroups = [ "networkmanager" "wheel" "kvm" "libvirt" ];
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        # Essentials
        vim wget curl
        neofetch
        zsh tmux neovim alacritty # terminal packages

        # Development
        git
        lua go nodejs maven jdk21 gcc python3 # language support
        gnumake cmake meson ninja gnupatch libiconv libconfig pkg-config libev uthash # package building

        # Non-GUI Misc
        flatpak
        snap
        pywal # wallpapers and coloring
        pavucontrol pulsemixer # TUI version of pavucontrol
        eza
        wine
        gamescope

        # GUI Applications
        brave # web browser
        microsoft-edge
        discord # vesktop # basically discord-screenaudio [build fails]
        steam
        quickemu # easy VMs
        quickgui

        # GUI Misc
        cpu-x
        dunst
        rofi
        waybar
        virt-manager

    ];

    system.stateVersion = "23.11"; # Did you read the comment?

}
