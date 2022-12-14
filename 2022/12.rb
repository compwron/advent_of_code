# oy
# Sabqponm
# abcryxxl
# accszExk
# acctuvwj
# abdefghi
require 'pry'

input = File.read("data-12.txt").strip.split("\n")

data = input.map do |line|
  line.split("")
end

# binding.pry

p data
