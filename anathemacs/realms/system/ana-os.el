;;; ana-os.el ---

;; Author: e.g. pavelka <pav@egpavelka.com>
;; URL: https://github.com/egpavelka/anathemacs

;;; Commentary:
;;
;;

;;; Code:

;; ARCH LINUX
(use-package systemd)

;; NIXOS
;; (use-package company-nixos-options
;;   :hook (nix-mode . (set-local-company-backend company-nixos-options)))

;; (use-package nixos-options)

;; (use-package nix-mode
;;   :mode "\\.nix\\'"
;;   :general
;;   (hd-leader-def
;;     "sN" 'nix-repl))

;; WINDOW MANAGERS
;; (use-package i3wm)
(use-package fvwm-mode)

;; COMMON
(use-package logview)

(use-package symon
  :general
  (ha-leader-def
    "?s" 'symon-mode))

(ha-leader-def
  "?p" 'list-processes)

(provide 'ana-os)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ana-os.el ends here
