# In Elixir, maps are the “go-to” key-value store.
# Unlike keyword lists, they allow keys of any type and are un-ordered.
# You can define a map with the `%{}` syntax:

map = %{:foo => "bar", "hello" => :world}
# >> %{:foo => "bar", "hello" => :world}

map[:foo]
# >> "bar"

map["hello"]
# >> :world

# Since elixir 1.2 variables can also be map keys:
key = "hello"
%{key => "world"}
# >> %{"hello" => "world"}

# If a duplicate is added to a map, it will replace the former value:
%{:foo => "bar", :foo => "hello world"}
# >> %{foo: "hello world"}

# there is a special syntax for maps containing only atom keys:
map = %{foo: "bar", hello: "world"}
# >>  %{foo: "bar", hello: "world"}
%{foo: "bar", hello: "world"} == %{:foo => "bar", :hello => "world"}
# >> true

# Only if key is atom
map.hello
# >> "world"

# Another interesting property of maps is that they provide their own syntax for updates (note: this creates a new map):
map = %{foo: "bar", hello: "world"}
%{map | foo: "baz"}
# >> %{foo: "baz", hello: "world"}
# Note: this syntax only works for updating a key that already exists in the map!

# To add new key value to map
Map.put(%{:a => 1, 2 => :b}, :c, 3)
# >> %{2 => :b, :a => 1, :c => 3}
