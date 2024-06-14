import tempo/year
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn is_leap_year_test() {
  year.is_leap_year(1900) |> should.be_false()
  year.is_leap_year(1999) |> should.be_false()
  year.is_leap_year(2000) |> should.be_true()
  year.is_leap_year(2001) |> should.be_false()
  year.is_leap_year(2002) |> should.be_false()
  year.is_leap_year(2003) |> should.be_false()
  year.is_leap_year(2004) |> should.be_true()
  year.is_leap_year(2005) |> should.be_false()
  year.is_leap_year(2006) |> should.be_false()
  year.is_leap_year(2007) |> should.be_false()
  year.is_leap_year(2008) |> should.be_true()
  year.is_leap_year(2009) |> should.be_false()
  year.is_leap_year(2010) |> should.be_false()
  year.is_leap_year(2011) |> should.be_false()
  year.is_leap_year(2012) |> should.be_true()
  year.is_leap_year(2013) |> should.be_false()
  year.is_leap_year(2014) |> should.be_false()
  year.is_leap_year(2015) |> should.be_false()
  year.is_leap_year(2016) |> should.be_true()
  year.is_leap_year(2017) |> should.be_false()
  year.is_leap_year(2018) |> should.be_false()
  year.is_leap_year(2019) |> should.be_false()
  year.is_leap_year(2020) |> should.be_true()
  year.is_leap_year(2021) |> should.be_false()
  year.is_leap_year(2022) |> should.be_false()
  year.is_leap_year(2023) |> should.be_false()
  year.is_leap_year(2024) |> should.be_true()
  year.is_leap_year(2025) |> should.be_false()
  year.is_leap_year(2100) |> should.be_false()
  year.is_leap_year(2200) |> should.be_false()
  year.is_leap_year(2300) |> should.be_false()
  year.is_leap_year(2400) |> should.be_true()
}
