{ config, lib, pkgs, inputs, ... }:
{
  # ========== 导入其他配置文件 ==========
  imports = [ ./hardware-configuration.nix ] ++ (let
      modulesDir = ./modules;
      files = builtins.readDir modulesDir;
      fileNames = builtins.attrNames files;
      isNixFile = name: 
        let
          fileType = files.${name};
          len = builtins.stringLength name;
          nixLen = builtins.stringLength ".nix";
          suffix = builtins.substring (len - nixLen) len name;
        in fileType == "regular" && suffix == ".nix";
      moduleNames = builtins.filter isNixFile fileNames;
    in map (name: modulesDir + "/${name}") moduleNames);


  nix = {
    settings = {
	    substituters = lib.mkForce [
		    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
		    "https://mirror.sjtu.edu.cn/nix-channels/store"
		    #"https://mirrors.cernet.edu.cn/nix-channels/store"
		    #"https://mirrors.ustc.edu.cn/nix-channels/store"
		    "https://noctalia.cachix.org"
	    ];
	    trusted-substituters = [
		    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
		    "https://mirror.sjtu.edu.cn/nix-channels/store"
		    #"https://mirrors.cernet.edu.cn/nix-channels/store"
		    #"https://mirrors.ustc.edu.cn/nix-channels/store"
		    "https://noctalia.cachix.org"
	    ];
	    trusted-public-keys = [
		    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
	    	    "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
	    ];
    };
  };


# ========== 系统状态版本 ==========
  system.stateVersion = "26.05";
}
