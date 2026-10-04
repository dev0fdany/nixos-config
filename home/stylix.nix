{ pkgs, config, lib, ... }: {
  stylix = {
    enable = true;
    polarity = "dark"; # "dark" or "light"

    # Base image used to derive colors automatically when no base16Scheme is set
    image = "${config.home.homeDirectory}/Pictures/walls/PewDiePie_compressed.webp"; # Path to a default image in your repo/home

    # Optional: If you prefer a specific base16 color scheme instead of auto-generated ones
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

    opacity = {
      applications = 0.95;
      terminal = 0.90;
      desktop = 0.90;
      popups = 0.95;
    };

    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; };
        name = "FiraCode Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 11;
        terminal = 12;
        desktop = 10;
        popups = 11;
      };
    };

    # Automatically target installed Home Manager applications
    targets = {
      waybar.enable = true;
      mako.enable = true;
      fuzzel.enable = true;
      kitty.enable = true;
      gtk.enable = true;
      gnome.enable = true;
      btop.enable = true;
      zathura.enable = true;
      ranger.enable = true;
      vscode.enable = true;
      mpv.enable = true;
      niri.enable = true;
    };
  };
}
