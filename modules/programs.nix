{ config, lib, pkgs, ... }:

{
  programs.nh = {
    enable = true;  # 必需：启用模块
    
    # 默认 flake 位置，执行 nh os 时可省略 --flake 参数
    flake = "/etc/nixos";
  };  
}
