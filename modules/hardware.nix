{ config, lib, pkgs, ... }:
{
  # ========== 内核参数 ==========
  boot.kernelParams = [
    "nvidia.NVreg_EnableGpuFirmware=0"
    "nvidia.NVreg_EnableS0ixPowerManagement=0"
    "nvidia_drm.modeset=1"
  ];
  
  boot.extraModprobeConfig = ''
    options snd-hda-intel probe_mask=1
  '';
  
  # ========== Intel 核显 ==========
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  
  # ========== NVIDIA RTX 4060 ==========
  services.xserver.videoDrivers = [ "nvidia" ];
  
  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
    nvidiaSettings = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
  
  # ========== 蓝牙 ==========
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
