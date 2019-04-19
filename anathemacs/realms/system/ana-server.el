;;; ana-server.el ---

;; Author: e.g. pavelka <pav@egpavelka.com>
;; URL: https://github.com/egpavelka/anathemacs

;;; Commentary:
;;
;;

;;; Code:

(use-package counsel-tramp
  :general
  (hs-leader-def
  "ss" 'counsel-tramp)
  :config
  (add-hook 'counsel-tramp-pre-command-hook '(lambda () (global-aggressive-indent-mode 0)
				     (projectile-mode 0)
				     (editorconfig-mode 0)))
  (add-hook 'counsel-tramp-quit-hook '(lambda () (global-aggressive-indent-mode 1)
			      (projectile-mode 1)
			      (editorconfig-mode 1))))


(use-package nginx-mode
  :defer t)

(use-package company-nginx
  :hook (nginx-mode . (set-local-company-backend company-nginx)))

(use-package tramp-term
  :general
  (hs-leader-def
  "sS" 'tramp-term)
  :config
  (setq tramp-default-method "ssh")
  (add-to-list 'tramp-methods
                   '("yadm"
                     (tramp-login-program "yadm")
                     (tramp-login-args (("enter")))
                     (tramp-remote-shell "/bin/sh")
                     (tramp-remote-shell-args ("-c")))))

(provide 'ana-server)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ana-server.el ends here
