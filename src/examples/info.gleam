import examples/konst
import gu

pub fn main() {
   gu.zenity
   |> gu.new_info()
   |> gu.set_title("Info")
   |> gu.set_text(konst.lorem_ipsum)
   |> gu.show(True)
}
