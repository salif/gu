import gleam/result
import gleam/string
import gu

pub fn main() {
   gu.zenity
   |> gu.new_password(username: True)
   |> gu.set_title("Password")
   |> gu.prompt()
   |> result.map(fn(answer: String) {
      case string.split(answer, "|") {
         [username, password] -> {
            let _ =
               gu.zenity
               |> gu.new_info()
               |> gu.set_text(
                  "Username: " <> username <> "\nPassword: " <> password,
               )
               |> gu.set_timeout(10)
               |> gu.show(True)
            Nil
         }
         _ -> Nil
      }
   })
}
