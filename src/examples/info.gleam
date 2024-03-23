import gu
import examples/konst as k

pub fn main() {
   gu.zenity
   |> gu.new_info()
   |> gu.set_title("Info")
   |> gu.set_text(k.lorem_ipsum)
   |> gu.run(False)
}
