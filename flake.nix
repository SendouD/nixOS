{

  description = "One flake to rule them all";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    stable-nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    home-manager = {
    	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
    };

   };

  outputs = { self, nixpkgs,stable-nixpkgs, ... }@ inputs:
  let 
    system="x86_64-linux";
     pkgs=nixpkgs.legacyPackages.${system};
     dotsDir="/home/sendou/nixos-flakes/dots";
  in
  {  
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs= {inherit inputs dotsDir ;};
        modules = [
           ./configuration.nix
           ./modules/isw.nix
          # ./modules/solana.nix
          # ./modules/devshell.nix     
            ];
        };
  
   };

}
