{ inputs, pkgs, ... }:
{
  imports = [ ];

  home.packages = [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  xdg.configFile."helium-flags.conf".text = ''
    --gtk-version=4
    --enable-features=WebUIDarkMode
    --force-dark-mode
    --ozone-platform-hint=auto
  '';
}

