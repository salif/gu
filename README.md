# gu

[![Package Version](https://img.shields.io/hexpm/v/gu)](https://hex.pm/packages/gu)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/gu/)

```sh
gleam add gu
```
```gleam
import gu
import gleam/option.{None, Some}

pub fn main() {
   let name: String = case
      {
         gu.zenity
         |> gu.set_title("Demo")
         |> gu.new_entry(
            text: Some("What's Your Name?"),
            entry_text: None,
            hide_text: False,
         )
         |> gu.run(False)
      }
   {
      Some(#(_, val)) -> gu.parse(val)
      None -> "Unknown"
   }
   gu.zenity
   |> gu.new_info()
   |> gu.set_title("Demo")
   |> gu.new_message_opts(
      text: Some("Hello " <> name <> "!"),
      icon: None,
      no_wrap: False,
      no_markup: False,
      ellipsize: False,
   )
   |> gu.run(True)
}
```

Further documentation can be found at <https://hexdocs.pm/gu>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
gleam shell # Run an Erlang shell
```
