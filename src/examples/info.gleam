import examples/konst as k
import gu

pub fn main() {
   gu.zenity
   |> gu.new_info()
   |> gu.set_title("Info")
   |> gu.set_text(k.lorem_ipsum)
   |> gu.show(True)
}
