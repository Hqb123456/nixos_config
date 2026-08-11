{ config, pkgs, noctalia, ... }:  # ✅ 直接接收 noctalia
{
  imports = [
    noctalia.nixosModules.default  # ✅ 直接引用，无递归
  ];

  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };

  nix.settings = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };
}
