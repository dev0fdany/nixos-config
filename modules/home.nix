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
      dwtop = { config, pkgs, ... }: {
        imports = [
          import ../home/default.nix
          
          inputs.stylix.homeModules.stylix
        ];
      };
    };
  };  
}

