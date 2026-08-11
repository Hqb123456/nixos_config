{ config, lib, pkgs, ... }:

{
  # ========== 引导加载程序配置（GRUB）==========
  boot.loader = {
    grub = { 
      enable = true;                    # 启用 GRUB 作为引导管理器
      efiSupport = true;                # 启用 UEFI 支持
      device = "nodev";                 # UEFI 模式下必须设为 "nodev"
      useOSProber = true;               # 自动检测其他系统（Windows）
    };
    efi = {
      canTouchEfiVariables = true;      # <--- 关键！允许修改 BIOS 启动项
    };
  };

  # ========== 内核配置 ==========
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
