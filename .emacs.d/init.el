;; 确保包系统初始化
(require 'package)

;; 使用国内源（清华镜像）
(setq package-archives
      '(("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
        ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; 安装并加载 use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; 禁用自动保存
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)

;; 禁用恢复文件（备份）
(setq make-backup-files nil)
(setq backup-inhibited t)

;; 禁用文件锁
(setq create-lockfiles nil)

;; 字体
(set-face-attribute 'default nil :family "JetBrains Mono Nerd Font" :height 230)
;; (toggle-frame-fullscreen)
;; 选中后输入直接替换
(delete-selection-mode 1)

;; 选中区域后按 M-; 快速注释
(define-key global-map (kbd "M-;") #'comment-dwim)



(setq ring-bell-function 'ignore)

;; y/n 代替 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; M-x 补全
(use-package vertico
  :demand t
  :config (vertico-mode 1))

(use-package orderless
  :config (setq completion-styles '(orderless partial-completion basic)
                completion-category-overrides '((file (orderless partial-completion)))))

(use-package marginalia
  :after vertico
  :config (marginalia-mode 1))

(setq enable-recursive-minibuffers t)

(global-set-key (kbd "M-x") #'execute-extended-command)


;; ============ 通用缩进：用 Emacs 默认 ============

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(electric-indent-mode 1)

;; 自动配对括号
(add-hook 'prog-mode-hook #'electric-pair-mode)

;; ============ C/C++ 配置 ============

(setq c-basic-offset 4)

(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-style "k&r")
            (setq c-basic-offset 4)
            (setq indent-tabs-mode nil)
            (setq tab-width 4)
            (setq c-default-style '((java-mode . "java")
                                    (awk-mode . "awk")
                                    (other . "k&r")))
            ;; 确保在 C++ buffer 中启用 Emacs 原生缩进
            (electric-indent-mode 1)
            ;; 禁用 LSP 的 buffer-local 缩进和格式化
            (setq-local lsp-enable-indentation nil)
            (setq-local lsp-before-save-edits nil)
            (setq-local lsp-enable-on-type-formatting nil)
            (setq-local lsp-format-trigger nil)))

;; ============ Nix 配置 ============

(use-package nix-mode
  :mode "\\.nix\\'"
  :config
  (add-hook 'nix-mode-hook
            (lambda ()
              (setq indent-tabs-mode nil)
              (setq tab-width 2))))

;; ============ LSP-MODE 配置 ============

(use-package lsp-mode
  :hook ((c++-mode . lsp-deferred)
         (c-mode . lsp-deferred)
         (nix-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred)
  :bind (:map lsp-mode-map
         ("<f12>"   . lsp-find-definition)
         ("M-."     . xref-find-definitions)
         ("C-c r"   . lsp-rename)
         ("C-c R"   . lsp-find-references)
         ("C-c a"   . lsp-execute-code-action)
         ("C-c h"   . lsp-describe-thing-at-point)
         ("C-c i"   . lsp-find-implementation))
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-auto-guess-root t)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-enable-snippet nil)
  (setq lsp-enable-indentation nil)
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-enable-on-the-fly-formatting nil)
  (setq lsp-before-save-edits nil)
  (setq lsp-auto-execute-action nil)
  (setq read-process-output-max (* 1024 1024))
  (setq gc-cons-threshold 100000000)
  (setq lsp-install-server nil)
  
  :config
  (setq lsp-clients-clangd-args
        '("--background-index"
          "--completion-style=detailed"
          "--header-insertion=never"
          "--header-insertion-decorators=0"
          "-j=4"
          "--fallback-style=none"))
  
  (setq lsp-nix-nil-formatter ["nixpkgs-fmt"]))

(use-package lsp-ui
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'at-point
        lsp-ui-doc-delay 0.5
        lsp-ui-sideline-enable t
        lsp-ui-sideline-show-diagnostics t
        lsp-ui-sideline-show-code-actions t))

;; ============ LSP 增强 ============

;; 语义高亮（类型、变量、函数不同颜色）—— lsp-mode 内置
(add-hook 'lsp-mode-hook #'lsp-semantic-tokens-mode)

(use-package consult
  :ensure t
    :bind (("C-c T" . consult-theme)))  ;; 绑定快捷键 C-c t)

;; 工作区符号搜索（模糊搜索项目中的类、函数、变量）
(use-package consult-lsp
  :after lsp-mode
  :bind
  ("C-c s" . consult-lsp-symbols))

;; 树状视图：错误列表、符号大纲、调用/类型层次
(use-package lsp-treemacs
  :after lsp-mode
  :bind (:map lsp-mode-map
         ("C-c e" . lsp-treemacs-errors-list)
         ("C-c S" . lsp-treemacs-symbols)
         ("C-c c" . lsp-treemacs-call-hierarchy)
         ("C-c t" . lsp-treemacs-type-hierarchy)))

;; ============ 补全 ============

(use-package company
  :demand t
  :config
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 2
        company-show-numbers t)
  (global-company-mode 1))

;; ============ C++ 增强 ============

