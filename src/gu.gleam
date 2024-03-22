import shellout
import gleam/string
import gleam/list
import gleam/option.{type Option, None, Some}

// v4.0.1
pub const zenity: List(String) = ["zenity"]

pub fn help_all(cmd: List(String)) -> List(String) {
   ["--help-all", ..cmd]
}

pub fn about(cmd: List(String)) -> List(String) {
   ["--about", ..cmd]
}

pub fn version(cmd: List(String)) -> List(String) {
   ["--version", ..cmd]
}

pub fn set_text(command: List(String), text: String) -> List(String) {
   add_opt(command, Some(text), "text")
}

pub fn set_title(command: List(String), title: String) -> List(String) {
   add_opt(command, Some(title), "title")
}

pub fn set_width(command: List(String), width: String) -> List(String) {
   add_opt(command, Some(width), "width")
}

pub fn set_height(command: List(String), height: String) -> List(String) {
   add_opt(command, Some(height), "height")
}

pub fn set_timeout(command: List(String), timeout: String) -> List(String) {
   add_opt(command, Some(timeout), "timeout")
}

pub fn set_ok_label(command: List(String), ok_label: String) -> List(String) {
   add_opt(command, Some(ok_label), "ok-label")
}

pub fn set_cancel_label(command: List(String), cancel_label: String) -> List(String) {
   add_opt(command, Some(cancel_label), "cancel-label")
}

pub fn set_extra_button(command: List(String), extra_button: String) -> List(String) {
   add_opt(command, Some(extra_button), "extra-button")
}

pub fn set_modal(command: List(String), modal: Bool) -> List(String) {
   add_bool(command, modal, "modal")
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
   |> add_opt(text, "text")
   |> add_opt(icon, "icon")
   |> add_bool(no_wrap, "no-wrap")
   |> add_bool(no_markup, "no-markup")
   |> add_bool(ellipsize, "ellipsize")
}

pub fn new_calendar(
   command: List(String),
   text text: Option(String),
   day day: Option(String),
   month month: Option(String),
   year year: Option(String),
   date_format date_format: Option(String),
) -> List(String) {
   ["--calendar", ..command]
   |> add_opt(text, "text")
   |> add_opt(day, "day")
   |> add_opt(month, "month")
   |> add_opt(year, "year")
   |> add_opt(date_format, "date-format")
}

pub fn new_entry(
   command: List(String),
   text text: Option(String),
   entry_text entry_text: Option(String),
   hide_text hide_text: Bool,
) -> List(String) {
   ["--entry", ..command]
   |> add_opt(text, "text")
   |> add_opt(entry_text, "entry-text")
   |> add_bool(hide_text, "hide-text")
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
   |> add_opt(filename, "filename")
   |> add_bool(multiple, "multiple")
   |> add_bool(directory, "directory")
   |> add_bool(save, "save")
   |> add_opt(separator, "separator")
   |> add_opt_list(file_filter, "file-filter")
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
   hide_column hide_column: Option(String),
   hide_header hide_header: Bool,
) -> List(String) {
   command
   |> add_bool(checklist, "checklist")
   |> add_bool(radiolist, "radiolist")
   |> add_bool(imagelist, "imagelist")
   |> add_opt(separator, "separator")
   |> add_bool(multiple, "multiple")
   |> add_bool(editable, "editable")
   |> add_opt(print_column, "print-column")
   |> add_opt(hide_column, "hide-column")
   |> add_bool(hide_header, "hide-header")
}

pub fn add_column(command: List(String), column: String) -> List(String) {
   add_opt(command, Some(column), "column")
}

pub fn add_row(command: List(String), row: List(String)) -> List(String) {
   [string.join(row, " "), ..command]
}

pub fn new_notification(
   command: List(String),
   text text: Option(String),
   icon icon: Option(String),
   listen listen: Bool,
) -> List(String) {
   ["--notification", ..command]
   |> add_opt(text, "text")
   |> add_opt(icon, "icon")
   |> add_bool(listen, "listen")
}

// TODO: stdin
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
   |> add_opt(text, "text")
   |> add_opt(percentage, "percentage")
   |> add_bool(pulsate, "pulsate")
   |> add_bool(auto_close, "auto-close")
   |> add_bool(auto_kill, "auto-kill")
   |> add_bool(no_cancel, "no-cancel")
   |> add_bool(time_remaining, "time-remaining")
}

