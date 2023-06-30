# Code Design

This file contains notes about code design and conventions with the aim of
making collaboration and future modifications easier.

## Naming
- Snake case is used wherever possible
- Test files are named `test-XX_DESCRIPTION.R`, where `XX` is the order they 
  should be run (try to test lower order functions first).

## Code formating
- Put closing brackets `)` on the next line for multi-line functions

## Best practices
- Do not use `return()` unless calling high up in a function
- Use 

## tidyeval
- Use {{ }} where tidyeval variable used directly
- Use `rlang::as_label(rlang::enquo())` to get name
  - For unclear reasons, the `check_column()` function calls have to be in the 
    main function and cannot be moved into a sub `check_XXX()` function
