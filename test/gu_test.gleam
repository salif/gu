import gleeunit
import gleeunit/should
import gu

pub fn main() {
   gleeunit.main()
}

pub fn prefix_test() {
   gu.zenity
   |> gu.new_info()
   |> should.equal(["--info", "zenity"])
}

pub fn parse_test() {
   gu.do_parse("test\n")
   |> should.equal("test")
}

pub fn parse_space_test() {
   gu.do_parse(" test ")
   |> should.equal(" test ")
}

pub fn parse_space_test2() {
   gu.do_parse(" test \n")
   |> should.equal(" test ")
}
