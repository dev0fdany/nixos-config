{ config, pkgs, inputs, ... }:
{
  users.users.dwtop = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "networkmanager"];
    packages = with pkgs; [
     inputs.zen-browser.packages.${system}.default
     inputs.helium.packages.${system}.default
    ];
    shell = pkgs.zsh;
  };
  services.keyd = {
    enable = true;
    keyboards.default = {
       settings = {
         main = {
          rightalt = "layer(key_binds)";
      };
      key_binds = {
        h = "left";
        j = "down";
        k = "up";
        l = "right";

        a = "Adiaeresis";
        o = "Odiaeresis";
        u = "Udiaeresis";
        s = "ssharp"; 
      };
    };
  };
 };
}
