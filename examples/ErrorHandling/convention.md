At the moment, the Elixir community has come to some conventions regarding returning errors:

- For errors that are part of the regular operation of a function (e.g. a user entered a wrong type of date), a function returns `{:ok, result}` and `{:error, reason}` accordingly.
- For errors that are not part of normal operations (e.g. being unable to parse configuration data) you throw an exception.

Often, in public APIs, you can also find a second version of the function with a ! (`example!/1`) that returns the unwrapped result or raises an error.

We generally handle standard flow errors by Pattern Matching.