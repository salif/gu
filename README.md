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
   let demo = 
         gu.zenity
         |> gu.set_title("Demo")
         |> gu.new_entry(
            text: Some("What's Your Name?"),
            entry_text: None,
            hide_text: False,
         )
         |> gu.run(False)
   let name = case demo {
      Some(#(_, val)) -> gu.parse(val)
      None -> "Unknown"
   }
   gu.zenity
   |> gu.new_info()
   |> gu.set_title("Demo")
   |> gu.set_text("Hello, " <> name <> "!")
   |> gu.run(False)
}
```

![][1]

## Examples

Links work on [GitHub](https://github.com/salif/gu)

| zenity | code |
| :--- | :--- |
| \-\-calendar | [calendar.gleam](/src/examples/calendar.gleam) |
| \-\-entry | [entry.gleam](/src/examples/entry.gleam) |
| \-\-error | [error.gleam](/src/examples/error.gleam) |
| \-\-info | [info.gleam](/src/examples/info.gleam) |
| \-\-file-selection | [file_selection.gleam](/src/examples/file_selection.gleam) |
| \-\-list | [list.gleam](/src/examples/list.gleam) |
| \-\-notification | [notification.gleam](/src/examples/notification.gleam) |
| \-\-question | [question.gleam](/src/examples/question.gleam) |
| \-\-warning | [warning.gleam](/src/examples/warning.gleam) |
| \-\-scale | [scale.gleam](/src/examples/scale.gleam) |
| \-\-text-info | [text_info.gleam](/src/examples/text_info.gleam) |
| \-\-color-selection | [color_selection.gleam](/src/examples/color_selection.gleam) |
| \-\-password | [password.gleam](/src/examples/password.gleam) |
| \-\-forms | [forms.gleam](/src/examples/forms.gleam) |

Further documentation can be found at <https://hexdocs.pm/gu>.

## Development

```sh
gleam run -m examples/forms # Run an example
gleam test  # Run the tests
gleam shell # Run an Erlang shell
```

[1]: data:image/png;base64,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
