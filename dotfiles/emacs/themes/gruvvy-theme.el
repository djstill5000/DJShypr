;;; gruvvy-theme.el --- Gruvvy: color theme inspired by the woods

;; Author: Bozidar Dautovic
;; URL: http://github.com/daut/gruvvy-theme.el

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; Gruvvy: color theme inspired by the woods.
;; This is mostly a port of the NeoVim Gruvvy theme.

;;; Code:

(deftheme gruvvy
  "Gruvvy: color theme inspired by the woods."
  :background-mode 'dark
  :kind 'color-scheme)

(let ((class '((class color) (min-colors 89)))
      ;; Palette
      (gruvvy-light-charcoal "#222222")
      (gruvvy-charcoal "#1c1c1c")
      (gruvvy-onyx "#101010")
      (gruvvy-obsidian "#151515")
      (gruvvy-graphite "#444444")
      (gruvvy-dark-gray "#666666")
      (gruvvy-light-gray "#c2c2b0")
      (gruvvy-marble "#eaeaea")
      (gruvvy-river "#1f3a5f")
      (gruvvy-sky "#87CEEB")
      (gruvvy-forest "#242d1d")
      (gruvvy-moss "#2f361f")
      (gruvvy-olive "#43492a")
      (gruvvy-eucalyptus "#5f875f")
      (gruvvy-reseda "#78834b")
      (gruvvy-walnut "#685742")
      (gruvvy-tangerine "#fd9720")
      (gruvvy-copper "#bb7744")
      (gruvvy-cedar "#b36d43")
      (gruvvy-terracota "#c86448")
      (gruvvy-fire "#661010")
      (gruvvy-lemon "#fbec9f")
      (gruvvy-ecru "#d7c483")
      (gruvvy-brass "#c9a554"))

  (custom-theme-set-faces
   'gruvvy
   ;;;; Built-in packages
   ;;;;; Basic
   `(cursor ((,class (:background ,gruvvy-reseda))))
   `(error ((,class (:foreground ,gruvvy-terracota))))
   `(fringe ((,class (:background ,gruvvy-light-charcoal))))
   `(highlight ((,class (:background ,gruvvy-olive))))
   `(link ((,class (:foreground ,gruvvy-brass :underline t :weight bold))))
   `(link-visited ((,class (:foreground ,gruvvy-walnut :underline t :weight normal))))
   `(match ((,class (:background ,gruvvy-river))))
   `(region ((,class (:background ,gruvvy-moss))))
   `(secondary-selection ((,class (:background ,gruvvy-olive))))
   `(shadow ((,class (:foreground ,gruvvy-dark-gray))))
   `(success ((,class (:foreground ,gruvvy-eucalyptus))))
   `(trailing-whitespace ((,class (:background ,gruvvy-fire))))
   `(warning ((,class (:foreground ,gruvvy-tangerine))))
   `(default ((,class (:foreground ,gruvvy-light-gray :background ,gruvvy-light-charcoal))))

   ;;;;; completions
   `(completions-annotations ((,class (:foreground ,gruvvy-reseda))))
   `(completions-common-part ((,class (:foreground ,gruvvy-eucalyptus))))

   ;;;;; dired
   `(dired-directory ((,class (:foreground ,gruvvy-eucalyptus))))
   `(dired-symlink ((,class (:foreground ,gruvvy-lemon))))

   ;;;;; flyspell
   `(flyspell-duplicate ((,class :underline (:style wave :color ,gruvvy-tangerine))))
   `(flyspell-incorrect ((,class :underline (:style wave :color ,gruvvy-terracota))))

   ;;;;; font lock
   `(font-lock-comment-face ((,class (:foreground ,gruvvy-dark-gray))))
   `(font-lock-constant-face ((,class (:foreground ,gruvvy-copper))))
   `(font-lock-function-name-face ((,class (:foreground ,gruvvy-reseda))))
   `(font-lock-keyword-face ((,class (:foreground ,gruvvy-eucalyptus))))
   `(font-lock-preprocessor-face ((,class (:foreground ,gruvvy-cedar))))
   `(font-lock-string-face ((,class (:foreground ,gruvvy-walnut :weight bold))))
   `(font-lock-type-face ((,class (:foreground ,gruvvy-brass))))
   `(font-lock-variable-name-face ((,class (:foreground ,gruvvy-lemon))))
   `(font-lock-variable-use-face ((,class (:foreground ,gruvvy-lemon))))
   `(font-lock-warning-face ((,class (:foreground ,gruvvy-tangerine))))
   `(font-lock-builtin-face ((,class (:foreground ,gruvvy-light-gray))))

   ;;;;; isearch
   `(isearch ((,class (:foreground ,gruvvy-light-charcoal :background ,gruvvy-tangerine))))
   `(isearch-group-1 ((,class (:foreground ,gruvvy-light-charcoal :background ,gruvvy-ecru))))
   `(isearch-group-2 ((,class (:foreground ,gruvvy-light-charcoal :background ,gruvvy-brass))))
   `(isearch-fail ((,class (:background ,gruvvy-fire))))

   ;;;;; message
   `(message-cited-text ((,class (:foreground ,gruvvy-dark-gray))))
   `(message-header-cc ((,class (:foreground ,gruvvy-reseda))))
   `(message-header-other ((,class (:foreground ,gruvvy-light-gray))))
   `(message-header-subject ((,class (:foreground ,gruvvy-lemon))))
   `(message-header-to ((,class (:foreground ,gruvvy-lemon))))
   `(message-separator ((,class (:foreground ,gruvvy-dark-gray))))
   `(message-header-name ((,class (:foreground ,gruvvy-reseda))))

   ;;;;; minibuffer
   `(minibuffer-prompt ((,class (:foreground ,gruvvy-ecru))))

   ;;;;; mode line
   `(mode-line ((,class (:background ,gruvvy-forest))))
   `(mode-line-inactive ((,class (:foreground ,gruvvy-light-gray :background ,gruvvy-graphite))))

   ;;;;; org
   `(org-done ((,class (:foreground ,gruvvy-olive :weight bold))))
   `(org-headline-done ((,class (:foreground ,gruvvy-dark-gray :weight bold))))
   `(org-headline-todo ((,class (:foreground ,gruvvy-eucalyptus :weight bold))))
   `(org-todo ((,class (:foreground ,gruvvy-brass :weight bold))))
   `(org-date ((,class (:foreground ,gruvvy-sky :underline (:style line)))))
   `(org-document-title ((,class (:foreground ,gruvvy-copper))))
   `(org-block ((,class (:background ,gruvvy-obsidian :extend t :inherit fixed-pitch))))
   `(org-block-begin-line ((,class (:foreground ,gruvvy-dark-gray :background ,gruvvy-obsidian :extend t :italic t))))
   `(org-block-end-line ((,class (:inherit org-block-begin-line))))


    `(org-level-1 ((t (:foreground ,(gruvvy-forest) :weight bold :height 1.2))))
    `(org-level-2 ((t (:foreground ,(gruvvy-eucalyptus) :weight bold :height 1.15))))
    `(org-level-3 ((t (:foreground ,(gruvvy-olive) :weight semi-bold :height 1.1))))
    `(org-level-4 ((t (:foreground ,(gruvvy-reseda) :weight normal :height 1.05))))
    `(org-level-5 ((t (:foreground ,(gruvvy-copper) :weight normal))))
    `(org-level-6 ((t (:foreground ,(gruvvy-cedar)))))
    `(org-level-7 ((t (:foreground ,(gruvvy-walnut)))))
    `(org-level-8 ((t (:foreground ,(gruvvy-graphite)))))


   ;;;;; line numbers
   `(line-number ((,class (:inherit default :foreground ,gruvvy-dark-gray))))
   `(line-number-current-line ((,class (:background ,gruvvy-charcoal :inherit default))))

   ;;;; Third-party packages

   ;;;;; ace-window
   `(aw-leading-char-face ((,class :foreground ,gruvvy-terracota :height 1.5 :weight bold)))
   `(aw-minibuffer-leading-char-face ((,class :foreground ,gruvvy-terracota)))

   ;;;;; avy
   `(avy-goto-char-timer-face ((,class :background ,gruvvy-olive :weight bold)))
   `(avy-lead-face-0 ((,class :foreground ,gruvvy-light-gray :background ,gruvvy-river :weight bold)))
   `(avy-lead-face-1 ((,class :foreground ,gruvvy-light-gray :background ,gruvvy-dark-gray :weight bold)))
   `(avy-lead-face-2 ((,class :background ,gruvvy-lemon :weight bold)))
   `(avy-lead-face ((,class :foreground ,gruvvy-light-gray :background ,gruvvy-terracota :weight bold)))

   ;;;;; company
   `(company-echo-common ((,class (:inherit company-tooltip-common))))
   `(company-tooltip-annotation ((,class (:foreground ,gruvvy-copper))))
   `(company-tooltip-common ((,class (:foreground ,gruvvy-eucalyptus))))
   `(company-tooltip-quick-access ((,class (:foreground ,gruvvy-lemon))))
   `(company-tooltip-scrollbar-thumb ((,class (:background ,gruvvy-moss))))
   `(company-tooltip-selection ((,class (:background ,gruvvy-olive))))
   `(company-tooltip ((,class (:foreground ,gruvvy-light-gray :background ,gruvvy-obsidian :extend t))))

   ;;;;; copilot-mode
   `(copilot-overlay-face ((,class (:foreground ,gruvvy-graphite))))

   ;;;;; diredfl
   `(diredfl-compressed-file-name ((,class :foreground ,gruvvy-lemon)))
   `(diredfl-compressed-file-suffix ((,class :foreground ,gruvvy-cedar)))
   `(diredfl-date-time ((,class (:foreground ,gruvvy-brass))))
   `(diredfl-deletion ((,class :foreground ,gruvvy-terracota)))
   `(diredfl-deletion-file-name ((,class :foreground ,gruvvy-terracota)))
   `(diredfl-dir-heading ((,class (:foreground ,gruvvy-light-gray))))
   `(diredfl-dir-name ((,class (:inherit dired-directory))))
   `(diredfl-dir-priv ((,class (:foreground ,gruvvy-walnut))))
   `(diredfl-exec-priv ((,class (:foreground ,gruvvy-tangerine))))
   `(diredfl-file-name ((,class (:foreground ,gruvvy-light-gray))))
   `(diredfl-file-suffix ((,class (:foreground ,gruvvy-reseda))))
   `(diredfl-flag-mark ((,class (:foreground ,gruvvy-tangerine))))
   `(diredfl-flag-mark-line ((,class (:foreground ,gruvvy-tangerine))))
   `(diredfl-no-priv ((,class (:foreground ,gruvvy-olive))))
   `(diredfl-number ((,class (:foreground ,gruvvy-reseda))))
   `(diredfl-read-priv ((,class (:foreground ,gruvvy-eucalyptus))))
   `(diredfl-symlink ((,class (:inherit dired-symlink))))
   `(diredfl-write-priv ((,class (:foreground ,gruvvy-cedar))))

   ;;;;; doom-modeline
   `(doom-modeline-bar ((,class (:background ,gruvvy-eucalyptus))))
   `(doom-modeline-buffer-path ((,class (:foreground ,gruvvy-eucalyptus))))
   `(doom-modeline-buffer-modified ((,class (:foreground ,gruvvy-lemon))))
   `(doom-modeline-project-dir ((,class (:foreground ,gruvvy-eucalyptus))))

   ;;;;; elfeed
   `(elfeed-log-debug-level-face ((,class (:foreground ,gruvvy-sky))))
   `(elfeed-log-error-level-face ((,class (:foreground ,gruvvy-terracota))))
   `(elfeed-log-info-level-face ((,class (:foreground ,gruvvy-eucalyptus))))
   `(elfeed-log-warn-level-face ((,class (:foreground ,gruvvy-tangerine))))
   `(elfeed-search-feed-face ((,class (:foreground ,gruvvy-brass))))
   `(elfeed-search-filter-face ((,class (:foreground ,gruvvy-light-gray))))
   `(elfeed-search-last-update-face ((,class (:foreground ,gruvvy-eucalyptus))))
   `(elfeed-search-tag-face ((,class (:foreground ,gruvvy-lemon))))
   `(elfeed-search-title-face ((,class (:foreground ,gruvvy-dark-gray))))
   `(elfeed-search-unread-count-face ((,class (:foreground ,gruvvy-light-gray))))
   `(elfeed-search-unread-title-face ((,class (:foreground ,gruvvy-light-gray))))
   `(elfeed-search-date-face ((,class (:foreground ,gruvvy-eucalyptus))))

   ;;;;; flycheck
   `(flycheck-info ((,class (:underline (:style wave :color ,gruvvy-eucalyptus)))))
   `(flycheck-error ((,class (:underline (:style wave :color ,gruvvy-terracota)))))
   `(flycheck-warning ((,class (:underline (:style wave :color ,gruvvy-tangerine)))))

   ;;;;; git-gutter
   `(git-gutter:added ((,class (:foreground ,gruvvy-eucalyptus :weight bold))))
   `(git-gutter:deleted ((,class (:foreground ,gruvvy-terracota :weight bold))))
   `(git-gutter:modified ((,class (:foreground ,gruvvy-ecru :weight bold))))

   ;;;;; hl-line
   `(hl-line ((,class (:background ,gruvvy-charcoal))))

   ;;;;; lsp
   `(lsp-modeline-code-actions-face ((,class (:foreground ,gruvvy-olive))))

   ;;;;; magit
   `(magit-bisect-bad ((,class (:foreground ,gruvvy-fire))))
   `(magit-bisect-good ((,class (:foreground ,gruvvy-olive))))
   `(magit-bisect-skip ((,class (:foreground ,gruvvy-brass))))
   `(magit-bisect-skip ((,class (:foreground ,gruvvy-brass))))
   `(magit-blame-highlight ((,class (:foreground ,gruvvy-marble :background ,gruvvy-dark-gray :extend t))))
   `(magit-branch-local ((,class (:foreground ,gruvvy-copper))))
   `(magit-branch-local ((,class (:foreground ,gruvvy-copper))))
   `(magit-branch-local ((,class (:foreground ,gruvvy-copper))))
   `(magit-branch-remote ((,class (:foreground ,gruvvy-reseda))))
   `(magit-cherry-equivalent ((,class (:foreground ,gruvvy-terracota))))
   `(magit-cherry-equivalent ((,class (:foreground ,gruvvy-terracota))))
   `(magit-cherry-unmatched ((,class (:foreground ,gruvvy-sky))))
   `(magit-diff-base ((,class (:foreground ,gruvvy-lemon :background ,gruvvy-walnut :extend t))))
   `(magit-diff-base-highlight ((,class (:foreground ,gruvvy-lemon :background ,gruvvy-olive))))
   `(magit-diff-context ((,class (:foreground ,gruvvy-dark-gray :extend t))))
   `(magit-diff-context-highlight ((,class (:foreground ,gruvvy-light-gray :background ,gruvvy-light-charcoal))))
   `(magit-diff-file-heading ((,class (:foreground ,gruvvy-reseda))))
   `(magit-diff-hunk-heading ((,class (:foreground ,gruvvy-light-gray :background ,gruvvy-graphite))))
   `(magit-diff-hunk-heading-highlight ((,class (:foreground ,gruvvy-light-gray :background ,gruvvy-graphite :extend t))))
   `(magit-diff-hunk-heading-selection ((,class (:foreground ,gruvvy-cedar :extend t :inherit magit-diff-heading-highlight))))
   `(magit-diff-lines-heading ((,class (:foreground ,gruvvy-light-gray :background ,gruvvy-copper))))
   `(magit-diffstat-added ((,class (:foreground ,gruvvy-olive))))
   `(magit-diffstat-removed ((,class (:foreground ,gruvvy-fire))))
   `(magit-dimmed ((,class (:foreground ,gruvvy-graphite))))
   `(magit-hash ((,class (:foreground ,gruvvy-olive))))
   `(magit-log-author ((,class (:foreground ,gruvvy-terracota))))
   `(magit-log-author ((,class (:foreground ,gruvvy-terracota))))
   `(magit-log-date ((,class (:foreground ,gruvvy-light-gray))))
   `(magit-log-graph ((,class (:foreground ,gruvvy-light-gray))))
   `(magit-process-ng ((,class (:foreground ,gruvvy-fire))))
   `(magit-process-ok ((,class (:foreground ,gruvvy-eucalyptus))))
   `(magit-reflog-amend ((,class (:foreground ,gruvvy-tangerine))))
   `(magit-reflog-checkout ((,class (:foreground ,gruvvy-river))))
   `(magit-reflog-checkout ((,class (:foreground ,gruvvy-river))))
   `(magit-reflog-commit ((,class (:foreground ,gruvvy-eucalyptus))))
   `(magit-reflog-merge ((,class (:foreground ,gruvvy-reseda))))
   `(magit-reflog-rebase ((,class (:foreground ,gruvvy-terracota))))
   `(magit-reflog-remote ((,class (:foreground ,gruvvy-sky))))
   `(magit-reflog-reset ((,class (:foreground ,gruvvy-fire))))
   `(magit-reflog-reset ((,class (:foreground ,gruvvy-fire))))
   `(magit-refname ((,class (:foreground ,gruvvy-light-gray))))
   `(magit-section-heading ((,class (:foreground ,gruvvy-lemon :weight bold :extend t))))
   `(magit-section-heading-selection ((,class (:foreground ,gruvvy-cedar :extend t :inherit magit-diff-file-heading-highlight))))
   `(magit-section-heading-selection ((,class (:foreground ,gruvvy-cedar :extend t))))
   `(magit-section-highlight ((,class (:background ,gruvvy-light-charcoal))))
   `(magit-sequence-drop ((,class (:foreground ,gruvvy-fire))))
   `(magit-sequence-head ((,class (:foreground ,gruvvy-sky))))
   `(magit-sequence-part ((,class (:foreground ,gruvvy-lemon))))
   `(magit-sequence-part ((,class (:foreground ,gruvvy-lemon))))
   `(magit-sequence-stop ((,class (:foreground ,gruvvy-reseda))))
   `(magit-signature-error ((,class (:foreground ,gruvvy-sky))))
   `(magit-signature-expired ((,class (:background ,gruvvy-tangerine))))
   `(magit-signature-revoked ((,class (:background ,gruvvy-terracota))))
   `(magit-signature-untrusted ((,class (:foreground ,gruvvy-reseda))))
   `(magit-tag ((,class (:foreground ,gruvvy-lemon))))

   ;;;;; org-modern
   `(org-modern-done ((,class (:foreground ,gruvvy-olive :background ,gruvvy-light-gray :inverse-video t :inherit (org-done org-modern-label)))))
   `(org-modern-tag ((,class (:foreground ,gruvvy-light-gray :inherit (secondary-selection org-modern-label)))))

   ;;;;; orderless
   `(orderless-match-face-0 ((,class :inherit bold :foreground ,gruvvy-tangerine)))
   `(orderless-match-face-1 ((,class :inherit bold :foreground ,gruvvy-lemon)))
   `(orderless-match-face-2 ((,class :inherit bold :foreground ,gruvvy-eucalyptus)))
   `(orderless-match-face-3 ((,class :inherit bold :foreground ,gruvvy-cedar)))

   ;;;;; persp-mode
   `(persp-selected-face ((,class (:foreground ,gruvvy-lemon))))

   ;;;;; rainbow-delimiters
   `(rainbow-delimiters-base-face ((,class (:foreground ,gruvvy-reseda :weight bold))))
   `(rainbow-delimiters-depth-1-face ((,class (:foreground ,gruvvy-brass :weight bold))))
   `(rainbow-delimiters-depth-2-face ((,class (:foreground ,gruvvy-copper :weight bold))))
   `(rainbow-delimiters-depth-3-face ((,class (:foreground ,gruvvy-lemon :weight bold))))
   `(rainbow-delimiters-depth-4-face ((,class (:foreground ,gruvvy-eucalyptus :weight bold))))
   `(rainbow-delimiters-depth-5-face ((,class (:foreground ,gruvvy-cedar :weight bold))))
   `(rainbow-delimiters-depth-6-face ((,class (:foreground ,gruvvy-walnut :weight bold))))
   `(rainbow-delimiters-depth-7-face ((,class (:foreground ,gruvvy-reseda :weight bold))))
   `(rainbow-delimiters-depth-8-face ((,class (:foreground ,gruvvy-tangerine :weight bold))))
   `(rainbow-delimiters-depth-9-face ((,class (:foreground ,gruvvy-dark-gray :weight bold))))
   `(rainbow-delimiters-depth-10-face ((,class (:foreground ,gruvvy-ecru :weight bold))))
   `(rainbow-delimiters-depth-11-face ((,class (:foreground ,gruvvy-olive :weight bold))))
   `(rainbow-delimiters-depth-12-face ((,class (:foreground ,gruvvy-obsidian :weight bold))))

   ;;;;; solaire
   `(solaire-default-face ((,class (:background ,gruvvy-charcoal))))
   `(solaire-hl-line-face ((,class (:background ,gruvvy-obsidian))))

   ;;;;; show-paren
   `(show-paren-match ((,class (:background ,gruvvy-moss :weight bold))))

   ;;;;; transient
   `(transient-inactive-value ((,class :foreground ,gruvvy-graphite)))
   `(transient-key-exit ((,class :foreground ,gruvvy-cedar)))
   `(transient-key-stay ((,class :foreground ,gruvvy-ecru)))

   ;;;;; vertico
   `(vertico-posframe-border ((,class (:background ,gruvvy-walnut))))
   `(vertico-posframe-border-2 ((,class (:background ,gruvvy-tangerine))))
   `(vertico-posframe-border-3 ((,class (:background ,gruvvy-cedar))))
   `(vertico-posframe-border-4 ((,class (:background ,gruvvy-ecru))))

   ;;;;; web-mode
   `(web-mode-html-attr-engine-face ((,class (:foreground ,gruvvy-reseda))))
   `(web-mode-html-attr-name-face ((,class (:foreground ,gruvvy-reseda))))
   `(web-mode-html-tag-bracket-face ((,class (:foreground ,gruvvy-eucalyptus))))
   `(web-mode-html-tag-face ((,class (:foreground ,gruvvy-eucalyptus))))
   ))

;;; Footer

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'gruvvy)

;; Local Variables:
;; no-byte-compile: t
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; gruvvy-theme.el ends here
