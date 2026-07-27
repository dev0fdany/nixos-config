
{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.waybar =  {
    enable = true;
  };
  xdg.configFile."waybar/config.jsonc".source = ./waybar/config.jsonc;
  xdg.configFile."waybar/style.css".source = ./waybar/style.css;
   
  services.mako.enable = true;
  xdg.configFile."mako/config".source = ./mako/config;

}
