{ config, lib, pkgs, ... }:

{
  # ========== 用户账户 ==========
  users.users.shorin = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "networkmanager" "libvirtd"];          # sudo 权限
    initialPassword = "shorin";         # 登录后请立即用 passwd 改密码！
    shell = pkgs.fish;
    packages = with pkgs; [
    ];
  };

  # 2. 关闭 wheel 组的密码验证
  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;  # 核心开关
  };
}
