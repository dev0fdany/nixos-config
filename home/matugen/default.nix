{ config, pkgs, ... }: {
  

  home.file.".config/matugen/config.toml".text = ''
    [config]
    back_end = "Fast"

    [templates.niri]
    input_path = '~/.config/matugen/templates/niri.toml'
    output_path = '~/.config/niri/colors.toml'

    [templates.waybar]
    input_path = '~/.config/matugen/templates/waybar.css'
    output_path = '~/.config/waybar/colors.css'

    [templates.mako]
    input_path = '~/.config/matugen/templates/mako.ini'
    output_path = '~/.config/mako/config'

    [templates.kitty]
    input_path = '~/.config/matugen/templates/kitty.conf'
    output_path = '~/.config/kitty/colors.conf'

    [templates.cava]
    input_path = '~/.config/matugen/templates/cava.ini'
    output_path = '~/.config/cava/colors'

    [templates.btop]
    input_path = '~/.config/matugen/templates/btop.theme'
    output_path = '~/.config/btop/themes/matugen.theme'

    [templates.fuzzel]
    input_path = '~/.config/matugen/templates/fuzzel.ini'
    output_path = '~/.config/fuzzel/colors.ini'

    [templates.gtk]
    input_path = '~/.config/matugen/templates/gtk.css'
    output_path = '~/.config/gtk-3.0/colors.css'

    [templates.gtk4]
    input_path = '~/.config/matugen/templates/gtk.css'
    output_path = '~/.config/gtk-4.0/colors.css'
  '';

  home.file.".config/matugen/templates/niri.toml".source = ./niri.toml;
  home.file.".config/matugen/templates/waybar.css".source = ./waybar.css;
  home.file.".config/matugen/templates/mako.ini".source = ./mako.ini;
  home.file.".config/matugen/templates/kitty.conf".source = ./kitty.conf;
  home.file.".config/matugen/templates/cava.ini".source = ./cava.ini;
  home.file.".config/matugen/templates/btop.theme".source = ./btop.theme;
  home.file.".config/matugen/templates/fuzzel.ini".source = ./fuzzel.ini;
  home.file.".config/matugen/templates/gtk.css".source = ./gtk.css;
}
