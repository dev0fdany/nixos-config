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

    noto-fonts
    jetbrains-mono
  ];

  # Font configuration
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "JetBrains Mono" ];
      sansSerif = [ "Noto Serif " ];
      serif = [ "Noto Sans" ];
      emoji = [ "Apple Color Emoji" ];
    };
  };
}

