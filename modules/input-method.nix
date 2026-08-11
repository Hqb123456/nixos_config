{ config, lib, pkgs, ... }:

{
  # ========== 中文输入法配置（Fcitx5 + Rime）- 包名已修正 ==========
  i18n.inputMethod = {
    enable = true;                     # 启用输入法
    type = "fcitx5";                   # 使用 fcitx5 框架
    fcitx5.addons = with pkgs; [       # Fcitx5 插件
      fcitx5-gtk 
      fcitx5-rime                       # 中州韵输入引擎（推荐）
      pkgs.qt6Packages.fcitx5-chinese-addons  # 中文附加组件
    ];
  };
}
