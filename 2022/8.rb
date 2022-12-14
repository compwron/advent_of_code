require 'pry'

input = File.read("data-8.txt").strip.split("\n")

data = input.map do |line|
  line.split("")
end

binding.pry

data
