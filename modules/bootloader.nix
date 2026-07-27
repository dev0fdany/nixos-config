{ config, pkgs, ... }:
{
  
  boot.loader = {
    systemd-boot = {
      enable = false;
    };
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
    };
  };
  boot.kernelParams = [ "acpi_backlight=native" ];
  boot.initrd.kernelModules = [ "i915" ];
}

