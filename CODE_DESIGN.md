# Code Design

This file contains notes about code design and conventions with the aim
of making collaboration and future modifications easier.

## Naming

- Snake case is used wherever possible
- Test files are named `test-XX_DESCRIPTION.R`, where `XX` is the order
  they should be run (try to test lower order functions first).

## Code formating

- Put closing brackets `)` on the next line for multi-line functions

## Best practices

- Do not use [`return()`](https://rdrr.io/r/base/function.html) unless
  calling high up in a function

## tidyeval

- Use {{ }} where tidyeval variable used directly
- Use `rlang::as_label(rlang::enquo())` to get name
  - For unclear reasons, the `check_column()` function calls have to be
    in the main function and cannot be moved into a sub `check_XXX()`
    function

## Documentation

- Reuse common documentation with `@inheritParams common_docs` and
  `@inheritSection common_docs SECTION NAME`.
  - see rOxygen article:
    <https://roxygen2.r-lib.org/articles/reuse.html#inheriting-documentation>
  - see `R/aa_common_docs.R` for where the common descriptions are
    stored

## Other

- For [`purrr::map()`](https://purrr.tidyverse.org/reference/map.html)
  if passing `...` must use the base R anonymous function `\(x)` and
  *not* the lambda notation `~`. This is because the lambda notaion
  passes the mapped variable in as `...` or `.x` or `..1`, so the global
  `...` is overwritten. The R base `\(x)` passes it in as `x` only.
