import gleam/option.{None, Some}
import gleam/result
import gleam/string
import gu

pub fn main() {
   gu.zenity
   |> gu.new_list()
   |> gu.set_title("List")
   |> gu.new_list_opts(
      checklist: False,
      radiolist: False,
      imagelist: False,
      separator: Some("|"),
      multiple: True,
      editable: False,
      print_column: None,
      hide_column: Some(1),
      hide_header: False,
   )
   |> gu.add_column("Language")
   |> gu.add_column("1")
   |> gu.add_column("2")
   |> gu.add_column("3")
   |> gu.add_row(["English", "One", "Two", "Three"])
   |> gu.add_row(["Esperanto", "Unu", "Du", "Tri"])
   |> gu.add_row(["Turkish", "Bir", "İki", "Üç"])
   |> gu.add_row(["Bulgarian", "Едно", "Две", "Три"])
   |> gu.prompt()
   |> result.map(string.split(_, "|"))
   |> result.map(fn(answer: List(String)) {
      gu.zenity
      |> gu.new_info()
      |> gu.set_text(string.join(answer, ", "))
      |> gu.set_timeout(10)
      |> gu.show(True)
   })
}
