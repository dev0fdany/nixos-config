{ pkgs, lib, ... }:

{
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        dpi-aware = "no";
        font = lib.mkForce "Noto Sans Mono:size=20"; 
        lines = 7;
        width = 21;
        terminal = "${pkgs.kitty}/bin/kitty";
        prompt = "❯ ";
        line-height = 38;
        icons-enabled = "yes";
        icon-theme = "WhiteSur-dark";
      };

      border = {
        radius = 10;
        width = 0;
      };
    };
  };
}

