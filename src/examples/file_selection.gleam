import gleam/option.{None, Some}
import gleam/result
import gleam/string
import gu

pub fn main() {
   gu.zenity
   |> gu.new_file_selection(
      filename: None,
      multiple: True,
      directory: False,
      save: False,
      separator: Some("|"),
      file_filter: Some(["*.gleam"]),
   )
   |> gu.set_title("Select Gleam Files")
   |> gu.prompt()
   |> result.map(string.split(_, "|"))
   |> result.map(string.join(_, ",\n"))
   |> result.unwrap("No files selected")
   |> fn(answer: String) {
      gu.zenity
      |> gu.new_info()
      |> gu.set_text(answer)
      |> gu.set_timeout(10)
      |> gu.show(True)
   }
}
