## Basic Data Types

### Integers

255
#255

#Support for binary, octal, and hexadecimal numbers comes built in:

0b0110
#6
0o644
#420
0x1F
#31

### Floats

#In Elixir, floating point numbers require a decimal after at least one digit; they have 64-bit double precision and support `e` for exponent values:

3.14
#3.14
.14
#** (SyntaxError) iex:2: syntax error before: '.'
1.0e-10
#1.0e-10

### Booleans

#Elixir supports `true` and `false` as booleans; everything is truthy except for `false` and `nil`:

true
#true
false
#false

### Atoms

#An atom is a constant whose name is its value.
#If you're familiar with Ruby, these are synonymous with Symbols:

:foo
#:foo
:foo == :bar
#false

#The booleans `true` and `false` are also the atoms `:true` and `:false`, respectively.

is_atom(true)
#true
is_boolean(:true)
#true
:true === true
#true

#Names of modules in Elixir are also atoms. `MyApp.MyModule` is a valid atom, even if no such module has been declared yet.

is_atom(MyApp.MyModule)
#true

#Atoms are also used to reference modules from Erlang libraries, including built in ones.

:crypto.strong_rand_bytes 3
#<<23, 104, 108>>

### Strings

#Strings in Elixir are UTF-8 encoded and are wrapped in double quotes:

"Hello"
#"Hello"
"dziękuję"
#"dziękuję"

#Strings support line breaks and escape sequences:

"foo
...> bar"
"foo\nbar"
"foo\nbar"
"foo\nbar"

#Elixir also includes more complex data types.
#We'll learn more about these when we learn about [collections](/en/lessons/basics/collections) and [functions](/en/lessons/basics/functions).

## Basic Operations

### Arithmetic

#Elixir supports the basic operators `+`, `-`, `*`, and `/` as you would expect.
#It's important to remember that `/` will always return a float:

2 + 2
#4
2 - 1
#1
2 * 5
#10
10 / 5
#2.0

#If you need integer division or the division remainder (i.e., modulo), Elixir comes with two helpful functions to achieve this:

div(10, 5)
#2
rem(10, 3)
#1

### Boolean

#Elixir provides the `||`, `&&`, and `!` boolean operators.
#These support any types:

-20 || true
#-20
false || 42
#42

42 && true
#true
42 && nil
#nil

!42
#false
!false
#true

#There are three additional operators whose first argument _must_ be a boolean (`true` or `false`):

true and 42
#42
false or true
#true
not false
#true
42 and true
#** (BadBooleanError) expected a boolean on left-side of "and", got: 42
not 42
#** (ArgumentError) argument error

#Note: Elixir's `and` and `or` actually map to `andalso` and `orelse` in Erlang.

### Comparison

#Elixir comes with all the comparison operators we're used to: `==`, `!=`, `===`, `!==`, `<=`, `>=`, `<`, and `>`.

1 > 2
#false
1 != 2
#true
2 == 2
#true
2 <= 3
#true

#For strict comparison of integers and floats, use `===`:

2 == 2.0
#true
2 === 2.0
#false

#An important feature of Elixir is that any two types can be compared; this is particularly useful in sorting. We don't need to memorize the sort order, but it is important to be aware of it:

#number < atom < reference < function < port < pid < tuple < map < list < bitstring

#This can lead to some interesting, yet valid comparisons you may not find in other languages:

:hello > 999
#true
{:hello, :world} > [1, 2, 3]
#false

### String Interpolation

#If you've used Ruby, string interpolation in Elixir will look familiar:

name = "Sean"
#>>"Sean"
"Hello #{name}"
"Hello Sean"

# String Concatenation

#String concatenation uses the `<>` operator:

name = "Sean"
#"Sean"
"Hello " <> name
#"Hello Sean"
