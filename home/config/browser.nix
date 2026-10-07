{ inputs, pkgs, ... }:
{
  imports = [
    inputs.zen-browser.homeModules.twilight
    inputs.helium.homeManagerModules.default 
  ];

  programs.zen-browser = {
    enable = true;
  };

  programs.helium = {
    enable = true;
    flags = [
      "--gtk-version=4"
      "--enable-features=WebUIDarkMode"
      "--force-dark-mode"
      "--ozone-platform-hint=auto"
    ];
  };
}

