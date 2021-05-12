;;; ana-org-ui-base.el ---

;; Author: e.g. pavelka <pav@egpavelka.com>
;; URL: https://github.com/egpavelka/anathemacs

;;; Commentary:
;;
;;

;;; Code:
(load-file (concat user-emacs-directory "anathemacs-theme-colors.el"))

;; (defface org-at-tag
;;   '((nil :inherit org-tag :foreground ana-yellow-1 ))
;;   "org at tag face")

;; (defface org-hashtag
;;   '((nil :inherit org-tag :foreground ana-magenta-1 ))
;;   "org hashtag face")

;; (font-lock-add-keywords
;;  'org-mode
;;  '((":\\(@[^\:]+\\):" (1 'org-tag-face))))

;; (add-to-list 'org-tag-faces '("@.*" . (:foreground ana-yellow-1)))

;; (defun org-get-tag-face (kwd)
;;   "Get the right face for a TODO keyword KWD.
;; If KWD is a number, get the corresponding match group."
;;   (if (numberp kwd) (setq kwd (match-string kwd)))
;;   (let ((special-tag-face (or (cdr (assoc kwd org-tag-faces))
;;                               (and (string-match "^@.*" kwd)
;;                                    (cdr (assoc "@.*" org-tag-faces))))))
;;     (or (org-face-from-face-or-color 'tag 'org-tag special-tag-face)
;;         'org-tag)))

(add-hook 'org-mode-hook 'variable-pitch-mode)

(with-eval-after-load 'org
  (setq ; org-adapt-indentation nil
        org-agenda-block-separator ""
        org-allow-promoting-top-level-subtree t
        org-blank-before-new-entry '((heading . nil)
                                     (plain-list-item . nil))
        org-cycle-level-faces nil
        org-cycle-separator-lines 1
        ;; org-ellipsis " ⬎"
        org-ellipsis " ⇢"
        org-fontify-whole-heading-line t
        org-fontify-done-headline nil
        org-fontify-quote-and-verse-blocks t
        org-footnote-auto-adjust t
        org-footnote-define-inline t
        org-hide-emphasis-markers t
        org-hide-leading-stars t
        org-indent-indentation-per-level 1
        org-list-indent-offset 1
        org-pretty-entities t
        org-startup-align-all-tables t
        org-startup-indented t
        org-startup-with-inline-images t
        org-tags-column 0))

(use-package olivetti
  :delight olivetti-mode
  :hook ((text-mode nov-mode org-mode) . olivetti-mode)
  :init
  (setq olivetti-body-width 0.85))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :config
    (setq org-bullets-bullet-list '("⋅")))

;; (use-package mixed-pitch
;;   :hook (text-mode . mixed-pitch-mode))

(provide 'ana-org-ui-base)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ana-org-ui-base.el ends here
