require "gnuplot"
require_relative 'dstat'

class Network
  def self.perform(file, plot)
    plot.title  "Network throughput"
    plot.xlabel "time"
    plot.ylabel "throughput (mbps)"

    parsed = Dstat.parse(file, 16)
    plot.data << Gnuplot::DataSet.new(parsed) do |ds|
      ds.title = "received"
      ds.with = "filledcurve linetype 7"
      ds.linewidth = 2
      ds.using = "1:(\$2 / 125000)"
    end

    parsed = Dstat.parse(file, 17)
    plot.data << Gnuplot::DataSet.new(parsed) do |ds|
      ds.title = "sent"
      ds.with = "filledcurve linetype 3"
      ds.linewidth = 2
      ds.using = "1:(\$2 / 125000)"
    end
  end
end
