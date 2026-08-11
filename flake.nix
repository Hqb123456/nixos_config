{
  inputs = {
    nixpkgs-unstable.url = "git+https://mirrors.tuna.tsinghua.edu.cn/git/nixpkgs.git?ref=nixpkgs-unstable&shallow=1";
    
    home-manager = {
      url = "git+https://gh-proxy.org/https://github.com/nix-community/home-manager.git?ref=master&shallow=1";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    noctalia = {
      url = "git+https://gh-proxy.org/https://github.com/noctalia-dev/noctalia.git?ref=cachix&shallow=1";
    };
  };

  outputs = { self, nixpkgs-unstable, home-manager, noctalia, ... }:
  let
    lib = nixpkgs-unstable.lib;
  in
  {
    nixosConfigurations.nixos = lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit noctalia home-manager;
      };
      modules = [
        home-manager.nixosModules.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
	    backupFileExtension = "bak";  # 添加这行，会自动备份原文件为 config.fish.backup
            users.shorin = import ./home.nix;  # 注意这里用 import
          };
        }
        ./configuration.nix  # 这个作为 modules 数组的最后一个元素
      ];
    };
  };
}
