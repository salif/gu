import examples/konst as k
import gleam/option.{None, Some}
import gu

pub fn main() {
   let answer =
      gu.zenity
      |> gu.new_question()
      |> gu.set_title("Question")
      |> gu.set_text(k.lorem_ipsum)
      |> gu.new_question_opts(default_cancel: False, switch: False)
      |> gu.run(False)

   let answer = case answer {
      Some(_) -> "Yes"
      None -> "No"
   }

   gu.zenity
   |> gu.new_info()
   |> gu.set_text(answer)
   |> gu.set_timeout(10)
   |> gu.run(False)
}
