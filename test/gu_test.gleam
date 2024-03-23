import gu
import gleeunit
import gleeunit/should

pub fn main() {
   gleeunit.main()
}

pub fn prefix_test() {
   gu.zenity
   |> gu.new_info()
   |> should.equal(["--info", "zenity"])
}

pub fn parse_test() {
   gu.parse("test\n")
   |> should.equal("test")
}

pub fn parse_space_test() {
   gu.parse("test \n")
   |> should.equal("test")
}

pub fn parse_list_test() {
   gu.parse_list("a||c", "|")
   |> should.equal(["a", "", "c"])
}
