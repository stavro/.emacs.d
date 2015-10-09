(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(unless (package-installed-p 'elixir-mode)
  (package-install 'elixir-mode))

(unless (package-installed-p 'alchemist)
  (package-install 'alchemist))

(unless (package-installed-p 'neotree)
  (package-install 'neotree))

(unless (package-installed-p 'fiplr)
  (package-install 'fiplr))
(global-set-key (kbd "C-x f") 'fiplr-find-file)

(setq fiplr-ignored-globs '((directories (".git" ".svn" "bower_components" "node_modules"))
                            (files ("*.jpg" "*.png" "*.zip" "*~"))))

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(add-to-list 'load-path (expand-file-name "parts" user-emacs-directory))

(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
(setq js-indent-level 2)

;(setq grep-find-template
;            "find . <X> -type f <F> -exec grep <C> -nH -C 3 -e <R> \\{\\} +")

(global-set-key (kbd "C-x g") 'rgrep)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;(eval-after-load 'grep
;  '(when (boundp 'grep-find-ignored-directories)
;     (add-to-list 'grep-find-ignored-directories "node_modules")
;     (add-to-list 'grep-find-ignored-directories "bower_components")
;     (add-to-list 'grep-find-ignored-directories "_build")
;     (add-to-list 'grep-find-ignored-directories "deps")
;   )
;)

(defun insert-and-indent-line-above ()
  (interactive)
  (push-mark)
  (let*
      ((ipt (progn (back-to-indentation) (point)))
       (bol (progn (move-beginning-of-line 1) (point)))
       (indent (buffer-substring bol ipt)))
    (newline)
    (previous-line)
    (insert indent)))

(global-set-key (kbd "C-j") 'insert-and-indent-line-above)

(require 'display-prt)
(require 'setup-rgrep)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
