
{ config, pkgs, ... }:

rec {

  imports = [ ./configurations/nix-insync-portable/home-manager-module.nix ];
  services.insync-headless.enable = true;


  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = builtins.getEnv "USER";
  home.homeDirectory = /home/${home.username};
  #home.enableNixpkgsReleaseCheck = false;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "22.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environl example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  home.packages = with pkgs; [
      glibc
      ninja
      unzip
      zip
      git
      fish
      zellij
      bat
      ripgrep
      jq
      htop
      btop
      tree
      hplip
      killall
      wget
      alacritty
      gnome-extension-manager
      gnome.gnome-session
      fd
      wlogout
      python312
      neofetch
      autojump
      #insync
      distrobox

      thunderbird
      firefox
      google-chrome
      element-desktop
      signal-desktop
      discord
      vscode
      spotify
      obsidian
      qemu
      brave
      cryptomator
      gh
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jbc/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.starship.enable = true;
  programs.wlogout.enable = true;
  programs.nnn = {
    enable = true;
    package = pkgs.nnn.override ({ withNerdIcons = true; });
    bookmarks = {
      w = "~/Work";
      d = "~/Downloads";
      m = "~/Mothership/config";
      D = "~/Insync/romdisc@live.com/OneDrive/Dokumente/001 privat";
      S = "~/Software";
    };
  };
  #programs.sagemath.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
