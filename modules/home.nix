{ config, inputs, pkgs, ... }:
{
  imports = [ 
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users = {
      dev0fdany = {
        imports = [
          ../home/default.nix
          
          inputs.stylix.homeModules.stylix
        ];
      };
    };
  };  
}

