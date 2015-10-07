require "gnuplot"
require "csv"

class GnuPlotPlotter
  def self.template(plot)
    plot.multiplot "layout 4,2"
    plot.object '1 rectangle from screen 0,0 to screen 3,3 fillcolor rgb"black" behind'
    plot.object '1 rect from graph 0, 0, 0 to graph 1, 1, 0'
    plot.object '1 behind lw 1.0 fc rgb "#000000" fillstyle solid 1.00 border lt -1'
    plot.key 'inside top left vertical Right noreverse enhanced autotitles nobox'
    plot.key 'samplen 1 spacing 1.0 font "Verdana,16" textcolor rgb "#FFFFFF"'
    plot.style "fill transparent solid 0.2"
    plot.grid
  end

  def self.plot(csv_file, image_file)
    Gnuplot.open do |gp|
      Gnuplot::Plot.new(gp) do |plot|
        plot.term "png truecolor enhanced fontscale 1.0 size 1920, 1080 font 'Verdana,16'"
        plot.output image_file
        self.template(plot)

        plot.origin '0.0,0.5'
        plot.size '0.5,0.5'

        CPU.perform(csv_file, plot)
      end

      Gnuplot::Plot.new(gp) do |plot|
        self.template(plot)

        plot.origin '0.5,0.5'
        plot.size '0.5,0.5'

        Memory.perform(csv_file, plot)
      end

      Gnuplot::Plot.new(gp) do |plot|
        self.template(plot)

        plot.origin "0.0,0.0"
        plot.size "0.5,0.5"

        Network.perform(csv_file, plot)
      end
    end
  end
end
