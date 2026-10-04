{ config, pkgs, ... }: {
  programs.niri.settings = {
    layout = {
      focus-ring = {
        enable = false;
        width = 2.9;
        active.color = "#${config.lib.stylix.colors.base0D}";   # Primary accent
        inactive.color = "#${config.lib.stylix.colors.base03}"; # Muted border/surface
      };

      border = {
        enable = false;
        width = 4;
        active.color = "#${config.lib.stylix.colors.base0D}";
        inactive.color = "#${config.lib.stylix.colors.base03}";
      };

      shadow = {
        enable = off;
        color = "#${config.lib.stylix.colors.base00}70";        # Scrim/Shadow dark base
      };

      tab-indicator = {
        active.color = "#${config.lib.stylix.colors.base0D}";
        inactive.color = "#${config.lib.stylix.colors.base0E}"; # Secondary accent
      };

      insert-hint = {
        color = "#${config.lib.stylix.colors.base0D}80";
      };
    };
  };
}
