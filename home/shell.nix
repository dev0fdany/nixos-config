{ config, pkgs, lib, ... }: 
{
  imports = [
  ];

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };

    shellAliases = {
      nd = "custom_nix_develop";
      ven = "sudo -E vim /etc/nixos/";
    };
    initContent = ''
      function custom_nix_develop() {
        if [[ "$1" == "py" ]]; then
          command nix develop /etc/nixos#py
        elif [[ "$1" == "cpp" ]]; then
          command nix develop /etc/nixos#cpp
        elif [[ -z "$1" ]]; then
          command nix develop
        else
          command nix develop "$@"
        fi
      }
    '';
  };
}

