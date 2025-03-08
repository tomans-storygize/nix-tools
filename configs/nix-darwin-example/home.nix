{pkgs, ...}:

let
  username = "tomans";
  fullname = "Thomas Omans";
  email = "tomans@storygize.com";
in {

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

    # pkgs.fish

    pkgs.wget
    pkgs.curl
    pkgs._1password-cli

    # nix language server
    pkgs.nil
  ];

  programs.git = {
    enable = true;
    userName = "${fullname}";
    userEmail = "${email}";

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


  programs.vscode = {
    enable = true;
    profiles.default.userSettings = {
      # ...
      "update.mode" = "none";
      "workbench.colorTheme" = "Dracula Theme";
      "files.watcherExclude" = {
        "**/.bloop" = true;
        "**/.metals" =  true;
        "**/.ammonite" = true;
      };
    };

    # ...

    profiles.default.extensions = [
      pkgs.vscode-marketplace.scala-lang.scala
      pkgs.vscode-marketplace.scalameta.metals
      pkgs.vscode-marketplace.redhat.java
      pkgs.vscode-marketplace.mkhl.direnv
      pkgs.vscode-marketplace.ms-python.python
      pkgs.vscode-marketplace.vscjava.vscode-java-pack
      pkgs.vscode-marketplace.dracula-theme.theme-dracula
    ];
  };

  # Adapted from https://github.com/yrashk/nix-home/blob/master/home.nix#L194
  # systemd stuff: see above link

  services = {};

  # Dotfiles for the home root, ~/
  home.stateVersion = "24.11";
  home.username = "${username}";
  home.sessionVariables = {
    EDITOR = "hx";
    # SHELL = "kitty";
    GIT_EXTERNAL_DIFF = "difft";
    XDG_CONFIG_HOME = "/Users/${username}/.config";
    LANG = "en_US.UTF-8";
    LC_TYPE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
  };

  # Dotfiles for ~/.config, ~/.local/share, etc. 
}
