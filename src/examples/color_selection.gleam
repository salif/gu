import gleam/option.{None}
import gleam/result
import gu

pub fn main() {
   let answer =
      gu.zenity
      |> gu.new_color_selection(color: None, show_palette: False)
      |> gu.set_title("Color Selection")
      |> gu.prompt()
      |> result.unwrap("No color selected")

   gu.zenity
   |> gu.new_info()
   |> gu.set_text(answer)
   |> gu.set_timeout(10)
   |> gu.show(True)
}
