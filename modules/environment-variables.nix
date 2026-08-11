{ config, lib, pkgs, ... }:

{
  environment.variables = {
    QT_QPA_PLATFORM_PLUGIN_PATH = "${pkgs.qt6.qtbase.outPath}/lib/qt-6/plugins";
  };
  
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XCURSOR_THEME = "Bibata-Modern-Classic"; # 或 "Bibata-Original-Classic"
    XCURSOR_SIZE = "26";
  };
}
