{ pkgs,lib, ... }:
{
  services.displayManager.sddm.enable = true;
  # services.desktopManager.plasma6.enable = true;
  # services.printing.enable = true;
  services.openssh.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  # Enable touchpad support
  services.libinput.enable = true;
  hardware.brillo.enable = true;
  services.tumbler.enable = true;  
  hardware.enableAllFirmware = true;
  hardware.graphics.enable = true;
}
