;;; ana-capture.el ---

;; Author: e.g. pavelka <pav@egpavelka.com>
;; URL: https://github.com/egpavelka/anathemacs

;;; Commentary:
;;
;;

;;; Code:

;; SETUP
(hs-leader-def
  "C" 'org-capture)

;; (add-hook 'org-capture-prepare-finalize-hook 'org-id-get-create)

;; properties
;; (setq org-tempo-keywords-alist '())

;; PACKAGES
(use-package org-chef
  :defer t)

;; (defun org-journal-find-location ()
;;   (org-journal-new-entry t)
;;   (goto-char (point-min)))
(defun org-journal-find-location ()
  (concat org-journal-dir org-journal-file-format))

;; TEMPLATES
(setq org-capture-templates
      '((
      ;;---BASIC CAPTURES
      ;;;; TODO
         "t" "tarea" entry
         (file+headline user-master-file "braindump")
         "** TODO %^{tarea} %?
%T")
        
      ;;;; APPOINTMENT
        ("c" "cita" entry
         (file+olp+datetree user-cal-file)
         "** APPOINTMENT %^{cita} %? :cita:
:PROPERTIES:
:LOCATION:
:END:
%T"
         :tree-type month
         :time-prompt t)

      ;;;; EVENT
        ("e" "evento" entry
         (function org-journal-find-location)
         "** EVENT %^{evento} %? :evento:
%t"
         :tree-type month
         :time-prompt t)

      ;;;; NOTE
        ("n" "nota" entry
         (file+headline user-master-file "braindump")
         "** %^{nota} %?
%T")
        
      ;;;; LINK
        ("l" "enlace" entry
         ((file+headline user-master-file "braindump"))
         "** %(org-cliplink-capture) :recurso:
%T")
        
      ;;---THIRD-PARTY PACKAGE CAPTURES
      ;;;; ORG-BRAIN
        ("C" "cerebro" plain
         (function org-brain-goto-end)
         "* %i%?")
        
      ;;;; ORG-CHEF
        ("r" "receta" entry
         (file user-cookbook-file)
         "%(org-chef-get-recipe-from-url)")
        ("R" "receta [manual]" entry
         (file user-cookbook-file)
         "* %^{Recipe title: }
:PROPERTIES:
:source-url:
:servings:
:prep-time:
:cook-time:
:ready-in:
:END:
** Ingredients
%?
** Directions")

      ;;;; ORG-JOURNAL
        ("j" "journal entry" entry (file+olp+datetree (concat org-journal-dir org-journal-file-format))
                               "* %H:%M :diario:
:PROPERTIES:
:word_count:
:END:
%T
%?"
         :tree-type month)

      ;;;; ORG-CAPTURE EXTENSION
        ("p" "protocol" entry
         (file+headline user-master-file "braindump")
        "* %^{Title} :recurso:
:PROPERTIES
:fuenta: %u, %c
:END:
%T
#+BEGIN_QUOTE
%i
#+END_QUOTE
%?")
	("L" "protocol link" entry
         (file+headline user-master-file "braindump")
        "* %? [[%:link][%:description]] :recurso:
%T")
        ))
(provide 'ana-capture)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ana-capture.el ends here
