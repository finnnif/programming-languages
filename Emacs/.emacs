; slime setup
; SBCL
; (setq inferior-lisp-program "/usr/local/bin/sbcl")
; CCL

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq inferior-lisp-program "/usr/local/bin/ccl/ccl64")
(add-to-list 'load-path "/Users/sanking/.emacs.d/slime")
(require 'slime-autoloads)
(slime-setup)

;  自动加载 company-mode 到所有 Buffer
(add-hook 'after-init-hook 'global-company-mode)

; hide the tool bar
(tool-bar-mode -1)

; set the font
(set-face-attribute 'default nil :font "Monaco")
(set-face-attribute 'default nil :height 170)

;Swank加载更快
; (setq slime-lisp-implementations
;       '((sbcl ("sbcl" "--core" "sbcl.core-for-slime"))))

; (setq slime-lisp-implementations
;       '((sbcl ("sbcl" "--core" "sbcl.core-with-swank")
;               :init (lambda (port-file _)
;                   (format "(swank:start-server %S)\n" port-file)))))

;关闭烦人的出错时的提示声。副作用: 上下滚动时会出现像素块
(setq visible-bell t)

;关闭启动时的那个“开机画面”。
(setq inhibit-startup-message t)

;显示列号。
(setq column-number-mode t)

;把 fill-column 设为 60. 这样的文字更好读。
(setq default-fill-column 60)

;括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号。
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;在标题栏显示buffer的名字，而不是 emacs@wangyin.com 这样没用 的提示。
(setq frame-title-format "emacs@%b")

;让 Emacs 可以直接打开和显示图片。
(auto-image-file-mode)

;进行语法加亮。
(global-font-lock-mode t)

;一个简单的办法设置 auto-mode-alist, 免得写很多 add-to-list.
(mapcar
 (function (lambda (setting)
      (setq auto-mode-alist
       (cons setting auto-mode-alist))))
 '(("\\.xml$".  sgml-mode)
   ("\\\.bash" . sh-mode)
   ("\\.rdf$".  sgml-mode)
   ("\\.session" . emacs-lisp-mode)
   ("\\.l$" . c-mode)
   ("\\.css$" . css-mode)
   ("\\.cfm$" . html-mode)
   ("gnus" . emacs-lisp-mode)
   ("\\.idl$" . idl-mode)))

; color theme setup 
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized/")
(load-theme 'solarized t)

; (add-to-list 'load-path "~/.emacs.d/color-theme/")
; (require 'color-theme)
; (eval-after-load "color-theme"
;   '(progn
;      (color-theme-initialize)
;      (color-theme-hober)))

; (add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized/")
; (require 'color-theme-solarized)
; (color-theme-solarized)

(setq mouse-yank-at-point t)
;不要在鼠标点击的那个地方插入剪贴板内容。我不喜欢那样，经常把 我的文档搞的一团糟。我觉得先用光标定位，然后鼠标中键点击要好 的多。不管你的光标在文档的那个位置，或是在 minibuffer，鼠标 中键一点击，X selection 的内容就被插入到那个位置。

(setq kill-ring-max 200)
;用一个很大的 kill ring. 这样防止我不小心删掉重要的东西。我很 努莽的，你知道 :P

;;  (setq-default indent-tabs-mode nil)
;;  (setq default-tab-width 4)
;;  (setq tab-stop-list ())
;;  (loop for x downfrom 40 to 1 do
;;        (setq tab-stop-list (cons (* x 4) tab-stop-list)))
;; 不用 TAB 字符来indent, 因为这会引起很多奇怪的错误。编辑 Makefile 的时候也不用担心，因为 makefile-mode 会把 TAB 键设置成真正的 TAB 字符，并且加亮显示的。

; (setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
; (setq sentence-end-double-space nil)
; ;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插 入两个空格。

; (setq enable-recursive-minibuffers t)
; ;可以递归的使用 minibuffer。我经常需要这么做。

(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;(setq scroll-margin 3
;      scroll-conservatively 10000)
;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。

;(require 'smooth-scrolling)
;(setq smooth-scroll-margin 1)
;平滑滚动

; (setq default-major-mode 'text-mode)
; ;把缺省的 major mode 设置为 text-mode, 而不是几乎什么功能也 没有的 fundamental-mode.

(mouse-avoidance-mode 'animate)
;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。

(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)
;把这些缺省禁用的功能打开。

; (setq version-control t)
; (setq kept-new-versions 3)
; (setq delete-old-versions t)
; (setq kept-old-versions 2)
; (setq dired-kept-versions 1)
; ;设置一下备份时的版本控制，这样更加安全。

; (setq dired-recursive-copies 'top)
; (setq dired-recursive-deletes 'top)
;让 dired 可以递归的拷贝和删除目录。
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (sml-mode company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; smlnj
(setenv "PATH" (concat "/usr/local/smlnj/bin:" (getenv "PATH")))
(setq exec-path (cons "/usr/local/smlnj/bin"  exec-path))
(add-to-list 'auto-mode-alist '("\\.\\(sml\\|sig\\)\\'" . sml-mode))
