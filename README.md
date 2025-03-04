# nix tools

nixpkgs is a set of reproducible build scripts similar to homebrew

all configuration is defined thru `.nix` files using the [nix configuration language](https://nix.dev/tutorials/nix-language)

## getting started

some information and terms:

- [nix-via-lix](https://lix.systems/install/) core nix daemon and binaries
- [nix-darwin](https://github.com/LnL7/nix-darwin) use macOS as if it was nixOS
- [home-manager](https://nix-community.github.io/home-manager/index.xhtml#ch-introduction) define many dotfiles in one config
- [nixpkgs](https://github.com/NixOS/nixpkgs) community maintained collection of build scripts
- [devenv](http://devenv.sh/) automatic development environment from nixpkgs tools

# getting nix on your computer:

The configuration entry point is usually a `flake.nix` that defines configuration for a system.

The default location is: `/etc/nix-darwin/flake.nix`

See [the example flake.nix](./configs/nix-darwin-example/flake.nix)

You may use the included example to define your own system configuration.

### configuration reference searches

Many options can be defined, here are some useful tools to search them:

- nix/nix-darwin: https://mynixos.com/
- home-manager: https://home-manager-options.extranix.com/

### troubleshooting 

installing and updating will require sudo priveleges

did you forget a semicolon? nix parser is strict (like json or xml)
