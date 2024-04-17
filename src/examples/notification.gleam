import examples/konst as k
import gleam/option.{None, Some}
import gu

pub fn main() {
   gu.zenity
   |> gu.new_notification(text: Some(k.lorem_ipsum), icon: None, listen: False)
   |> gu.run(False)
}
