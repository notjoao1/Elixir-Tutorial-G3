# Implement a simple program that tries to open a file
# if it opens the file succesfully it prints "Success"
# else it prints "Failed #{reason}"

file_path  = "openingfile.ex"
File.open(file_path, [:read, :utf8])

# 1. Using case

# 2. Using with
