import gleam/int
import gleam/list
import gleam/option.{type Option, None, Some}
import gleam/string
import shellout

pub type GuResult =
   Result(String, #(Int, String))

/// zenity v4.0.1
pub const zenity: List(String) = ["zenity"]

pub fn cmd(command: List(String)) -> List(String) {
   list.reverse(command)
}

pub fn help_all(command: List(String)) -> List(String) {
   ["--help-all", ..command]
}

pub fn about(command: List(String)) -> List(String) {
   ["--about", ..command]
}

pub fn version(command: List(String)) -> List(String) {
   ["--version", ..command]
}

pub fn set_text(command: List(String), text: String) -> List(String) {
   add_option(command, Some(text), "text")
}

pub fn set_title(command: List(String), title: String) -> List(String) {
   add_option(command, Some(title), "title")
}

pub fn set_width(command: List(String), width: Int) -> List(String) {
   add_option(command, Some(int.to_string(width)), "width")
}

pub fn set_height(command: List(String), height: Int) -> List(String) {
   add_option(command, Some(int.to_string(height)), "height")
}

pub fn set_timeout(command: List(String), timeout: Int) -> List(String) {
   add_option(command, Some(int.to_string(timeout)), "timeout")
}

pub fn set_ok_label(command: List(String), ok_label: String) -> List(String) {
   add_option(command, Some(ok_label), "ok-label")
}

pub fn set_cancel_label(
   command: List(String),
   cancel_label: String,
) -> List(String) {
   add_option(command, Some(cancel_label), "cancel-label")
}

pub fn add_extra_button(
   command: List(String),
   extra_button: String,
) -> List(String) {
   add_option(command, Some(extra_button), "extra-button")
}

pub fn set_modal(command: List(String)) -> List(String) {
   ["--modal", ..command]
}

pub const type_error: String = "--error"

pub fn new_error(command: List(String)) -> List(String) {
   [type_error, ..command]
}

pub const type_info: String = "--info"

pub fn new_info(command: List(String)) -> List(String) {
   [type_info, ..command]
}

pub const type_question: String = "--question"

pub fn new_question(command: List(String)) -> List(String) {
   [type_question, ..command]
}

pub const type_warning: String = "--warning"

pub fn new_warning(command: List(String)) -> List(String) {
   [type_warning, ..command]
}

pub fn new_message_opts(
   command: List(String),
   text text: Option(String),
   icon icon: Option(String),
   no_wrap no_wrap: Bool,
   no_markup no_markup: Bool,
   ellipsize ellipsize: Bool,
) -> List(String) {
   command
   |> add_option(text, "text")
   |> add_option(icon, "icon")
   |> add_option_bool(no_wrap, "no-wrap")
   |> add_option_bool(no_markup, "no-markup")
   |> add_option_bool(ellipsize, "ellipsize")
}

pub fn new_calendar(
   command: List(String),
   text text: Option(String),
   day day: Option(Int),
   month month: Option(Int),
   year year: Option(Int),
   date_format date_format: Option(String),
) -> List(String) {
   ["--calendar", ..command]
   |> add_option(text, "text")
   |> add_option_int(day, "day")
   |> add_option_int(month, "month")
   |> add_option_int(year, "year")
   |> add_option(date_format, "date-format")
}

pub fn new_entry(
   command: List(String),
   text text: Option(String),
   entry_text entry_text: Option(String),
   hide_text hide_text: Bool,
) -> List(String) {
   ["--entry", ..command]
   |> add_option(text, "text")
   |> add_option(entry_text, "entry-text")
   |> add_option_bool(hide_text, "hide-text")
}

pub fn new_file_selection(
   command: List(String),
   filename filename: Option(String),
   multiple multiple: Bool,
   directory directory: Bool,
   save save: Bool,
   separator separator: Option(String),
   file_filter file_filter: Option(List(String)),
) -> List(String) {
   ["--file-selection", ..command]
   |> add_option(filename, "filename")
   |> add_option_bool(multiple, "multiple")
   |> add_option_bool(directory, "directory")
   |> add_option_bool(save, "save")
   |> add_option(separator, "separator")
   |> add_option_list(file_filter, "file-filter")
}

pub fn new_list(command: List(String)) -> List(String) {
   ["--list", ..command]
}

pub fn new_list_opts(
   command: List(String),
   checklist checklist: Bool,
   radiolist radiolist: Bool,
   imagelist imagelist: Bool,
   separator separator: Option(String),
   multiple multiple: Bool,
   editable editable: Bool,
   print_column print_column: Option(String),
   hide_column hide_column: Option(Int),
   hide_header hide_header: Bool,
) -> List(String) {
   command
   |> add_option_bool(checklist, "checklist")
   |> add_option_bool(radiolist, "radiolist")
   |> add_option_bool(imagelist, "imagelist")
   |> add_option(separator, "separator")
   |> add_option_bool(multiple, "multiple")
   |> add_option_bool(editable, "editable")
   |> add_option(print_column, "print-column")
   |> add_option_int(hide_column, "hide-column")
   |> add_option_bool(hide_header, "hide-header")
}

pub fn add_column(command: List(String), column: String) -> List(String) {
   add_option(command, Some(column), "column")
}

pub fn add_row(command: List(String), row: List(String)) -> List(String) {
   row
   |> list.reverse()
   |> list.append(command)
}

pub fn new_notification(
   command: List(String),
   text text: Option(String),
   icon icon: Option(String),
   listen listen: Bool,
) -> List(String) {
   ["--notification", ..command]
   |> add_option(text, "text")
   |> add_option(icon, "icon")
   |> add_option_bool(listen, "listen")
}

/// TODO: stdin
pub fn new_progress(
   command: List(String),
   text text: Option(String),
   percentage percentage: Option(String),
   pulsate pulsate: Bool,
   auto_close auto_close: Bool,
   auto_kill auto_kill: Bool,
   no_cancel no_cancel: Bool,
   time_remaining time_remaining: Bool,
) -> List(String) {
   ["--progress", ..command]
   |> add_option(text, "text")
   |> add_option(percentage, "percentage")
   |> add_option_bool(pulsate, "pulsate")
   |> add_option_bool(auto_close, "auto-close")
   |> add_option_bool(auto_kill, "auto-kill")
   |> add_option_bool(no_cancel, "no-cancel")
   |> add_option_bool(time_remaining, "time-remaining")
}

pub fn new_question_opts(
   command: List(String),
   default_cancel default_cancel: Bool,
   switch switch: Bool,
) -> List(String) {
   command
   |> add_option_bool(default_cancel, "default-cancel")
   |> add_option_bool(switch, "switch")
}

pub fn new_scale(
   command: List(String),
   text text: Option(String),
   value value: Option(Int),
   min_value min_value: Option(Int),
   max_value max_value: Option(Int),
   step step: Option(Int),
   print_partial print_partial: Bool,
   hide_value hide_value: Bool,
) -> List(String) {
   ["--scale", ..command]
   |> add_option(text, "text")
   |> add_option_int(value, "value")
   |> add_option_int(min_value, "min-value")
   |> add_option_int(max_value, "max-value")
   |> add_option_int(step, "step")
   |> add_option_bool(print_partial, "print-partial")
   |> add_option_bool(hide_value, "hide-value")
}

pub fn new_text_info(
   command: List(String),
   filename filename: Option(String),
   editable editable: Bool,
   font font: Option(String),
   checkbox checkbox: Option(String),
   auto_scroll auto_scroll: Bool,
) -> List(String) {
   ["--text-info", ..command]
   |> add_option(filename, "filename")
   |> add_option_bool(editable, "editable")
   |> add_option(font, "font")
   |> add_option(checkbox, "checkbox")
   |> add_option_bool(auto_scroll, "auto-scroll")
}

pub fn new_color_selection(
   command: List(String),
   color color: Option(String),
   show_palette show_palette: Bool,
) -> List(String) {
   ["--color-selection", ..command]
   |> add_option(color, "color")
   |> add_option_bool(show_palette, "show-palette")
}

pub fn new_password(
   command: List(String),
   username username: Bool,
) -> List(String) {
   ["--password", ..command]
   |> add_option_bool(username, "username")
}

pub fn new_forms(command: List(String)) -> List(String) {
   ["--forms", ..command]
}

pub fn add_entry(command: List(String), entry: String) -> List(String) {
   add_option(command, Some(entry), "add-entry")
}

pub fn add_password(command: List(String), password: String) -> List(String) {
   add_option(command, Some(password), "add-password")
}

pub fn add_calendar(command: List(String), calendar: String) -> List(String) {
   add_option(command, Some(calendar), "add-calendar")
}

pub fn add_combo_and_values(
   command: List(String),
   combo: String,
   values values: List(String),
) -> List(String) {
   command
   |> add_option(Some(combo), "add-combo")
   |> add_option(Some(string.join(values, "|")), "combo-values")
}

pub fn add_list_and_values(
   command: List(String),
   list_name: String,
   values values: List(String),
   column_values column_values: Option(List(String)),
) -> List(String) {
   command
   |> add_option(Some(list_name), "add-list")
   |> add_option(Some(string.join(values, "|")), "list-values")
   |> add_option_list(column_values, "column-values")
}

pub fn set_separator(command: List(String), separator: String) -> List(String) {
   add_option(command, Some(separator), "separator")
}

pub fn set_show_header(command: List(String)) -> List(String) {
   ["--show-header", ..command]
}

pub fn set_forms_date_format(
   command: List(String),
   format: String,
) -> List(String) {
   add_option(command, Some(format), "forms-date-format")
}

pub fn add_value(command: List(String), value: String) -> List(String) {
   [value, ..command]
}

pub fn add_value_if(
   command: List(String),
   condition: Bool,
   value: String,
) -> List(String) {
   case condition {
      True -> add_value(command, value)
      False -> command
   }
}

@deprecated("Use `add_option()` instead.")
pub fn add_opt(
   command: List(String),
   opt: Option(String),
   str: String,
) -> List(String) {
   add_option(command, opt, str)
}

pub fn add_option(
   command: List(String),
   opt: Option(String),
   str: String,
) -> List(String) {
   case opt {
      Some(val) -> ["--" <> str <> "=" <> val, ..command]
      None -> command
   }
}

@deprecated("Use `add_option_if()` instead.")
pub fn add_opt_if(
   command: List(String),
   condition: Bool,
   opt: String,
   str: String,
) -> List(String) {
   add_option_if(command, condition, opt, str)
}

pub fn add_option_if(
   command: List(String),
   condition: Bool,
   opt: String,
   str: String,
) -> List(String) {
   case condition {
      True -> add_option(command, Some(opt), str)
      False -> command
   }
}

@deprecated("Use `add_option_int()` instead.")
pub fn add_opt_int(
   command: List(String),
   opt: Option(Int),
   str: String,
) -> List(String) {
   add_option_int(command, opt, str)
}

pub fn add_option_int(
   command: List(String),
   opt: Option(Int),
   str: String,
) -> List(String) {
   case opt {
      Some(val) -> ["--" <> str <> "=" <> int.to_string(val), ..command]
      None -> command
   }
}

@deprecated("Use `add_option_list()` instead.")
pub fn add_opt_list(
   command: List(String),
   opt_list: Option(List(String)),
   str: String,
) -> List(String) {
   add_option_list(command, opt_list, str)
}

pub fn add_option_list(
   command: List(String),
   opt_list: Option(List(String)),
   str: String,
) -> List(String) {
   case opt_list {
      Some(val) -> ["--" <> str <> "=" <> string.join(val, "|"), ..command]
      None -> command
   }
}

@deprecated("Use `add_option_bool()` instead.")
pub fn add_bool(
   command: List(String),
   condition: Bool,
   str: String,
) -> List(String) {
   add_option_bool(command, condition, str)
}

pub fn add_option_bool(
   command: List(String),
   condition: Bool,
   str: String,
) -> List(String) {
   case condition {
      True -> ["--" <> str, ..command]
      False -> command
   }
}

@internal
pub fn do_parse(str: String) -> String {
   case string.ends_with(str, "\n") {
      True -> string.slice(str, 0, string.length(str) - 1)
      False -> str
   }
}

@deprecated("Use `prompt()` instead of `show()`.")
pub fn parse(str: String) -> String {
   do_parse(str)
}

@deprecated("Use `string.split(prompt())` instead.")
pub fn parse_list(str: String, separator: String) -> List(String) {
   string.split(do_parse(str), separator)
}

@deprecated("Use `show()` instead.")
pub fn run(command: List(String), errors errors: Bool) -> Option(#(Int, String)) {
   let opts = case errors {
      True -> []
      False -> [shellout.LetBeStderr]
   }
   case list.reverse(command) {
      [run, ..with] ->
         case shellout.command(run: run, with: with, in: ".", opt: opts) {
            Ok(val) -> Some(#(0, val))
            Error(err) ->
               case errors {
                  True -> Some(err)
                  False -> None
               }
         }
      _ -> None
   }
}

/// Same as `show_in(".")`
pub fn show(command: List(String), err capture_errors: Bool) -> GuResult {
   show_in(command, ".", capture_errors)
}

pub fn show_in(
   command: List(String),
   in_dir: String,
   err capture_errors: Bool,
) -> GuResult {
   let opts = case capture_errors {
      True -> []
      False -> [shellout.LetBeStderr]
   }
   case list.reverse(command) {
      [run, ..with] ->
         shellout.command(run: run, with: with, in: in_dir, opt: opts)
      _ -> Error(#(-1, "Array length is too short"))
   }
}

/// Same as `show(err: False)`, but trims the last newline from the result
pub fn prompt(command: List(String)) -> GuResult {
   prompt_in(command, ".")
}

/// Same as `show_in(err: False)`, but trims the last newline from the result
pub fn prompt_in(command: List(String), in_dir: String) -> GuResult {
   case show_in(command, in_dir, False) {
      Ok(val) -> Ok(do_parse(val))
      Error(err) -> Error(#(err.0, do_parse(err.1)))
   }
}

/// Same as `shellout.exit`
pub fn exit(status: Int) -> Nil {
   shellout.exit(status)
}
