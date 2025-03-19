{ config, pkgs, ... }:

{
  #   # Home Manager needs a bit of information about you and the
  #   # paths it should manage.
  home.username = "rishabh";
  home.homeDirectory = "/home/rishabh";
  #
  #   home.packages = with pkgs; [
  #     adw-gtk3
  #   ];
  #
  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    iconTheme = {
      name = "Papirus-Dark";
    };

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
    gtk3.extraConfig.gtk-cursor-theme-name = "Bibata-Modern-Classic";
    gtk4.extraConfig.gtk-cursor-theme-name = "Bibata-Modern-Classic";
  };

  home.pointerCursor = {
    # enable = true;
    gtk.enable = true;
    package = pkgs.bibata-cursors; # or any cursor package you prefer
    name = "Bibata-Modern-Classic"; # the cursor theme name
    # You can also set the size here, e.g., size = 24;
  };
  #
  # dconf.settings = {
  #   "org/gnome/desktop/interface" = {
  #     color-scheme = "prefer-dark";
  #     gtk-theme = "adw-gtk3-dark";
  #   };
  # };
  #
  #   # This value determines the Home Manager release that your
  #   # configuration is compatible with. This helps avoid breakage
  #   # when a new Home Manager release introduces backwards
  #   # incompatible changes.
  #   #
  #   # You can update Home Manager without changing this value. See
  #   # the Home Manager release notes for a list of state version
  #   # changes in each release.
  home.stateVersion = "24.11";
  #
  #   # Let Home Manager install and manage itself.
  #   programs.home-manager.enable = true;
}