(use-package flycheck
  :ensure t
  :hook (prog-mode . flycheck-mode)
  :config
  (setq flycheck-clang-language-standard "c++20"))

(use-package modern-cpp-font-lock
  :ensure t
  :hook (c++-mode . modern-c++-font-lock-mode))

(use-package cmake-mode
  :ensure t)

(use-package clang-format
  :ensure t
  :bind ("C-c f" . clang-format-buffer))

;; ============ 项目管理 ============

(use-package projectile
  :config
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; ============ 编译 ============

(defun my-compile ()
  "在项目根目录编译"
  (interactive)
  (let ((default-directory (or (projectile-project-root) default-directory)))
    (save-buffer)
    (compile "make -j$(nproc)")))

(with-eval-after-load 'c++-mode
  (define-key c++-mode-map (kbd "<f5>") #'my-compile))

(with-eval-after-load 'c-mode
  (define-key c-mode-map (kbd "<f5>") #'my-compile))

;; 头文件/源文件切换
(add-hook 'c-mode-common-hook
          (lambda ()
            (local-set-key (kbd "C-c o") #'ff-find-other-file)))

;; ============ 相对行号 ============

(setq display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'text-mode-hook #'display-line-numbers-mode)

;; ============ UI ============

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(setq inhibit-startup-screen t)
(show-paren-mode 1)
(column-number-mode 1)

;; 主题
(use-package dracula-theme
  :demand t
  :config                  ;; 在加载插件后执行的代码
  (load-theme 'dracula t)
  )
(use-package gruber-darker-theme
  :demand t
  )  

(use-package ace-window
 :ensure t
 :bind (("C-x o" . 'ace-window)))

(use-package amx
 :ensure t
 :init (amx-mode))

(use-package mwim
 :ensure t
 :bind
 ("C-a" . mwim-beginning-of-code-or-line)
 ("C-e" . mwim-end-of-code-or-line))

(use-package which-key
 :ensure t ; Emacs 30+ 此行不必须
 :init (which-key-mode))

(use-package dashboard
 :ensure t
 :config
 (setq dashboard-banner-logo-title "shorin,Welcome back") ;; 个性签名，随读者喜好设置
 (setq dashboard-projects-backend 'projectile) ;; 读者可以暂时注释掉这一行，等安装了 projectile 后再使用
 (setq dashboard-startup-banner 'official) ;; 也可以自定义图片
 (setq dashboard-items '((recents . 5)  ;; 显示多少个最近文件
  (bookmarks . 5) ;; 显示多少个最近书签
  (projects . 10))) ;; 显示多少个最近项目
 (dashboard-setup-startup-hook))

(use-package highlight-symbol
 :ensure t
 :init (highlight-symbol-mode)
 :bind ("<f3>" . highlight-symbol)) ;; 按下 F3 键就可高亮当前符号

(use-package rainbow-delimiters
 :ensure t
 :hook (prog-mode . rainbow-delimiters-mode))

(use-package magit
 :ensure t)

(use-package neotree
  :ensure t
  :bind ("s-d" . neotree-toggle))

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode 1)
  (setq undo-tree-auto-save-history nil))

;; ============ expand-region: 递增选中语法单元 ============

(use-package expand-region
  :bind ("C-=" . er/expand-region))
;; ============ 以下由 opencode（AI）添加 ============

;; 文件外部改动自动重载
(setq auto-revert-use-notify t)
(setq auto-revert-interval 1)
(global-auto-revert-mode 1)

(set-face-foreground 'region "#ddd6f0")
(set-face-foreground 'vertico-current "#ddd6f0")

;; ============ move-text: C-上下键移动行并自动缩进 ============

(use-package move-text
  :bind
  (("C-<up>"   . move-text-up)
   ("C-<down>" . move-text-down)))

(defun my/move-text-indent-advice (&rest _)
  (let ((deactivate deactivate-mark))
    (if (region-active-p)
        (indent-region (region-beginning) (region-end))
      (indent-region (line-beginning-position) (line-end-position)))
    (setq deactivate-mark deactivate)))

(advice-add 'move-text-up   :after #'my/move-text-indent-advice)
(advice-add 'move-text-down :after #'my/move-text-indent-advice)

(setq duplicate-line-final-position 1)
(global-set-key (kbd "C-,") #'duplicate-line)

;; ============ sudo-edit: 以 root 权限编辑文件 ============

(use-package sudo-edit
  :ensure t
  :bind ("C-c C-r" . sudo-edit))

(use-package envrc
  :ensure t
  :init
  (envrc-global-mode 1))

;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compile-command "make -k -j")
 '(custom-safe-themes
   '("0223215a464167d93b9cfef9b1cdf9b0768ab660f33b3068b647f7b12aa453a0"
     default))
 '(package-selected-packages
   '(amx clang-format cmake-mode company consult-lsp dashboard
         dracula-theme envrc expand-region flycheck
         gruber-darker-theme highlight-symbol lsp-treemacs lsp-ui
         magit marginalia modern-cpp-font-lock move-text mwim neotree
         nix-mode orderless projectile rainbow-delimiters sudo-edit
         undo-tree vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
