import gleam/option.{None, Some}
import gu

pub fn main() {
   let answer =
      gu.zenity
      |> gu.new_entry(text: Some("Enter text"), entry_text: Some("text..."), hide_text: False)
      |> gu.set_title("Entry")
      |> gu.run(False)

   let answer = case answer {
      Some(#(_, val)) -> gu.parse(val)
      None -> "No answer"
   }

   gu.zenity
   |> gu.new_info()
   |> gu.set_text(answer)
   |> gu.set_timeout(10)
   |> gu.run(False)
}
