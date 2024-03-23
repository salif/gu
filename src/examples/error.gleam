import gu
import examples/konst as k

pub fn main() {
   gu.zenity
   |> gu.new_error()
   |> gu.set_title("Error")
   |> gu.set_text(k.lorem_ipsum)
   |> gu.run(False)
}
