{
  config,
  pkgs,
  lib,
  ...
}: {
  # List of packages to install for the user
  home.packages = with pkgs; [
    # Utilities
    btop # System monitor
    fastfetch # System info tool
    ripgrep # Fast grep alternative
    fd # Find alternative
    fzf # Fuzzy finder
    lazygit # TUI for git
    unzip
    wget
    waybar
    mako
    matugen
    tty-clock
    cbonsai
    imv
    lua
    gh # github
    
    # fonts
    noto-fonts
    nerd-fonts.jetbrains-mono
  ];
}

