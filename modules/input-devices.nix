{ config, lib, pkgs, ... }:

{
  # ========== 触摸板支持 ==========
  services.libinput.enable = true;
}
