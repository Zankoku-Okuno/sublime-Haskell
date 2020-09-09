# Haskell Syntax for Sublime Text 3

The built-in Haskell syntax is a bit broken, especially when it comes to more recent extensions (but even some stuff from Haskell1998 isn't done right!).

## Fixes

  * qualified names in backtick-infix syntax
  * numbers in names in backtick-infix syntax
  * `deriving` a single class without parenthesis
  * support for DerivingStrategies and DerivingVia

More controversially(?) I've removed a bunch of Haskell "builtin" highlighting.
The Haskell sub-communities have very different ideas about what classes are and are not commonly-used.
Besides, I quite like that Haskell doesn't distinguish in its API between built-in vs. user-defined values, and I would like my lexer to respect that elegance.
