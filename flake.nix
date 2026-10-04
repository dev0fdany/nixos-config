{
  description = "Danyal's NixOS flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    helium.url = "github:schembriaiden/helium-browser-nix-flake";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri.url = "github:sodiboo/niri-flake";

  };
  outputs = { self, nixpkgs, zen-browser, helium, home-manager, stylix, niri, ... }@inputs: {
  
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ 
        { nixpkgs.hostPlatform = "x86_64-linux";}
        ./configuration.nix
      ];
    };

    homeConfigurations.dwtop =
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
  
        extraSpecialArgs = {
          inherit inputs;
        };
  
        modules = [
          ./home/default.nix

          stylix.homeManagerModules.stylix
        ];
      };

    devShells.x86_64-linux = 
      let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      in {
        # PYTHON PROFILE
        py = pkgs.mkShell {
          buildInputs = with pkgs; [
            python3
            python3Packages.pip
            python3Packages.pygame-ce

            stdenv.cc.cc.lib
            libGL
            libglvnd
            egl-wayland
            mesa
            libdrm
            libxkbcommon
            libx11
            libxext
            libxrandr
            libxinerama
            libxcursor
            libdecor
            libxi
            libxrender
            libxfixes

            SDL2
            SDL2_image
            SDL2_mixer
            SDL2_ttf

            glib
            glfw

            pipewire
            pulseaudio 
            alsa-lib
            wireplumber

            vulkan-loader
            wayland
            wayland-protocols
            zlib
          ];
          shellHook = ''
            export DEV_LANG=" python"

            #If current directory has .venv activate it 
            if [ -d ".venv" ]; then
              source .venv/bin/activate
            fi

            # Pass hardware acceleration graphics drivers and window libs to your venv
            export LD_LIBRARY_PATH="/run/opengl-driver/lib:${pkgs.lib.makeLibraryPath [ 
              pkgs.stdenv.cc.cc.lib 
              pkgs.pulseaudio 
              pkgs.pipewire 
              pkgs.alsa-lib
              pkgs.wireplumber
              pkgs.libglvnd
              pkgs.egl-wayland
              pkgs.libdrm
              pkgs.mesa 
              pkgs.git 
              pkgs.glib 
              pkgs.libxkbcommon
              pkgs.libx11
              pkgs.libxext
              pkgs.libxrandr
              pkgs.libxinerama
              pkgs.libxcursor
              pkgs.libdecor
              pkgs.libxi
              pkgs.libxrender
              pkgs.libxfixes
              pkgs.SDL2 
              pkgs.SDL2_image 
              pkgs.SDL2_mixer 
              pkgs.SDL2_ttf 
              pkgs.wayland 
              pkgs.zlib 
              ]}:$LD_LIBRARY_PATH"

            # to behave like a noraml shell
            # removing these might cause some py lib to not init windows
            export XDG_RUNTIME_DIR="$XDG_RUNTIME_DIR"
            export WAYLAND_DISPLAY="$WAYLAND_DISPLAY"
            export DISPLAY="$DISPLAY"
            export PULSE_SERVER="$PULSE_SERVER"

            unset SDL_VIDEODRIVER

            if [ -z "$IN_NIX_SHELL_ZSH" ]; then
              export IN_NIX_SHELL_ZSH=1
              exec zsh
            fi          
          '';
        };
        # C / C++ PROFILE
        cpp = pkgs.mkShell {
          buildInputs = with pkgs; [
            gcc
            gnumake
            cmake
            gdb
          ];

          shellHook = ''
          export DEV_LANG=" ++"
            if [ -z "$IN_NIX_SHELL_ZSH" ]; then
              export IN_NIX_SHELL_ZSH=1
              exec zsh
            fi          
          '';
        };
        # DEFAULT FALLBACK PROFILE
        default = pkgs.mkShell {
          buildInputs = with pkgs; [
            git
          ];
          shellHook = ''
          '';
        };
      };
  };
}
