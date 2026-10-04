{ config, pkgs, lib, ... }: 
{
  imports = [
    ./packages.nix
    ./stylix.nix
    ./waybar.nix
    ./matugen/default.nix
    ./shell.nix
    ./starship.nix
    ./git.nix
    #./niri.nix
  ];

  home = {
    username = "dwtop";
    homeDirectory = "/home/dwtop";
    stateVersion = "26.11";
  };
  
  # Enable Home Manager
  programs.home-manager.enable = true;
  
  home.pointerCursor = {
    enable = true;
    name = "WhiteSur-cursors";
    size = 20;
    package = pkgs.whitesur-icon-theme;
  };
  xdg.portal = {
  enable = true;
  extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  config.common.default = [ "gnome" "gtk" ];
};


  services.mako.enable = true;

}
