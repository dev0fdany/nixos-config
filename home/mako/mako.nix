{ pkgs, ... }:

{
  services.mako = {
    enable = true;
    
    defaultTimeout = 3500;
    # Modern Home Manager settings syntax
    settings = {
      ignore-timeout = false;
      
      anchor = "top-right";
      margin = "20";
      width = 350;
      height = 100;
      border-radius = 10;
      border-size = 2;
      padding = "15";
      
      text-alignment = "left";
    };

    extraConfig = ''
     on-notify=exec ${pkgs.mpv}/bin/mpv --no-video --no-terminal --volume=80 ${./notification-generic.wav}'';
  };
}
