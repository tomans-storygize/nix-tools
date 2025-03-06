{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    nix-vscode-extensions
  }:
    let
      user_NAME = "tomans"; # whoami
      hostname = "Storygize-tomans"; # hostname -s

      configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget      

      environment.systemPackages =
        [
          pkgs.vim
          # some standard admin tools
          pkgs.git
        ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";
      nix.settings.trusted-users = [
        "root"
        user_NAME
      ];

      nix.channel.enable = false;
      # some system level vscode stuff
      nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
        # list of non-free software allowed to be installed
        "vscode"
        "Xcode.app"
      ];
      nixpkgs.overlays = [
        nix-vscode-extensions.overlays.default
      ];

      users.users."${user_NAME}" = {
        home = "/Users/${user_NAME}";
      };

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Storygize-tomans
    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users."${user_NAME}" = import ./home.nix;

          # Optionally, use home-manager.extraSpecialArgs to pass
          # arguments to home.nix
        }

      ];
    };
  };
}
