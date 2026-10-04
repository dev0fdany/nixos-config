{
  config,
  pkgs,
  lib,
  ...
}: {
  # waybar
  programs.waybar =  {
    enable = true;
    systemd = {
      enable = true;
      targets = [ "graphical-session.target" ]; 
    };
  };
  xdg.configFile."waybar/config.jsonc".source = ./waybar/config.jsonc;

}
