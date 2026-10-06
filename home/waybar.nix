{
  config,
  pkgs,
  lib,
  ...
}: {

  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      targets = [ "graphical-session.target" ]; 
    };

    # Appends clean text workspaces and colors directly mapped from your Stylix theme
    style = lib.mkAfter ''
      @define-color background #${config.lib.stylix.colors.base00};
      @define-color foreground #${config.lib.stylix.colors.base05};
      
      /* STYLIX COLOURED WORKSPACE HOOKS */
      @define-color ws-active   #${config.lib.stylix.colors.base0D}; /* Active Accent */
      @define-color ws-occupied #${config.lib.stylix.colors.base0B}; /* Has Windows */
      @define-color ws-empty    #${config.lib.stylix.colors.base03}; /* Empty Workspaces (Gray) */

      @define-color warn       #${config.lib.stylix.colors.base0A};
      @define-color critical   #${config.lib.stylix.colors.base08};
      @define-color dim        #${config.lib.stylix.colors.base04};

      * {
        border: none;
        min-height: 0;
      }

      window#waybar {
        background-color: transparent;
      }

      #waybar > box {
        border-radius: 0px;
        margin: 0px 0px 0px 0px;
        border-top: 1px solid rgba(255, 255, 255, 0.1);
        background-color: @background;
        box-shadow: 0 1px 2px rgba(0, 0, 0, 1);
        transition-property: background-color;
        transition-duration: .5s;
        font-weight: bold;
      }

      #workspaces {
        margin: 0px 4px;
        padding: 0px 0px;
        padding-top: 2px;
      }

      /* Base button cleanup - Targeting buttons and their internal text tracks */
      #workspaces button,
      #workspaces button label,
      #workspaces button image {
        font-weight: bold; /* Keep everything bold across all states */
        font-size: 14px;
        text-decoration: none;
        text-shadow: none;
        box-shadow: none;
        background: transparent;
        background-image: none;
        border: 0;
        border-radius: 0;
        outline: none;
      }

      /* 1. STATE: Workspaces that have windows open (Occupied) */
      #workspaces button {
        color: @ws-occupied;
        padding: 0px 8px;
        min-width: 15px;
        margin: 0px 0px;
        opacity: 0.9;
      }

      /* 2. STATE: The workspace you are currently looking at (Active) */
      #workspaces button.active {
        color: @ws-active; 
        opacity: 1.0;
      }

      /* 3. STATE: Workspaces completely empty of any windows */
      #workspaces button.empty {
        color: @ws-empty;
        opacity: 0.6;
      }

      /* 4. STATE: Empty but actively selected workspace */
      #workspaces button.empty.active {
        color: @ws-active;
        opacity: 1.0;
      }

      #workspaces button.empty:hover, 
      #workspaces button:hover {
        background: transparent;
        color: alpha(@foreground, 1);
        opacity: 1;
      }

      #memory,
      #mpris,
      #tray,
      #cpu,
      #clock,
      #battery,
      #backlight,
      #network,
      #bluetooth,
      #pulseaudio,
      #power-profiles-daemon {
        min-width: 14px;
        padding-left: 3px;
        padding-right: 3px;
        margin: 1px 0px 0px 10px;
        opacity: 1;
        font-weight: bold;
        font-size: 12px;
        color: @foreground;
      }

      #clock {
        margin-right: 2px;
        padding-left: 0px;
        margin-left: 2px;
      }

      #tray {
        opacity: 1;
      }

      #custom-separator {
        opacity: 0.2;
        padding-top: 2px;
        padding-left: 3px;
        padding-right: 5px;
        padding-bottom: 0px;
        margin: 0px;
      }

      tooltip {
        padding: 4px;
        background: @background;
        font-size: 11px;
        border: 1px solid alpha(@foreground, 0.6);
        border-radius: 8px;
      }

      tooltip label {
        color: alpha(@foreground, 1);
        font-weight: normal;
      }

      #mpris {
        opacity: 1;
        color: @foreground;
        animation: repeat;
        animation-name: blink;
        animation-duration: 3s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      @keyframes blink {
        to {
          color: @dim;
        }
      }

      @keyframes blink2 {
        to {
          background-color: transparent;
          color: @critical;
        }
      }

      #battery.critical:not(.charging) {
        background-color: transparent;
        color: @foreground;
        animation-name: blink2;
        animation-duration: 0.5s;
        animation-timing-function: steps(12);
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #memory.warning,
      #cpu.warning {
        color: @warn;
      }

      #memory.critical,
      #cpu.critical {
        color: @critical;
      }

      #network label b,
      #bluetooth label b,
      #power-profiles-daemon label b,
      #pulseaudio label b,
      #battery label b {
        color: @ws-active;
        font-style: italic;
        font-weight: 900;
      }

      #battery label u {
        color: @ws-active;
        font-style: italic;
        font-weight: 900;
        text-decoration: underline;
      }

      calendar label b { color: @ws-active; font-weight: bold; }
      calendar label i { color: @dim; font-style: italic; }
      calendar label small { color: @warn; }
    '';
  };

  xdg.configFile."waybar/config.jsonc".source = ./waybar/config.jsonc;
}

