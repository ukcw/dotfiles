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


(use-package! org-modern
  :hook (org-mode . org-modern-mode)
  :config
  (setq org-modern-star '("◉" "○" "✸" "✿" "✤" "✜" "◆" "▶")
        org-modern-table nil
        ;; org-modern-table-vertical 1
        ;; org-modern-table-horizontal 0.2
        org-modern-list '((43 . "➤")
                          (45 . "–")
                          (42 . "•"))
        org-modern-todo-faces
        '(("TODO" :inverse-video t :inherit org-todo)
          ("PROJ" :inverse-video t :inherit +org-todo-project)
          ("STRT" :inverse-video t :inherit +org-todo-active)
          ("[-]"  :inverse-video t :inherit +org-todo-active)
          ("HOLD" :inverse-video t :inherit +org-todo-onhold)
          ("WAIT" :inverse-video t :inherit +org-todo-onhold)
          ("[?]"  :inverse-video t :inherit +org-todo-onhold)
          ("KILL" :inverse-video t :inherit +org-todo-cancel)
          ("NO"   :inverse-video t :inherit +org-todo-cancel))
        org-modern-footnote
        (cons nil (cadr org-script-display))
        org-modern-block-fringe nil
        org-modern-block-name
        '((t . t)
          ("src" "»" "«")
          ("example" "»–" "–«")
          ("quote" "❝" "❞")
          ("export" "⏩" "⏪"))
        org-modern-progress nil
        org-modern-priority nil
        org-modern-horizontal-rule (make-string 36 ?─)
        org-modern-keyword
        '((t . t)
          ("title" . "𝙏")
          ("subtitle" . "𝙩")
          ("author" . "𝘼")
          ("email" . #("" 0 1 (display (raise -0.14))))
          ("date" . "𝘿")
          ("property" . "☸")
          ("options" . "⌥")
          ("startup" . "⏻")
          ("macro" . "𝓜")
          ("bind" . #("" 0 1 (display (raise -0.1))))
          ("bibliography" . "")
          ("print_bibliography" . #("" 0 1 (display (raise -0.1))))
          ("cite_export" . "⮭")
          ("print_glossary" . #("ᴬᶻ" 0 1 (display (raise -0.1))))
          ("glossary_sources" . #("" 0 1 (display (raise -0.14))))
          ("include" . "⇤")
          ("setupfile" . "⇚")
          ("html_head" . "🅷")
          ("html" . "🅗")
          ("latex_class" . "🄻")
          ("latex_class_options" . #("🄻" 1 2 (display (raise -0.14))))
          ("latex_header" . "🅻")
          ("latex_header_extra" . "🅻⁺")
          ("latex" . "🅛")
          ("beamer_theme" . "🄱")
          ("beamer_color_theme" . #("🄱" 1 2 (display (raise -0.12))))
          ("beamer_font_theme" . "🄱𝐀")
          ("beamer_header" . "🅱")
          ("beamer" . "🅑")
          ("attr_latex" . "🄛")
          ("attr_html" . "🄗")
          ("attr_org" . "⒪")
          ("call" . #("" 0 1 (display (raise -0.15))))
          ("name" . "⁍")
          ("header" . "›")
          ("caption" . "☰")
          ("results" . "🠶")))
  (custom-set-faces! '(org-modern-statistics :inherit org-checkbox-statistics-todo)))



(after! spell-fu
  (cl-pushnew 'org-modern-tag (alist-get 'org-mode +spell-excluded-faces-alist)))

(use-package! org-appear
  :hook (org-mode . org-appear-mode)
  :config
  (setq org-appear-autoemphasis t
        org-appear-autosubmarkers t
        org-appear-autolinks nil)
  ;; for proper first-time setup, `org-appear--set-elements'
  ;; needs to be run after other hooks have acted.
  (run-at-time nil nil #'org-appear--set-elements))

(use-package! ob-http
  :commands org-babel-execute:http)

(use-package! valign
  :hook (org-mode . valign-mode))

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

  (add-hook 'org-mode-hook #'+org-pretty-mode)


  ;; Define a function to set the format latex scale (to be reused in hooks)
  ;; (defun +org-format-latex-set-scale (scale)
  ;;   (setq-local org-format-latex-options
  ;;               (plist-put org-format-latex-options :scale scale)))

  ;; Set the default scale
  ;; (+org-format-latex-set-scale 1.4)

  ;; to make the package work for latex previews too append a t e.g. '("inputenc" "utf8x" t)
  ;; (add-to-list 'org-latex-packages-alist '("utf8x" "inputenc"))
  ;; (add-to-list 'org-latex-packages-alist '("" "ucs"))
  ;; (add-to-list 'org-latex-packages-alist '("" "amssymb"))

  (setq org-latex-default-packages-alist
        '(("utf8" "inputenc" t ("pdflatex"))))
  ;; ("T1" "fontenc" t ("pdflatex"))
  ;; ;; ("" "fontspec" t ("xelatex"))
  ;; ("" "graphicx" t)
  ;; ("" "grffile" t)
  ;; ;; Array, tabularx, booktabs are for tables
  ;; ("" "array" nil)
  ;; ("" "tabularx" nil)
  ;; ("" "booktabs" nil)
  ;; ("" "multirow" nil)
  ;; ("" "siunitx" nil)
  ;; ("" "wrapfig" nil)
  ;; ("" "rotating" nil)
  ;; ("normalem" "ulem" t)
  ;; ;; Math
  ;; ("" "amsmath" t)
  ;; ("" "mathtools" t)
  ;; ("" "bbm" t)
  ;; ("" "mathrsfs" t)
  ;; ("" "textcomp" t)
  ;; ("" "amssymb" t)
  ;; ("" "capt-of" nil)
  ;; ;;Microtype
  ;; ;;- pdflatex: full microtype features, fast, however no fontspec
  ;; ;;- lualatex: good microtype feature support, however slow to compile
  ;; ;;- xelatex: only protrusion support, fast compilation
  ;; ("activate={true,nocompatibility},final,tracking=true,kerning=true,spacing=true,factor=1100,stretch=10,shrink=10"
  ;;  "microtype" nil ("pdflatex"))
  ;; ("activate={true,nocompatibility},final,tracking=true,factor=1100,stretch=10,shrink=10"
  ;;  "microtype" nil ("lualatex"))
  ;; ("protrusion={true,nocompatibility},final,factor=1100,stretch=10,shrink=10"
  ;;  "microtype" nil ("xelatex"))
  ;; ("dvipsnames,svgnames" "xcolor" nil)
  ;; ("colorlinks=true, linkcolor=DarkBlue, citecolor=BrickRed, urlcolor=DarkGreen" "hyperref" nil))))

  (setq org-hide-emphasis-markers t) ;; hide emphasis markers e.g. /.../ for italics, *...* for bold
  (setq
   ;; Edit settings
   org-auto-align-tags nil
   org-tags-column 0
   org-fold-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t

   ;; Org styling, hide markup etc.
   org-hide-emphasis-markers t
   org-pretty-entities t
   org-ellipsis "…"

   ;; Agenda styling
   org-agenda-tags-column 0
   org-agenda-block-separator ?─
   org-agenda-time-grid
   '((daily today require-timed)
     (800 1000 1200 1400 1600 1800 2000)
     " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
   org-agenda-current-time-string
   "⭠ now ─────────────────────────────────────────────────")

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

  (set-face-attribute 'org-table nil  :inherit 'fixed-pitch)

  (custom-set-faces!
    '(outline-1 :weight extra-bold :height 1.25)
    '(outline-2 :weight bold :height 1.15)
    '(outline-3 :weight bold :height 1.12)
    '(outline-4 :weight semi-bold :height 1.09)
    '(outline-5 :weight semi-bold :height 1.06)
    '(outline-6 :weight semi-bold :height 1.03)
    '(outline-8 :weight semi-bold)
    '(outline-9 :weight semi-bold))

  (custom-set-faces!
    '(org-document-title :height 1.2))

  (setq org-fontify-quote-and-verse-blocks t)

  ;; (defun locally-defer-font-lock ()
  ;;   "Set jit-lock defer and stealth, when buffer is over a certain size."
  ;;   (when (> (buffer-size) 50000)
  ;;     (setq-local jit-lock-defer-time 0.05
  ;;                 jit-lock-stealth-time 1)))

  ;; (add-hook 'org-mode-hook #'locally-defer-font-lock)


  ;; (defadvice! +org-indent--reduced-text-prefixes ()
  ;;   :after #'org-indent--compute-prefixes
  ;;   (setq org-indent--text-line-prefixes
  ;;         (make-vector org-indent--deepest-level nil))
  ;;   (when (> org-indent-indentation-per-level 0)
  ;;     (dotimes (n org-indent--deepest-level)
  ;;       (aset org-indent--text-line-prefixes
  ;;             n
  ;;             (org-add-props
  ;;                 (concat (make-string (* n (1- org-indent-indentation-per-level))
  ;;                                      ?\s)
  ;;                         (if (> n 0)
  ;;                             (char-to-string org-indent-boundary-char)
  ;;                           "\u200b"))
  ;;                 nil 'face 'org-indent)))))

  ;; org-download-image-dir "images"
  ;; org-download-heading-lvl nil
  ;; org-download-timestamp "%Y%m%d-%H%M%S_"
  ;; org-image-actual-width nil))

  ;; (after! org-download
  ;;   (setq-default org-download-image-dir "images")
  ;;   (setq org-download-heading-lvl nil)
  ;;   (setq org-download-timestamp "%Y%m%d-%H%M%S_")
  ;;   (setq org-image-actual-width 600))
  (setq org-image-actual-width 600)

  (setq org-list-demote-modify-bullet '(("+" . "-") ("-" . "+") ("*" . "+") ("1." . "a.")))

  ;; (setq org-ellipsis " ▾ "
  ;;       org-hide-leading-stars t
  ;;       org-priority-highest ?A
  ;;       org-priority-lowest ?E
  ;;       org-priority-faces
  ;;       '((?A . 'all-the-icons-red)
  ;;         (?B . 'all-the-icons-orange)
  ;;         (?C . 'all-the-icons-yellow)
  ;;         (?D . 'all-the-icons-green)
  ;;         (?E . 'all-the-icons-blue)))

  ;; (appendq! +ligatures-extra-symbols
  ;;         (list :list_property "∷"
  ;;               :em_dash       "—"
  ;;               :ellipses      "…"
  ;;               :arrow_right   "→"
  ;;               :arrow_left    "←"
  ;;               :arrow_lr      "↔"
  ;;               :properties    "⚙"
  ;;               :end           "∎"
  ;;               :priority_a    #("⚑" 0 1 (face all-the-icons-red))
  ;;               :priority_b    #("⬆" 0 1 (face all-the-icons-orange))
  ;;               :priority_c    #("■" 0 1 (face all-the-icons-yellow))
  ;;               :priority_d    #("⬇" 0 1 (face all-the-icons-green))
  ;;               :priority_e    #("❓" 0 1 (face all-the-icons-blue))))

  ;; (defadvice! +org-init-appearance-h--no-ligatures-a ()
  ;;   :after #'+org-init-appearance-h
  ;;   (set-ligatures! 'org-mode nil)
  ;;   (set-ligatures! 'org-mode
  ;;                   :list_property "::"
  ;;                   :em_dash       "---"
  ;;                   :ellipsis      "..."
  ;;                   :arrow_right   "->"
  ;;                   :arrow_left    "<-"
  ;;                   :arrow_lr      "<->"
  ;;                   :properties    ":PROPERTIES:"
  ;;                   :end           ":END:"
  ;;                   :priority_a    "[#A]"
  ;;                   :priority_b    "[#B]"
  ;;                   :priority_c    "[#C]"
  ;;                   :priority_d    "[#D]"
  ;;                   :priority_e    "[#E]"))

  (setq org-highlight-latex-and-related '(native script entities))

  (require 'org-src)
  (add-to-list 'org-src-block-faces '("latex" (:inherit default :extend t)))

  ;; (add-hook 'org-mode-hook #'org-latex-preview-auto-mode)


  ;; (defun +org-refresh-latex-images-previews-h ()
  ;;   (dolist (buffer (doom-buffers-in-mode 'org-mode (buffer-list)))
  ;;     (with-current-buffer buffer
  ;;       (+org--toggle-inline-images-in-subtree (point-min) (point-max) 'refresh)
  ;;       (unless (eq org-latex-preview-default-process 'dvisvgm)
  ;;         (org-clear-latex-preview (point-min) (point-max))
  ;;         (org--latex-preview-region (point-min) (point-max))))))

  ;; (add-hook 'doom-load-theme-hook #'+org-refresh-latex-images-previews-h)
  (plist-put org-format-latex-options :background "Transparent")

  (add-hook 'org-mode-hook 'variable-pitch-mode)
  (add-hook 'org-mode-hook 'visual-line-mode)
  (add-hook 'org-mode-hook (lambda () (display-line-numbers-mode 0)))
  (add-hook 'org-src-mode-hook #'display-line-numbers-mode)

  ;; exports
  (setq org-export-with-tags nil) ;; export without tags

  )

;; (after! org-download
;;   (setq org-download-method 'directory))

;; (setq org-download-link-format "[[file:%s]]\n"
;;       org-download-abbreviate-filename-function #'file-relative-name)
;; (setq org-download-link-format-function #'org-download-link-format-function-default))
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
