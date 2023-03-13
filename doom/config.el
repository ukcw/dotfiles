;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Ulysses Kee"
      user-mail-address "ulysseskcw96@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))

(setq doom-font (font-spec :family "Fira Code Retina" :size 12)
      doom-variable-pitch-font (font-spec :family "ETBembo" :size 16))
;; doom-variable-pitch-font (font-spec :family "Alegreya" :size 18))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿")) ;; personal


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(use-package! lsp-tailwindcss
  :init
  (setq lsp-tailwindcss-add-on-mode t))

;; https://ruivieira.dev/doom-emacs.html
;; org setup
(after! org
  ;; disable auto-complete in org-mode buffers
  ;; (remove-hook 'org-mode-hook #'auto-fill-mode)
  ;; disable company too
  (setq company-global-modes '(not org-mode))
  ;; ...

  ;; ORG LATEX PREVIEW
  (setq org-startup-with-latex-preview t
        ;; Make latex preview with "C-c C-x C-l" slightly bigger
        ;; org-format-latex-options
        ;; (plist-put org-format-latex-options :scale 1.5)
        ;; Cache the preview images elsewhere
        org-preview-latex-image-directory "~/.cache/ltximg/")

  ;; (if (string-match-p "RSVG" system-configuration-features)
  (setq org-preview-latex-default-process 'dvisvgm)
  ;; (setq org-latex-preview-default-process 'dvipng))

  (setq org-highlight-latex-and-related '(native script entities))

  (require 'org-src)
  (add-to-list 'org-src-block-faces '("latex" (:inherit default :extend t)))

  (setq org-format-latex-options
        (plist-put org-format-latex-options :background "Transparent"))

  ;; Define a function to set the format latex scale (to be reused in hooks)
  (defun +org-format-latex-set-scale (scale)
    (setq-local org-format-latex-options
                (plist-put org-format-latex-options :scale scale)))

  ;; Set the default scale
  (+org-format-latex-set-scale 1.4)


  (setq org-hide-emphasis-markers t) ;; hide emphasis markers e.g. /.../ for italics, *...* for bold

  ;; (let* ((variable-tuple
  ;;         (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
  ;;               ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
  ;;               ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
  ;;               ((x-list-fonts "Verdana")         '(:font "Verdana"))
  ;;               ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
  ;;               (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
  ;;        (base-font-color     (face-foreground 'default nil 'default))
  ;;        (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  ;;   (custom-theme-set-faces
  ;;    'user
  ;;    `(org-level-8 ((t (,@headline ,@variable-tuple))))
  ;;    `(org-level-7 ((t (,@headline ,@variable-tuple))))
  ;;    `(org-level-6 ((t (,@headline ,@variable-tuple))))
  ;;    `(org-level-5 ((t (,@headline ,@variable-tuple))))
  ;;    `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
  ;;    `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
  ;;    `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
  ;;    `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
  ;;    `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

  (custom-theme-set-faces
   'user
   '(variable-pitch ((t (:family "ETBembo" :height 180 :weight thin))))
   '(fixed-pitch ((t ( :family "Fira Code Retina" :height 160)))))

  (custom-theme-set-faces
   'user
   '(org-block ((t (:inherit fixed-pitch))))
   '(org-code ((t (:inherit (shadow fixed-pitch)))))
   '(org-document-info ((t (:foreground "dark orange"))))
   '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
   '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
   '(org-link ((t (:foreground "royal blue" :underline t))))
   '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-property-value ((t (:inherit fixed-pitch))) t)
   '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
   '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
   '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

  (setq org-download-image-dir "images")
  (setq org-download-heading-lvl nil)
  (setq org-download-timestamp "%Y%m%d-%H%M%S_")
  (setq org-image-actual-width nil)

  (after! org-download
    (setq org-download-method 'directory))
  ;; org-download-image-dir "images"
  ;; org-download-heading-lvl nil
  ;; org-download-timestamp "%Y%m%d-%H%M%S_"
  ;; org-image-actual-width nil))

  (add-hook 'org-mode-hook 'variable-pitch-mode)
  (add-hook 'org-mode-hook 'visual-line-mode)
  (add-hook 'org-mode-hook (lambda () (display-line-numbers-mode 0)))
  (add-hook 'org-src-mode-hook #'display-line-numbers-mode)
  )

;; treemacs
(use-package treemacs-projectile
  :after (treemacs projectile))

;; when moving from one project to another, make treemacs reflect that
(after! (treemacs projectile)
  (treemacs-project-follow-mode 1))

(setq doom-themes-treemacs-theme "doom-colors") ;; personal
(setq doom-themes-treemacs-enable-variable-pitch nil) ;; personal

;; python
(use-package! python-black
  :after python
  :hook (python-mode . python-black-on-save-mode-enable-dwim))
