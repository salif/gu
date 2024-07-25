import gleam/option.{None, Some}
import gleam/result
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
      |> gu.prompt()
      |> result.unwrap("No date selected")

   gu.zenity
   |> gu.new_info()
   |> gu.set_text(answer)
   |> gu.set_timeout(10)
   |> gu.show(True)
}
