require "imgurr"

class Imgur
  def self.upload(file)
    output = `imgurr upload #{file}`
    puts "#{output.split(" ")[1]}"
  end
end

