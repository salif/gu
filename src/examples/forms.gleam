import gleam/option.{Some}
import gu

pub fn main() {
   let answer =
      gu.zenity
      |> gu.new_forms()
      |> gu.set_title("Forms")
      |> gu.add_entry("Entry")
      |> gu.add_password("Password")
      |> gu.add_list_and_values(
         "List",
         column_values: Some(["1", "2", "3"]),
         values: [
            "One", "Two", "Three", "Unu", "Du", "Tri", "Едно", "Две",
            "Три",
         ],
      )
      |> gu.set_show_header()
      |> gu.add_combo_and_values("Combo", values: ["One", "Two", "Three"])
      |> gu.set_separator("|")
      |> gu.show(err: False)

   case answer {
      Ok(val) -> {
         case gu.parse_list(val, "|") {
            [entry, password, list123, combo] -> {
               let _ =
                  gu.zenity
                  |> gu.new_info()
                  |> gu.set_text(
                     "Entry: "
                     <> entry
                     <> "\nPassword: "
                     <> password
                     <> "\nList: "
                     <> list123
                     <> "\nCombo: "
                     <> combo,
                  )
                  |> gu.set_timeout(10)
                  |> gu.show(True)
               Nil
            }
            _ -> Nil
         }
      }
      Error(_) -> Nil
   }
}
