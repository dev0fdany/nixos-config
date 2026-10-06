{ config, pkgs, ... }: {
  programs.cava = {
    enable = true;

    settings = {
      general = {
        mode = "waves";
        framerate = 60;
        autosens = 1;
        sensitivity = 100;
        bar_width = 2;
        max_height = 99;
        # Note: 'bars', 'bar_spacing', and 'bar_height' remain commented out or at defaults 
        # as per your input file rules.
      };

      input = {
        # Defaults to auto-detect layout sequence: pipewire -> pulse -> alsa
        # Uncomment and adjust below if your audio interface requires static path targets:
        # method = "pipewire";
        # source = "auto";
      };

      output = {
        # Default options mirror your text template rules safely
        # orientation = "bottom";
        # channels = "stereo";
      };
    };
  };
}

