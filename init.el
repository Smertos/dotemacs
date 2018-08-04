;;; init.el --- init.org bootstrapper

;;; Commentary:
;; This is bootstrapper of my org config

;;; Code:
(require 'package)

;; Setup package repos
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")))

;; Ignore the warnings for emacs >= 27.0
;; Because this line is required regardless of the version
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (message "Installing use-package")
  (package-refresh-contents)
  (package-install 'use-package))

(unless (package-installed-p 'use-package)
  (error "Couldn't install use-package!"))

(eval-when-compile (require 'use-package))

;; Path to config.org
(defconst config-path "~/.emacs.d/config.org")

;; Load the config itself
(when (file-readable-p config-path)
  (org-babel-load-file (expand-file-name config-path)))

;;; init.el ends here
