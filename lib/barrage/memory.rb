require "gnuplot"
require_relative 'dstat'

class Memory
  def self.perform(file, plot)
    plot.title  "Memory Usage"
    plot.xlabel "time (seconds)"
    plot.ylabel "memory (megabytes)"

    parsed = Dstat.parse(file, 7)
    plot.data << Gnuplot::DataSet.new(parsed) do |ds|
      ds.title = "used"
      ds.with = "filledcurve linetype 7"
      ds.linewidth = 2
      ds.using = "1:(\$2 / 1024**2)"
    end

    parsed = Dstat.parse(file, 8)
    plot.data << Gnuplot::DataSet.new(parsed) do |ds|
      ds.title = "buffered"
      ds.with = "filledcurve linetype 3"
      ds.linewidth = 2
      ds.using = "1:(\$2 / 1024**2)"
    end

    parsed = Dstat.parse(file, 9)
    plot.data << Gnuplot::DataSet.new(parsed) do |ds|
      ds.title = "cached"
      ds.with = "filledcurve linetype 5"
      ds.linewidth = 2
      ds.using = "1:(\$2 / 1024**2)"
    end
  end
end
