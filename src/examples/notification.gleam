import examples/konst
import gleam/option.{None, Some}
import gu

pub fn main() {
   gu.zenity
   |> gu.new_notification(
      text: Some(konst.lorem_ipsum),
      icon: None,
      listen: False,
   )
   |> gu.show(True)
}
