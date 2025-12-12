{config , lib ,  pkgs , dotsDir , ...}:
let 
configDir = "/home/sendou/.config";
in
{
	home.file.wqtile_config = {
		source = "/home/sendou/nixos-flakes/dots/qtile.py";
		target = "${configDir}/qtile/config.py";
	};	

}
