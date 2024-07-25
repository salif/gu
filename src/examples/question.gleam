import examples/konst
import gleam/result
import gu

pub fn main() {
   let answer: Bool =
      gu.zenity
      |> gu.new_question()
      |> gu.set_title("Question")
      |> gu.set_text(konst.lorem_ipsum)
      |> gu.new_question_opts(default_cancel: False, switch: False)
      |> gu.prompt()
      |> result.replace(True)
      |> result.replace_error(False)
      |> result.unwrap_both()

   gu.zenity
   |> gu.new_info()
   |> gu.set_text(case answer {
      True -> "Yes"
      False -> "No"
   })
   |> gu.set_timeout(10)
   |> gu.show(True)
}
