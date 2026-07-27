{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "dwtop"; # Replace with your actual name
        email = "danyal2007.online@gmail.com"; # Replace with your actual email
      };
      
      safe.directory = "/etc/nixos";
      init.defaultBranch = "main";
      core.editor = "vim";
      core.autocrlf = "input";
      core.pager = "cat";
    };
  };

  # Lazygit configuration (optional)
  programs.lazygit = {
    enable = true;
    # settings = { ... }; # Add custom lazygit settings if needed
  };
}
