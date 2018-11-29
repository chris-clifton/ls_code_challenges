#require 'date'

class Meetup
  def day(weekday, schedule)
    working_date = Date.new(@date.year, @date.month, FIRST_DAY[schedule])
    working_date += 1 until working_date.__send__("#{weekday}?")
    @date = working_date
  end

private
  FIRST_DAY = {
    first:  1,
    second: 8,
    third:  15,
    fourth: 22,
    last:   -7,
    teenth: 13
  }

  def initialize(month, year)
    @date = Date.new(year, month, 1)
  end
end