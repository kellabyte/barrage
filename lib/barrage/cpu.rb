require "gnuplot"
require_relative 'dstat'

class CPU
  def self.perform(file, plot)
    plot.title  "CPU Usage"
    plot.xlabel "time (seconds)"
    plot.ylabel "percent"
    #plot.yrange "[0:100]"
    plot.pointsize "0.5"

    parsed = Dstat.parse(file, 1)
    plot.data << Gnuplot::DataSet.new(parsed) do |ds|
      ds.title = "usr"
      ds.with = "filledcurve linetype 7"
      ds.linewidth = 2
    end

    parsed = Dstat.parse(file, 2)
    plot.data << Gnuplot::DataSet.new(parsed) do |ds|
      ds.title = "sys"
      ds.with = "filledcurve linetype 3"
      ds.linewidth = 2
    end

    parsed = Dstat.parse(file, 4)
    plot.data << Gnuplot::DataSet.new(parsed) do |ds|
      ds.title = "iowait"
      ds.with = "filledcurve linetype 5"
      ds.linewidth = 2
    end
  end
end
