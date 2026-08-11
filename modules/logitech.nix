{ config, pkgs, ... }:

{
  # 1. 启用硬件支持模块，这会自动添加必要的 udev 规则
  hardware.logitech.wireless.enable = true;

  # 2. 安装 Solaar
  environment.systemPackages = [ pkgs.solaar ];
}
