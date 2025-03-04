{pkgs, ...}:

{

  home.packages = [
    pkgs.silver-searcher
    pkgs.dust
    pkgs.devenv
    pkgs.joshuto
    pkgs.zellij
    pkgs.unzip
    pkgs.bottom
    pkgs.tree
    pkgs.neofetch
    pkgs.difftastic

    pkgs.docker
    pkgs.lima

    # pkgs.helix

    pkgs.zellij
    pkgs.bottom
    pkgs.magic-wormhole

    pkgs.wget
    pkgs.curl

    # nix language server
    pkgs.nil
  ];

  programs.git = {
    enable = true;
    userName = "Thomas Omans";
    userEmail = "tomans@storygize.com";

    extraConfig = {
      branch.autosetuprebase = "always";
      color.ui = true;
      init.defaultBranch = "main";
    };
  };

  programs.starship = {
    enable = true;
  };

  programs.eza = {
    enable = true;
  };

  programs.zsh = {
    # let home manager manage my zsh config
    enable = true;
    enableCompletion = true;

    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git" "z"
      ];
    };

    shellAliases = {
      
    };
  };

  programs.helix= {
    enable = true;
  };

  programs.direnv = {
    enable = true;

    nix-direnv = {
      enable = true;
    };

    config = {
      load_dotenv = true;
    };
  };

  programs.kitty = {
    enable = true;
    # themeFile = "3024_Day";
    themeFile = "Kaolin_Breeze";
  };

  services = {};

  # Adapted from https://github.com/yrashk/nix-home/blob/master/home.nix#L194
  # systemd stuff: see above link

  # Dotfiles for the home root, ~/
  home.stateVersion = "24.11";
  home.username = "tomans";
  home.sessionVariables = {
    EDITOR = "hx";
    SHELL = "xterm-256color";
    GIT_EXTERNAL_DIFF = "difft";
    XDG_CONFIG_HOME = "/Users/tomans/.config";
    LANG = "en_US.UTF-8";
    LC_TYPE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
  };

  # Dotfiles for ~/.config, ~/.local/share, etc. 
}
