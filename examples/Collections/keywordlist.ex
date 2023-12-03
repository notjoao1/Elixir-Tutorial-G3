# Keyword lists and maps are the associative collections of Elixir.
# In Elixir, a keyword list is a special list of two-element tuples whose first element is an atom;
# they share performance with lists:
# The three characteristics of keyword lists highlight their importance:
# - Keys are atoms.
# - Keys are ordered.
# - Keys do not have to be unique.
# For these reasons, keyword lists are most commonly used to pass options to functions.

[foo: "bar", hello: "world"]
# >> [foo: "bar", hello: "world"]
[{:foo, "bar"}, {:hello, "world"}]
# >> [foo: "bar", hello: "world"]

# passing a keyword list to a function
if(1==1,do: 1,else: 2)
# >> 1
if( 1==1 , [{ :do , 1 },{:else , 2}] )
# >> 1

