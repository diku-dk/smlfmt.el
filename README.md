# smlfmt.el

Format SML source code using
[smlfmt](https://github.com/shwestrick/smlfmt). Requires
`reformatter.el`, on top of which this package is a very small number
of lines of code.

## Usage

With [use-package](https://github.com/jwiegley/use-package/):

```elisp
(use-package smlfmt
 :hook (sml-mode . smlfmt-format-on-save-mode)
 :bind
 (:map sml-mode-map
   ("C-c r" . smlfmt-format-buffer)))
```

* Or just `load-file` the `smlfmt.el` file.

* Or add its directory to your `load-path` and `(require 'smlfmt)`.

## Additional configuration

The package can be configured via the usual `customize-group RET
smlfmt` mechanism.
