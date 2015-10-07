require "thor"
require "imgurr"
require_relative "dstat"
require_relative "gnuplot_plotter"

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

  desc "capture", "Capture dstat output"
  def capture
    @@unique_id = "#{Time.now.getutc.to_i}"
    @@dstat_file = "output/stats_#{@@unique_id}.csv"
    @@image_file = "output/results_#{@@unique_id}.png"

    @@dstat_pid = Dstat.run(@@dstat_file)
  end

  private

  def self.upload
    output = `imgurr upload #{@@image_file}`
    puts "#{output.split(" ")[1]}"
  end
end

