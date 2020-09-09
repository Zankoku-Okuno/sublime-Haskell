# Haskell Syntax for Sublime Text 3

The built-in Haskell syntax is a bit broken, especially when it comes to more recent extensions (but even some stuff from Haskell1998 isn't done right!).

## Fixes

  * numerous names are allowed numbers
  * variable names are allowed to start with underscore in numerous contexts
  * infix operators are allowed `?` and `@` characters
  * distinguish between module names and constructor names
  * constructor import lists
  * multiple type declarations in a row
  * qualified names in backtick-infix syntax
  * multi-line strings and detect unterminated strings
  * pragma names only occur at start of pragma and are case-insensitive
  * detect haddock comments and sections (line-based only, so far),
    and flag common invalid doc-comments
  * `deriving` a single class without parenthesis
  * support for DerivingStrategies and DerivingVia
  * binary literals
  * support for `forall` in type signatures
  * qualified names in quasi-quoters

More controversially(?) I've removed a bunch of Haskell "builtin" highlighting.
The Haskell sub-communities have very different ideas about what classes are and are not commonly-used.
Besides, I quite like that Haskell doesn't distinguish in its API between built-in vs. user-defined values, and I would like my lexer to respect that elegance.

### Worries

I haven't tested, and therefore cannot vouch for:

  * GADTs
  * type families
  * pattern synonyms, view patterns
  * package imports
  * negative literals

## Installation

Clone this repository into your sublime installation under `Packages/`.
On Linux (mine at least), this is `~/.config/sublime-text-3/Packages`.

## Contributing

### Reading List

Here's a list of some resources I found useful navigating these config files:

  * Alter Builtin Snippets: [question](https://forum.sublimetext.com/t/how-can-i-modify-built-in-packages-snippets/9939) and [docs](http://www.sublimetext.com/docs/3/packages.html)
  * [Syntax Definitions](https://www.sublimetext.com/docs/3/syntax.html)
  * [Scope Naming](https://www.sublimetext.com/docs/3/scope_naming.html)
  * [Completions Files](https://sublime-text-unofficial-documentation.readthedocs.io/en/latest/reference/completions.html)
  * [Package Resource Viewer](https://packagecontrol.io/packages/PackageResourceViewer)
  * [Oniguruma regex docs](https://raw.githubusercontent.com/kkos/oniguruma/5.9.6/doc/RE)
