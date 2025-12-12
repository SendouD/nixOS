{ config, pkgs, inputs, ... }:

let
  solanaPkgs = inputs.solana-nix.packages.x86_64-linux;
in
{
  # Add Solana CLI and SPL token binaries to system packages
  environment.systemPackages = with pkgs; [
    solanaPkgs.solana         # Solana CLI (solana, solana-keygen, etc.)
    solanaPkgs.solana-tokens  # SPL token CLI equivalent
  ];
}

