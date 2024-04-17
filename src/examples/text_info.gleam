import gleam/option.{None, Some}
import gu

pub fn main() {
   let answer =
      gu.zenity
      |> gu.new_text_info(
         filename: None,
         editable: True,
         font: None,
         checkbox: None,
         auto_scroll: False,
      )
      |> gu.set_title("Text Info")
      |> gu.run(False)

   case answer {
      Some(#(_, val)) -> {
         gu.zenity
         |> gu.new_info()
         |> gu.set_text(gu.parse(val))
         |> gu.set_timeout(10)
         |> gu.run(False)
         Nil
      }
      None -> Nil
   }
}
