{ config, lib, pkgs, ... }:
{
  # ========== 图形界面与 KDE Plasma 6 ==========
  services.xserver.enable = true;

  # KDE Plasma 6 桌面环境
  #services.desktopManager.plasma6.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  security.polkit.enable = true;
  
  programs.niri = {
    enable = true;
  };
  
  services.displayManager.ly.enable = true;
  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;
  
  
  # X11 键盘布局（保持英文，输入法会自动切换）
  services.xserver.xkb.layout = "us";

  # 注意：显卡驱动配置在 hardware.nix 模块中
  # 包含 Intel 集成显卡和 NVIDIA RTX 4060 Mobile 的混合显卡设置
}
