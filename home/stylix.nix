{ pkgs, config, lib, inputs, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark"; # "dark" or "light"

    # Base image used to derive colors automatically when no base16Scheme is set
    image = ./default-wallpaper/default.png; # Path to a default image in your repo/home
    # Optional: If you prefer a specific base16 color scheme instead of auto-generated ones
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    autoEnable = true;
    
    opacity = {
      applications = 1.0;
      terminal = 0.8;
      desktop = 1.0;
      popups = 0.95;
    };

    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
      emoji = {
        package = pkgs.emptyDirectory; 
        name = "Apple Color Emoji";
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
      vscode.enable = true;
      mpv.enable = true;
    };
  };
}
