# The match operator performs assignment when
# the left side of the match includes a variable.
# In some cases this variable rebinding behavior is undesirable.
# For these situations we have the pin operator: `^`

x = 1
# >> 1

^x = 2
# >> ** (MatchError) no match of right hand side value: 2

# By pinning x its like we are doing {x,1} = {2,1}
{x, ^x} = {2, 1}
# >> {2, 1}

# So x gets assigned to 2
x
# >> 2

# An example of pinning in a function clause:
greeting = "Hello"
greet = fn
  # we are doing ( "Hello" , name ) -> "Hi #{name}"
  (^greeting, name) -> "Hi #{name}"
  # in here `greeting` doesnt refer to the variable
  # but its only treated as a function argument so
  # the match doesnt alter the value of the variable `greeting`
  (greeting, name) -> "#{greeting}, #{name}"
end

greet.("Hello", "Sean")
# >> "Hi Sean"
greet.("Mornin'", "Sean")
# >> "Mornin', Sean"
greeting
# >> "Hello"
