# Before we can handle errors we need to create them and the simplest way to do so is with `raise/1`:
raise "Oh no!"
# >> ** (RuntimeError) Oh no!

# If we want to specify the type and message, we need to use `raise/2`:
raise ArgumentError, message: "the argument value is invalid"
# ** (ArgumentError) the argument value is invalid

# When we know an error may occur, we can handle it using `try/rescue` and pattern matching:
try do
  raise "Oh no!"
rescue
  e in RuntimeError -> IO.puts("An error occurred: " <> e.message)
end
# An error occurred: Oh no!

# It’s possible to match multiple errors in a single rescue:
opts = [source_file: "path_to_file"]
try do
  opts
  |> Keyword.fetch!(:source_file)
  |> File.read!()
rescue
  _ in KeyError -> IO.puts("missing :source_file option")
  _ in File.Error -> IO.puts("unable to read source file")
end

# At times it may be necessary to perform some action after our `try/rescue` regardless of error. For this we have `try/after`.
# If you’re familiar with Java this is akin to `try/catch/finally`:

{:ok, file} = File.open("tryrescue.ex")
try do
  # Do hazardous work
after
  File.close(file)
end
