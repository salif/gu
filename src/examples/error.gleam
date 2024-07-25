import examples/konst
import gu

pub fn main() {
   gu.zenity
   |> gu.new_error()
   |> gu.set_title("Error")
   |> gu.set_text(konst.lorem_ipsum)
   |> gu.show(True)
}
