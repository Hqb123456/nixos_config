{ config, lib, pkgs, ... }:

{
  # ========== 本地化/中文化配置 ==========
  # 1. 设置系统默认语言环境为中文
  i18n.defaultLocale = "zh_CN.UTF-8";
  
  # 2. 安装额外的语言环境（用于兼容其他语言格式）
  i18n.extraLocaleSettings = {
    LC_TIME = "zh_CN.UTF-8";      # 时间日期格式
    LC_MONETARY = "zh_CN.UTF-8";  # 货币格式
  };
  
  # 3. 控制台（TTY）设置
  console = {
    font = "Lat2-Terminus16";          # 控制台字体
    keyMap = "us";                     # 键盘布局（保持英文）
  };
  
  # 4. 时区配置
  time.timeZone = "Asia/Shanghai";       # 设置为中国时区
}
