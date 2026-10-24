{ inputs, pkgs, ... }:
{
  programs.xwayland.enable = true;
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  users.defaultUserShell = pkgs.zsh;
  users.users.dwtop.ignoreShellProgramCheck = true;
  users.users.root.ignoreShellProgramCheck = true;
  programs.dconf.enable = true;
  programs.dconf.profiles.user.databases = [{
  settings = {
    "org/gnome/desktop/interface" = {
      icon-theme = "WhiteSur-dark";
      gtk-theme = "WhiteSur-Dark";
      cursor-theme = "WhiteSur-cursors";
      color-scheme = "prefer-dark"; 
    };
  };
}];
  qt = {
  enable = true;
  platformTheme = "gnome";
  style = "adwaita-dark";
};
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  environment.systemPackages = with pkgs; [
    vim-full # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    wl-clipboard
    xwayland-satellite
    chafa # scirpts
    imagemagick # scripts
    git
    kitty
    cmake
    gcc
    vscode
    obsidian
    fuzzel
    libnotify
    audacious
    mpv
    viewnior
    zathura
    tmux
    fastfetch
    ranger
    gnutar
    gzip
    unzip
    ffmpeg
    yt-dlp
    cava
    cmatrix
    home-manager
    awww
    wlsunset
    pavucontrol
    sound-theme-freedesktop
    whitesur-icon-theme  
    whitesur-gtk-theme
    whitesur-cursors
    brightnessctl
    zig
    zsh
  ];
  programs.nix-ld.enable = true;
}

