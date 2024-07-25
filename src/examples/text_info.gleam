import gleam/option.{None}
import gleam/result
import gu

pub fn main() {
   gu.zenity
   |> gu.new_text_info(
      filename: None,
      editable: True,
      font: None,
      checkbox: None,
      auto_scroll: False,
   )
   |> gu.set_title("Text Info")
   |> gu.prompt()
   |> result.map(fn(answer: String) {
      gu.zenity
      |> gu.new_info()
      |> gu.set_text(answer)
      |> gu.set_timeout(10)
      |> gu.show(True)
   })
}
