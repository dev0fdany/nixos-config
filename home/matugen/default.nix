# home/matugen/default.nix
{ config, pkgs, ... }: {
  
  programs.matugen = {
    enable = true;
    
    settings = {
      config = {
        back_end = "Fast";
      };

      templates = {
        niri = {
          input_path = "~/.config/matugen/templates/niri.toml";
          output_path = "~/.config/niri/colors.toml";
        };
        waybar = {
          input_path = "~/.config/matugen/templates/waybar.css";
          output_path = "~/.config/waybar/colors.css";
        };
        mako = {
          input_path = "~/.config/matugen/templates/mako.ini";
          output_path = "~/.config/mako/colors";
        };
        kitty = {
          input_path = "~/.config/matugen/templates/kitty.conf";
          output_path = "~/.config/kitty/colors.conf";
        };
        cava = {
          input_path = "~/.config/matugen/templates/cava.ini";
          output_path = "~/.config/cava/colors";
        };
        btop = {
          input_path = "~/.config/matugen/templates/btop.theme";
          output_path = "~/.config/btop/themes/matugen.theme";
        };
        fuzzel = {
          input_path = "~/.config/matugen/templates/fuzzel.ini";
          output_path = "~/.config/fuzzel/colors.ini";
        };
        gtk = {
          input_path = "~/.config/matugen/templates/gtk.css";
          output_path = "~/.config/gtk-3.0/colors.css";
        };
        gtk4 = {
          input_path = "~/.config/matugen/templates/gtk.css";
          output_path = "~/.config/gtk-4.0/colors.css";
        };
      }; # Fixed closing brace for templates
    }; # Fixed closing brace for settings
  };

  # 2. Source your local template files directly from this folder
  home.file.".config/matugen/templates/niri.toml".source = ./niri.toml;
  home.file.".config/matugen/templates/waybar.css".source = ./waybar.css;
  home.file.".config/matugen/templates/mako.ini".source = ./mako.ini;
  home.file.".config/matugen/templates/kitty.conf".source = ./kitty.conf;
  home.file.".config/matugen/templates/cava.ini".source = ./cava.ini;
  home.file.".config/matugen/templates/btop.theme".source = ./btop.theme;
  home.file.".config/matugen/templates/fuzzel.ini".source = ./fuzzel.ini;
  home.file.".config/matugen/templates/gtk.css".source = ./gtk.css;
}

