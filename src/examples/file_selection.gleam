import gu
import gleam/string
import gleam/option.{None, Some}

pub fn main() {
   let answer =
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
      |> gu.run(False)

   let answer = case answer {
      Some(#(_, val)) ->
         gu.parse_list(val, "|")
         |> string.join(",\n")
      None -> "No files selected"
   }

   gu.zenity
   |> gu.new_info()
   |> gu.set_text(answer)
   |> gu.set_timeout(10)
   |> gu.run(False)
}
