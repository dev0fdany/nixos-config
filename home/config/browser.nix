{ inputs, pkgs, ... }:
{
  imports = [
    inputs.zen-browser.homeModules.twilight
  ];

  programs.zen-browser = {
    enable = true;
    profiles."default" = {
      id = 0;
      name = "Default Profile";
      isDefault = true;
      path = "49hadlx8.Default Profile";
    };
  };

  home.packages = [
    inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  xdg.configFile."helium-flags.conf".text = ''
    --gtk-version=4
    --enable-features=WebUIDarkMode
    --force-dark-mode
    --ozone-platform-hint=auto
  '';
}

