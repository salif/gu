import gu
import gleam/option.{None, Some}

pub fn main() {
   let answer =
      gu.zenity
      |> gu.new_scale(
         text: None,
         value: Some(8),
         min_value: Some(0),
         max_value: Some(20),
         step: None,
         print_partial: False,
         hide_value: False,
      )
      |> gu.set_title("Scale")
      |> gu.run(False)

   let answer = case answer {
      Some(#(_, val)) -> gu.parse(val)
      None -> "No answer"
   }

   gu.zenity
   |> gu.new_info()
   |> gu.set_text(answer)
   |> gu.set_timeout(10)
   |> gu.run(False)
}
