{
  description = "Joe's dev environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05"; # pin exact nixpkgs
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux"; # or "aarch64-darwin" for Apple Silicon
      pkgs = import nixpkgs { inherit system; };
    in {
      homeConfigurations.joel = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          {
            home.username = "joel";
            home.homeDirectory = "/home/joel"; # macOS path
            home.packages = with pkgs; [
              awscli2
              bat
              delta
              direnv
              eza
              fastfetch
              fd
              fnm
              fzf
              git
              helix
              jq
              neovim
              openssh
              starship
              uv
              zoxide
            ];
          }
        ];
      };
    };
}
