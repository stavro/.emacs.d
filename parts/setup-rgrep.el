
(eval-after-load "grep"
  '(progn
     ;; Don't recurse into some directories
     (add-to-list 'grep-find-ignored-directories "target")
     (add-to-list 'grep-find-ignored-directories "node_modules")
     (add-to-list 'grep-find-ignored-directories "deps")
     (add-to-list 'grep-find-ignored-directories "_build")
     (add-to-list 'grep-find-ignored-directories "bower_components")
     (add-to-list 'grep-find-ignored-directories "vendor")

     ;; Add custom template to add context
    (setq grep-find-template
           "find . <X> -type f <F> -exec grep <C> -nH -e <R> \\{\\} +")

     ;; Add custom keybindings
    (global-set-key (kbd "C-x g") 'rgrep)))


(provide 'setup-rgrep)
