import gu

pub fn main() {
   let answer =
      gu.zenity
      |> gu.new_password(username: True)
      |> gu.set_title("Password")
      |> gu.show(err: False)

   case answer {
      Ok(val) -> {
         case gu.parse_list(val, "|") {
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
      }
      Error(_) -> Nil
   }
}
