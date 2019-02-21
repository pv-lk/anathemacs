;;; ana-django.el ---

;; Author: e.g. pavelka <pav@egpavelka.com>
;; URL: https://github.com/egpavelka/anathemacs

;;; Commentary:
;;
;;

;;; Code:
(eval-when-compile
  (require 'ana-base))

(use-package pony-mode
  :defer t
  :init
  (setq pony-snippet-dir "~/.emacs.d/anathemacs/realms/development/django-snippets/")
  ;; Port of keybindings from spacemacs django layer
  (hm-leader-def
    :keymaps 'python-mode-map
    ; d*j*ango f*a*bric
    "jaf" 'pony-fabric
    "jad" 'pony-fabric-deploy
    ; d*j*ango *f*iles
    "jfs" 'pony-goto-settings
    "jfc" 'pony-setting
    "jft" 'pony-goto-template
    "jfr" 'pony-resolve
    ; d*j*ango *i*nteractive
    "jid" 'pony-db-shell
    "jis" 'pony-shell
    ; d*j*ango *m*anage
    ; not including one-off management commands like "flush" and
    ; "startapp" even though they're implemented in pony-mode,
    ; because this is much handier
    "jm" 'pony-manage
    ; d*j*ango *r*unserver
    "jrd" 'pony-stopserver
    "jro" 'pony-browser
    "jrr" 'pony-restart-server
    "jru" 'pony-runserver
    "jrt" 'pony-temp-server
    ; d*j*ango *s*outh/*s*yncdb
    "jsc" 'pony-south-convert
    "jsh" 'pony-south-schemamigration
    "jsi" 'pony-south-initial
    "jsm" 'pony-south-migrate
    "jss" 'pony-syncdb
    ; d*j*ango *t*est
    "jtd" 'pony-test-down
    "jte" 'pony-test-goto-err
    "jto" 'pony-test-open
    "jtt" 'pony-test
    "jtu" 'pony-test-up))

(provide 'ana-django)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ana-django.el ends here