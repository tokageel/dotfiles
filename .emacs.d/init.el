(add-to-list 'load-path "~/.emacs.d/site-lisp")

;; テーマ
(load-theme 'misterioso)
(set-face-attribute 'default nil :family "CodeM" :height 120)

;hide welcome screen
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)

;; メニューバーを非表示
(menu-bar-mode 0)
;; ツールバーを非表示
(tool-bar-mode 0)
;;行、列表示
(line-number-mode t)
(column-number-mode t)
;;関数名表示
(which-function-mode 1)

;; カレント行をハイライト表示
(global-hl-line-mode 1)
;; 対応する括弧を光らせる
(show-paren-mode 1)
;; ウィンドウ内に収まらないときだけ括弧内も光らせる
(setq show-paren-style 'mixed)

;; 空白や長すぎる行を視覚化する。
(require 'whitespace)
;; 1行が100桁を超えたら長すぎると判断する。
(setq whitespace-line-column 100)
(setq whitespace-style '(face              ; faceを使って視覚化する。
                         trailing          ; 行末の空白を対象とする。
                         lines-tail        ; 長すぎる行のうち
                                           ; whitespace-line-column以降のみを
                                           ; 対象とする。
                         space-before-tab  ; タブの前にあるスペースを対象とする。
                         space-after-tab)) ; タブの後にあるスペースを対象とする。
;; デフォルトで視覚化を有効にする。
(global-whitespace-mode 1)

;; frame
(setq initial-frame-alist
      (append
       '((top . 45)    ; フレームの Y 位置(ピクセル数)
	 (left . 100)    ; フレームの X 位置(ピクセル数)
	 (width . 140)    ; フレーム幅(文字数)
	 (height . 80)   ; フレーム高(文字数)
	 ) initial-frame-alist))
;; バックアップファイルを生成しない
(setq make-backup-files nil)
;; オートセーブしない
(setq auto-save-default nil)
;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;; モードラインの割合表示を総行数表示
(defvar my-lines-page-mode t)
(defvar my-mode-line-format)

;; C-RETで矩形選択モード
(cua-mode t)
(setq cua-enable-cua-keys nil)
;; C-t lで折り返し表示切り替え
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)
;; C-hでBS
(keyboard-translate ?\C-h ?\C-?)


;; settings for MELPA
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;;(require 'helm)
(require 'helm-config)
;(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c f") 'helm-find)
(global-set-key (kbd "C-c C-f") 'helm-find-files)
(global-set-key (kbd "C-c r") 'helm-recentf)
(global-set-key (kbd "C-c C-s") 'helm-regexp)
(global-set-key (kbd "C-c C-g") 'helm-do-grep)
(global-set-key (kbd "C-M-o") 'helm-occur)
(define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch)
;;(define-key helm-map (kbd "C-c C-a") 'all-from-helm-occur)

;;;;gtags
;;(require 'helm-gtags)
;;;; Enable helm-gtags-mode
;;(add-hook 'c-mode-hook 'helm-gtags-mode)
;;(add-hook 'c++-mode-hook 'helm-gtags-mode)
;;(add-hook 'asm-mode-hook 'helm-gtags-mode)

;; ;; Set key bindings
;; (eval-after-load "helm-gtags"
;;   '(progn
;;      (define-key helm-gtags-mode-map (kbd "C-c C-t") 'helm-gtags-find-tag)
;;      (define-key helm-gtags-mode-map (kbd "C-c C-r") 'helm-gtags-find-rtag)
;;      (define-key helm-gtags-mode-map (kbd "C-c C-s") 'helm-gtags-find-symbol)
;;      (define-key helm-gtags-mode-map (kbd "C-c M-p") 'helm-gtags-parse-file)
;;      (define-key helm-gtags-mode-map (kbd "C-c C-p") 'helm-gtags-previous-history)
;;      (define-key helm-gtags-mode-map (kbd "C-c C-n") 'helm-gtags-next-history)
;;      (define-key helm-gtags-mode-map (kbd "C-c C-b") 'helm-gtags-pop-stack)))


;; Emacsでmoccur-grepとmoccur-editからagとwgrepに移行したら爆速で快適すぎる - kotatu.org
;; http://kotatu.org/blog/2013/12/18/emacs-ag-wgrep-for-code-grep-search/
(require 'ag)
(custom-set-variables
 '(ag-highlight-search t)  ; 検索結果の中の検索語をハイライトする
 '(ag-reuse-window 'nil)   ; 現在のウィンドウを検索結果表示に使う
 '(ag-reuse-buffers 'nil)) ; 現在のバッファを検索結果表示に使う
(require 'wgrep-ag)
(autoload 'wgrep-ag-setup "wgrep-ag")
(add-hook 'ag-mode-hook 'wgrep-ag-setup)
;; キーバインドを適当につけておくと便利。"\C-xg"とか
(global-set-key (kbd "C-c m") 'ag)
;; ag開いたらagのバッファに移動するには以下をつかう
(defun my/filter (condp lst)
  (delq nil
        (mapcar (lambda (x) (and (funcall condp x) x)) lst)))
(defun my/get-buffer-window-list-regexp (regexp)
  "Return list of windows whose buffer name matches regexp."
  (my/filter #'(lambda (window)
              (string-match regexp
               (buffer-name (window-buffer window))))
          (window-list)))
(global-set-key [(super m)]
                #'(lambda ()
                    (interactive)
                    (call-interactively 'ag)
                    (select-window ; select ag buffer
                     (car (my/get-buffer-window-list-regexp "^\\*ag ")))))
