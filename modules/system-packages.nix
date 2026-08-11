{ config, lib, pkgs, ... }:

{
  # ========== 系统服务 ==========
  services.openssh.enable = true;
  programs.fish.enable = true;
  programs.firefox.enable = true;
  programs.pay-respects = {
    enable = true;
    alias = "fcm";
  };
  programs.nix-ld = {
    enable = true;
  };
  programs.appimage = {
  enable = true;          # 启用 AppImage 支持
  binfmt = true;          # 开启 binfmt_misc 支持，允许直接运行 .AppImage 文件
  };
  services.flatpak.enable = true;
  
  # ========== 软件包 ==========
  environment.systemPackages = with pkgs; [
    # ----- 自定义下载地址的包 -----
    #(bilibili.overrideAttrs {
    #  src = fetchurl {
    #    url = "https://gh-proxy.org/https://github.com/msojocs/bilibili-linux/releases/download/v1.17.6-2/io.github.msojocs.bilibili_1.17.6-2_amd64.deb";
    #    hash = "sha256-vAKAYCbwS92Nqk0W+dN/GeYOcori4MY5e16mMDLfXPk=";
    #  };
    #})
    # ----- 其他包 -----
    gearlever   # 安装 Gear Lever 图形化管理工具
    gimp
    ffmpeg
    vlc
    evtest
    libreoffice-qt6-fresh
    hunspell
    vim
    wget
    curl
    axel
    yazi
    btop
    fd
    tree-sitter
    nodejs
    wmctrl
    xdotool
    ripgrep
    opencode
    pciutils
    git
    lazygit
    python3
    unzip
    nil
    lua-language-server
    direnv
    clang-tools
    clang
    gnumake
    gcc

    hmcl
    ascii
    emacs-gtk
    neovim
    neovide
    super-productivity
    fastfetch
    xwayland-satellite
    mpvpaper
    ghostty
    brightnessctl

    jq
    gtk3

    gdb
    cmake
    valgrind   # 内存检测
    ninja

    bibata-cursors
  ];

  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    wqy_zenhei
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
    iosevka
  ];
}
