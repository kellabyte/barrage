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

      if argv.size > 0 && argv[0] != "--help"
        if !Dir.exist?('output')
          Dir.mkdir 'output'
        end
      end
    end
  end
end

