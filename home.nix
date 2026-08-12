{ config, pkgs, ... }:

{
    home.stateVersion = "26.05";
    home.username = "shorin";
    home.homeDirectory = "/home/shorin";

    # 安装软件包
    home.packages = with pkgs; [
        tree
        fzf                    # 安装 fzf 本身
        bat
        fd                     # 添加 fd，用于文件搜索
    ];

    programs.fzf = {
        enable = true;
        enableFishIntegration = true;
    };


	programs.fish = {
        enable = true;
        shellAliases = {
            nrsh = "sudo nixos-rebuild switch --flake /home/shorin/shorin_nixos_file#nixos";
            nclean = "nh clean all -k 3 -a && nix-store --optimise -vvv"; 
        };
        shellInit = ''
    set -gx EDITOR nvim

    set -gx FZF_FIND_FILE_COMMAND 'fd --type f --hidden --follow'
    set -gx FZF_CD_COMMAND 'fd --type d --hidden --follow'

    # 设置 fzf 显示样式 - 增大窗口和预览区域
    set -gx FZF_DEFAULT_OPTS '--height 80% --border --preview-window=right:50% --layout=reverse --info=inline'

    # 定义 fzf_open 函数
    function fzf_open --description "Use fzf to select and open file with EDITOR, sudo if needed"
        # 使用 fd 查找文件，通过管道直接传给 fzf
        # 使用更大的预览窗口和更好的显示
        set selected_file (fd . --type f --hidden --exclude .git --exclude .cache --exclude node_modules 2>/dev/null | fzf \
            --height 80% \
            --border \
            --preview-window=right:60%:wrap \
            --layout=reverse \
            --info=inline \
            --prompt="Select file > " \
            --preview "bat --style=numbers,header --color=always --line-range=:500 {} 2>/dev/null || cat {} 2>/dev/null")

        # 如果没有选择文件，直接返回
        if test -z "$selected_file"
            return 0
        end

        # 检查文件是否属于当前用户
        set file_owner (stat -c %u "$selected_file" 2>/dev/null)
        set current_user (id -u)

        # 如果文件不属于当前用户，或者文件在系统目录下，使用 sudo
        if test "$file_owner" != "$current_user"
            or string match -q "/etc/*" "$selected_file"
            or string match -q "/usr/*" "$selected_file"
            or string match -q "/var/*" "$selected_file"
            echo "Opening with sudo: $selected_file"
            sudo $EDITOR "$selected_file"
        else
            $EDITOR "$selected_file"
        end
    end

    # 绑定 Ctrl+O 快捷键
    bind \co fzf_open
        '';
    };

    xdg.configFile."nvim" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/shorin/shorin_nixos_file/dotfile_config/nvim/";
        recursive = true;
    };

    xdg.configFile."noctalia" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/shorin/shorin_nixos_file/dotfile_config/noctalia/";
        recursive = true;
    };

    xdg.configFile."niri" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/shorin/shorin_nixos_file/dotfile_config/niri/";
        recursive = true;
    };

    xdg.configFile."yazi" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/shorin/shorin_nixos_file/dotfile_config/yazi/";
        recursive = true;
    };
    
}
