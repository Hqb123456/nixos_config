{ config, lib, pkgs, ... }:

{
  # ========== 声音系统 ==========
  services.pipewire = {
    enable = true;
    pulse.enable = true;                # 兼容 PulseAudio
  };
}
