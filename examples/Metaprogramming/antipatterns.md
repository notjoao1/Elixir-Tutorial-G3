# Large code generation by macros

## Problem

This anti-pattern is related to macros that generate too much code. When a macro generates a large amount of code, it impacts how the compiler and/or the runtime work. The reason for this is that Elixir may have to expand, compile, and execute the code multiple times, which will make compilation slower and the resulting compiled artifacts larger.

# Unnecessary macros

## Problem

Macros are powerful meta-programming mechanisms that can be used in Elixir to extend the language. While using macros is not an anti-pattern in itself, this meta-programming mechanism should only be used when absolutely necessary. Whenever a macro is used, but it would have been possible to solve the same problem using functions or other existing Elixir structures, the code becomes unnecessarily more complex and less readable. Because macros are more difficult to implement and reason about, their indiscriminate use can compromise the evolution of a system, reducing its maintainability.

# `use` instead of `import`

## Problem

Elixir has mechanisms such as `import/1`, `alias/1`, and `use/1` to establish dependencies between modules. Code implemented with these mechanisms does not characterize a smell by itself. However, while the `import/1` and `alias/1` directives have lexical scope and only facilitate a module calling functions of another, the `use/1` directive has a broader scope, which can be problematic.

The `use/1` directive allows a module to inject any type of code into another, including propagating dependencies. In this way, using the `use/1` directive makes code harder to read, because to understand exactly what will happen when it references a module, it is necessary to have knowledge of the internal details of the referenced module.
