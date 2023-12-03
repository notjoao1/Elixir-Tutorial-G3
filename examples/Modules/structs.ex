# Structs are special maps with a defined set of keys and default values.
# A struct must be defined within a module, which it takes its name from.

defmodule Example.User do
  defstruct name: "Sean", roles: []
end

%Example.User{}
# >> %Example.User<name: "Sean", roles: []>

%Example.User{name: "Steve"}
# >> %Example.User<name: "Steve", roles: []>

%Example.User{name: "Steve", roles: [:manager]}
# >> %Example.User<name: "Steve", roles: [:manager]>

# We can update our struct just like we would a map:
steve = %Example.User{name: "Steve"}
sean = %{steve | name: "Sean"}
# >> %Example.User<name: "Sean", roles: [...], ...>

# You can match structs against maps:
%{name: "Sean"} = sean
# >> %Example.User<name: "Sean", roles: [...]>

