import gleam/option.{None, Some}
import gu

pub fn main() {
   let answer =
      gu.zenity
      |> gu.new_color_selection(color: None, show_palette: False)
      |> gu.set_title("Color Selection")
      |> gu.run(False)

   let answer = case answer {
      Some(#(_, val)) -> gu.parse(val)
      None -> "No color selected"
   }

   gu.zenity
   |> gu.new_info()
   |> gu.set_text(answer)
   |> gu.set_timeout(10)
   |> gu.run(False)
}
