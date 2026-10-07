{ inputs, pkgs, ... }:
{
  imports = [
    inputs.zen-browser.homeModules.twilight
  ];

  programs.zen-browser = {
    enable = true;
  };

  home.packages = [
    inputs.helium.packages.${pkgs.system}.default
  ];

  xdg.configFile."helium-flags.conf".text = ''
    --gtk-version=4
    --enable-features=WebUIDarkMode
    --force-dark-mode
    --ozone-platform-hint=auto
  '';
}

