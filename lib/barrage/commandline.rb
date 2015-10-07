require "thor"
require "imgurr"
require_relative "dstat"
require_relative "gnuplot_plotter"
require_relative "imgur"

class Commandline < Thor
  @@dstat_pid = 0
  def self.dstat_pid
    @@dstat_pid
  end
  @@unique_id = ""
  def self.unique_id
    @@unique_id
  end

  @@dstat_file = ""
  def self.dstat_file
    @@dstat_file
  end

  @@image_file = ""
  def self.image_file
    @@image_file
  end

  desc "capture", "Capture and plot dstat output"
  def capture
    @@unique_id = "#{Time.now.getutc.to_i}"
    @@dstat_file = "output/stats_#{@@unique_id}.csv"
    @@image_file = "output/results_#{@@unique_id}.png"

    @@dstat_pid = Dstat.run(@@dstat_file)
    puts "\nPress CTRL-C to exit\n\n"
    trap("INT") { Commandline.kill(@@dstat_pid) }
    $stdin.read
  end

  desc "plot [FILE]", "Plot graphs from dstat [FILE]"
  def plot(file)
    @@dstat_file = file
    @@image_file = "#{File.dirname(file)}/#{File.basename(file,'.*')}.png"
    Commandline.plot
    Commandline.upload
  end

  private

  def self.plot
    puts "Plotting..."
    GnuPlotPlotter.plot(Commandline.dstat_file, Commandline.image_file)
  end

  def self.upload
    puts "Uploading..."
    Imgur.upload(@@image_file)
  end

  def self.kill(pid)
    if pid > 0
      Process.kill "QUIT", pid
    end

    plot
    upload
    exit(0)
  end
end

