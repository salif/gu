import gleam/option.{None, Some}
import gu

pub fn main() {
   let answer =
      gu.zenity
      |> gu.new_calendar(
         text: None,
         day: Some(31),
         month: Some(12),
         year: Some(1999),
         date_format: None,
      )
      |> gu.set_title("Calendar")
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