pub fn new_question_opts(
   command: List(String),
   default_cancel default_cancel: Bool,
   switch switch: Bool,
) -> List(String) {
   command
   |> add_bool(default_cancel, "default-cancel")
   |> add_bool(switch, "switch")
}

pub fn new_scale(
   command: List(String),
   text text: Option(String),
   value value: Option(String),
   min_value min_value: Option(String),
   max_value max_value: Option(String),
   step step: Option(String),
   print_partial print_partial: Bool,
   hide_value hide_value: Bool,
) -> List(String) {
   ["--scale", ..command]
   |> add_opt(text, "text")
   |> add_opt(value, "value")
   |> add_opt(min_value, "min-value")
   |> add_opt(max_value, "max-value")
   |> add_opt(step, "step")
   |> add_bool(print_partial, "print-partial")
   |> add_bool(hide_value, "hide-value")
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
   |> add_opt(filename, "filename")
   |> add_bool(editable, "editable")
   |> add_opt(font, "font")
   |> add_opt(checkbox, "checkbox")
   |> add_bool(auto_scroll, "auto-scroll")
}

pub fn new_color_selection(
   command: List(String),
   color color: Option(String),
   show_palette show_palette: Bool,
) -> List(String) {
   ["--color-selection", ..command]
   |> add_opt(color, "color")
   |> add_bool(show_palette, "show-palette")
}

pub fn new_password(command: List(String), username username: Option(String)) -> List(String) {
   ["--password", ..command]
   |> add_opt(username, "username")
}

pub fn new_form(command: List(String)) -> List(String) {
   ["--forms", ..command]
}

pub fn add_entry(command: List(String), entry: String) -> List(String) {
   add_opt(command, Some(entry), "add-entry")
}

pub fn add_password(command: List(String), password: String) -> List(String) {
   add_opt(command, Some(password), "add-password")
}

pub fn add_calendar(command: List(String), calendar: String) -> List(String) {
   add_opt(command, Some(calendar), "add-calendar")
}

pub fn add_combo_and_values(
   command: List(String),
   combo: String,
   values values: List(String),
) -> List(String) {
   command
   |> add_opt(Some(combo), "add-combo")
   |> add_opt(Some(string.join(values, "|")), "combo-values")
}

pub fn add_list_and_values(
   command: List(String),
   list_name: String,
   values values: List(String),
   column_values column_values: Option(List(String)),
) -> List(String) {
   command
   |> add_opt(Some(list_name), "add-list")
   |> add_opt(Some(string.join(values, "|")), "list-values")
   |> add_opt_list(column_values, "column-values")
}

pub fn set_separator(command: List(String), separator: String) -> List(String) {
   add_opt(command, Some(separator), "separator")
}

pub fn set_show_header(command: List(String), show_header: Bool) -> List(String) {
   add_bool(command, show_header, "show-header")
}

pub fn set_forms_date_format(command: List(String), format: String) -> List(String) {
   add_opt(command, Some(format), "forms-date-format")
}

pub fn add_value(cmd: List(String), value: String) -> List(String) {
   [value, ..cmd]
}

pub fn add_opt(cmd: List(String), opt: Option(String), str: String) -> List(String) {
   case opt {
      Some(val) -> ["--" <> str <> "=" <> val, ..cmd]
      None -> cmd
   }
}

pub fn add_opt_list(cmd: List(String), opt_list: Option(List(String)), str: String) -> List(String) {
   case opt_list {
      Some(val) -> ["--" <> str <> "=" <> string.join(val, "|"), ..cmd]
      None -> cmd
   }
}

pub fn add_bool(cmd: List(String), opt: Bool, str: String) -> List(String) {
   case opt {
      True -> ["--" <> str, ..cmd]
      False -> cmd
   }
}

pub fn parse(str: String) -> String {
   str
   |> string.trim_right
}

pub fn parse_list(str: String, separator: String) -> List(String) {
   str
   |> string.trim_right
   |> string.split(separator)
}

pub fn run(command: List(String), errors errors: Bool) -> Option(#(Int, String)) {
   let opts = case errors {
      True -> []
      False -> [shellout.LetBeStderr]
   }
   case list.reverse(command) {
      [cmd, ..with] ->
         case shellout.command(run: cmd, with: with, in: ".", opt: opts) {
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

pub fn exit(status: Int) -> Nil {
   shellout.exit(status)
}
