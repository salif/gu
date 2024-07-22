import gleam/option.{None}
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
      |> gu.show(err: False)

   case answer {
      Ok(val) -> {
         let _ =
            gu.zenity
            |> gu.new_info()
            |> gu.set_text(gu.parse(val))
            |> gu.set_timeout(10)
            |> gu.show(True)
         Nil
      }
      Error(_) -> Nil
   }
}
