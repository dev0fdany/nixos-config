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
  xdg.configFile."waybar/style.css".source = ./waybar/style.css;

  # mako 
  services.mako.enable = true;
  #xdg.configFile."mako/config".source = ./mako/config;


}
