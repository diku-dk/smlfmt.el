;;; smlfmt.el --- Format SML source code using the "smlfmt" program -*- lexical-binding: t -*-

;; Author: Troels Henriksen <athas@sigkill>
;; Version: 0.1.0
;; Keywords: files, tools
;; Package-Requires: ((emacs "24") (reformatter "0.4"))

;; This file is NOT part of GNU Emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Provides a minor mode and commands for easily using the "smlfmt"
;; program to reformat SML code.
;;
;; Inspired by the ormolu mode by Vasiliy Yorkin.

;;; Code:

(require 'reformatter)

(defgroup smlfmt nil
  "Integration with the \"smlfmt\" formatting program."
  :prefix "smlfmt-"
  :group 'sml)

(defcustom smlfmt-process-path "smlfmt"
  "Location where the smlfmt executable is located."
  :group 'smlfmt
  :type 'string
  :safe #'stringp)

(defcustom smlfmt-extra-args '()
  "Extra arguments to give to smlfmt."
  :group 'smlfmt
  :type 'sexp
  :safe #'listp)

(defvar smlfmt-mode-map (make-sparse-keymap)
  "Local keymap used for `smlfmt-format-on-save-mode`.")

;;;###autoload (autoload 'smlfmt-format-buffer "smlfmt" nil t)
;;;###autoload (autoload 'smlfmt-format-region "smlfmt" nil t)
;;;###autoload (autoload 'smlfmt-format-on-save-mode "smlfmt" nil t)
(reformatter-define smlfmt-format
  :program smlfmt-process-path
  :args smlfmt-extra-args
  :group 'smlfmt
  :lighter " Or"
  :keymap smlfmt-mode-map)

(defalias 'smlfmt 'smlfmt-format-buffer)

(provide 'smlfmt)

;;; smlfmt.el ends here
