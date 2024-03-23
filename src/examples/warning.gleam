import gu
import examples/konst as k
import gleam/option.{None, Some}

pub fn main() {
   gu.zenity
   |> gu.new_warning()
   |> gu.set_title("Warning")
   |> gu.new_message_opts(
      text: Some(k.lorem_ipsum),
      icon: None,
      no_wrap: False,
      no_markup: False,
      ellipsize: False,
   )
   |> gu.run(False)
}
