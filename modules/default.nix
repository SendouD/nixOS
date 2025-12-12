{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./qtile.nix 
    #./solana.nix
   # ./devshell.nix
];
}

