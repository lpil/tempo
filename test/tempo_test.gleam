import gleam/option.{None, Some}
import gleeunit
import gleeunit/should
import tempo
import tempo/date
import tempo/offset
import tempo/time

pub fn main() {
  gleeunit.main()
}

pub fn parse_any_all_test() {
  tempo.parse_any("2024/06/22 at 13:42:11.314 in +05:00")
  |> should.equal(
    Ok(#(
      Some(date.literal("2024-06-22")),
      Some(time.literal("13:42:11.314")),
      Some(offset.literal("+05:00")),
    )),
  )
}

pub fn parse_any_american_test() {
  tempo.parse_any("06/22/2024 at 1:42:11 PM in -04:00")
  |> should.equal(
    Ok(#(
      Some(date.literal("2024-06-22")),
      Some(time.literal("13:42:11")),
      Some(offset.literal("-04:00")),
    )),
  )
}

pub fn parse_any_date_test() {
  tempo.parse_any("2024/06/22")
  |> should.equal(Ok(#(Some(date.literal("2024-06-22")), None, None)))
}

pub fn parse_any_time_test() {
  tempo.parse_any("13:42:11")
  |> should.equal(Ok(#(None, Some(time.literal("13:42:11")), None)))
}

pub fn parse_any_time_am_test() {
  tempo.parse_any("1:42:11 AM")
  |> should.equal(Ok(#(None, Some(time.literal("01:42:11")), None)))
}

pub fn parse_any_time_pm_test() {
  tempo.parse_any("1:42:11 PM")
  |> should.equal(Ok(#(None, Some(time.literal("13:42:11")), None)))
}

pub fn parse_any_time_hour_min_test() {
  tempo.parse_any("01:42 PM")
  |> should.equal(Ok(#(None, Some(time.literal("13:42:00")), None)))
}

pub fn parse_any_offset_test() {
  tempo.parse_any("+05:00")
  |> should.equal(Ok(#(None, None, Some(offset.literal("+05:00")))))
}

pub fn parse_any_bad_test() {
  tempo.parse_any("20240422012333")
  |> should.be_error
}

pub fn parse_any_squished_test() {
  tempo.parse_any("20240622_134211")
  |> should.equal(
    Ok(#(Some(date.literal("2024-06-22")), Some(time.literal("13:42:11")), None)),
  )
}

pub fn parse_any_squished_american_test() {
  tempo.parse_any("06222024_134211")
  |> should.equal(
    Ok(#(Some(date.literal("2024-06-22")), Some(time.literal("13:42:11")), None)),
  )
}

pub fn parse_any_dots_test() {
  tempo.parse_any("2024.06.22")
  |> should.equal(Ok(#(Some(date.literal("2024.06.22")), None, None)))
}

pub fn parse_any_written_date_test() {
  tempo.parse_any("June 21, 2024")
  |> should.equal(Ok(#(Some(date.literal("2024-06-21")), None, None)))
}

pub fn parse_any_written_short_date_test() {
  tempo.parse_any("Dec 25, 2024 at 6:00 AM")
  |> should.equal(
    Ok(#(Some(date.literal("2024-12-25")), Some(time.literal("06:00:00")), None)),
  )
}