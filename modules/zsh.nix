{config , pkgs  , dotsDir ,  ...}:


{
 	programs.zsh = {
		enable = true ;
		enableCompletion = true ;
		autosuggestion = {
			enable = true ;
	} ;
		syntaxHighlighting.enable = true ;
 		
		#Shell Aliases for zsh shell
		shellAliases = {
			ll = "ls -l";
			hmmm = "sudo nixos-rebuild switch --impure";
			uuuh = "sudo nix-collect-garbage -d";
			home = "cd ~";
			clear = "clear && fastfetch  ";
		};
                #Extra config for zsh shell 
		initExtra = builtins.readFile "${dotsDir}/config.zsh";
		oh-my-zsh = {
			enable = true ;
			plugins = ["git" "dotenv"];
			theme = "robbyrussell";
		};

		history.size = 10000;
 	}; 
        home.packages = with pkgs; [
           openssl
           pkg-config
       ];
    
}
