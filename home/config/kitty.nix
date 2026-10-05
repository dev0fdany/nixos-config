{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;

    settings = {
      font_family = "Noto Sans Mono";
      font_size = 13;
      window_padding_width = "0 15 0 15";

      shell = "zsh";
      shell_integration = "disabled";

      cursor_shape = "beam";
      url_style = "curly";

      sync_to_monitor = "yes";
      confirm_os_window_close = 0;
    };

    extraConfig = ''
      # Additional shortcuts or raw configs can go here

    '';
  };
}

