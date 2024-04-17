import gleam/option.{None, Some}
import gu

pub fn main() {
   let answer =
      gu.zenity
      |> gu.new_password(username: True)
      |> gu.set_title("Password")
      |> gu.run(False)

   case answer {
      Some(#(_, val)) -> {
         case gu.parse_list(val, "|") {
            [username, password] -> {
               gu.zenity
               |> gu.new_info()
               |> gu.set_text("Username: " <> username <> "\nPassword: " <> password)
               |> gu.set_timeout(10)
               |> gu.run(False)
               Nil
            }
            _ -> Nil
         }
      }
      None -> Nil
   }
}
