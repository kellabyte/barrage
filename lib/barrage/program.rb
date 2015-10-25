require "thor"
require_relative "commandline"
require_relative "gnuplot_plotter"
require_relative "cpu"
require_relative "memory"
require_relative "network"

module Barrage
  class Program
    def self.run(argv)
      Commandline.start(argv)

      if argv.size > 0 && argv.first != "--help"
        Dir.mkdir 'output' unless Dir.exist?('output')

        $stdin.read unless argv.first == "plot" || argv.first == "benchmark"
      end
    end
  end
end
