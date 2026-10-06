{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      command_timeout = 500;

      format = lib.concatStrings [
        "$python"
        "$directory"
        "$git_branch"
        "$git_status"
        "$fill"
        "$nix_shell"
        "$jobs"
        "$cmd_duration"
        "$line_break"
        "$username$hostname $custom $character" 
      ];
      
      python = {
        style = "bold yellow";
        format = "[$virtualenv]($style) ";
        detect_extensions = [ ];
        detect_files = [ ];
  
      };

      directory = {
        style = "bold blue";
        format = "[ $path ]($style)";
        # truncation_length = 3;
      };

      git_branch = {
        symbol = " ";
        style = "bold purple";
        format = "on [$symbol$branch]($style) ";
      };

      git_status = {
        disabled = false;
        ignore_submodules = true;
      };

      fill = {
        symbol = "·";
        style = "white";
      };
  
      env_var = {
        DEV_LANG = {
          format = "[$env_value]($style) ";
          style = "bold yellow";
        };
      };
      

      cmd_duration = {
        format = "[󰔛 ](bold red) [$duration](fg:gray)";
        disabled = false;
        show_notifications = false;
        min_time_to_notify = 6000;
      };

      username = {
        format = "[$user]($style)@";
        show_always = true;
        disabled = false;
        style_user = "bold";
        style_root = "bold";
      };
  
      hostname = {
        ssh_only = false;
        format = "[$hostname]($style)";
        disabled = false;
        trim_at = "";
        style = "bold";
      };
      
      nix_shell = {
        format = "[in](bold red) [  nix](bold cyan) ";
      };

      character = {
        disabled = false;
        success_symbol = "[ ](bold green)";
        error_symbol = "[ ](bold red)";
      };
      
      package = {
        disabled = true;
      };
/*
      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:color_purple";
        format = "[[   $time ](bold fg:color_fg_dark bg:color_purple)]($style)";
      };

      line_break = {
        disabled = false;
      };
*/
    };
  };
}
