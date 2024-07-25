import gleam/option.{Some}
import gleam/result
import gu

pub fn main() {
   let answer =
      gu.zenity
      |> gu.new_entry(
         text: Some("Enter text"),
         entry_text: Some("text..."),
         hide_text: False,
      )
      |> gu.set_title("Entry")
      |> gu.prompt()
      |> result.unwrap("No answer")

   gu.zenity
   |> gu.new_info()
   |> gu.set_text(answer)
   |> gu.set_timeout(10)
   |> gu.show(True)
}
