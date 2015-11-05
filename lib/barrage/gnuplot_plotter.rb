require "gnuplot"
require "csv"

class GnuPlotPlotter
  def self.template(plot)
    plot.multiplot "layout 2,2"
    plot.object '1 rectangle from screen 0,0 to screen 3,3 fillcolor rgb"black" behind'
    plot.object '1 rect from graph 0, 0, 0 to graph 1, 1, 0'
    plot.object '1 behind lw 1.0 fc rgb "#000000" fillstyle solid 1.00 border lt -1'
    plot.key 'outside top center horizontal Right noreverse enhanced autotitles nobox'
    plot.key 'samplen 1 spacing 1.0 font "Verdana,16" textcolor rgb "#000000"'
    plot.style "fill transparent solid 0.2"
    plot.grid
  end

  def self.plot(csv_file, image_file)
    Gnuplot.open do |gp|
      Gnuplot::Plot.new(gp) do |plot|
        plot.term "png truecolor enhanced fontscale 1.0 size 1920, 1080 font 'Verdana,16'"
        plot.output image_file
        self.template(plot)
        CPU.perform(csv_file, plot)
      end

      Gnuplot::Plot.new(gp) do |plot|
        self.template(plot)
        Memory.perform(csv_file, plot)
      end

      Gnuplot::Plot.new(gp) do |plot|
        self.template(plot)
        Network.perform(csv_file, plot)
      end
    end
  end
end
