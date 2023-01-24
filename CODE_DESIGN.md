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
- Use `rlang::enquo()` where `rlang::as_label()` required, or where passing to
  inner functions
