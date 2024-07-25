import examples/konst
import gleam/option.{None, Some}
import gu

pub fn main() {
   gu.zenity
   |> gu.new_warning()
   |> gu.set_title("Warning")
   |> gu.new_message_opts(
      text: Some(konst.lorem_ipsum),
      icon: None,
      no_wrap: False,
      no_markup: False,
      ellipsize: False,
   )
   |> gu.show(True)
}
