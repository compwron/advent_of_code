# The Elves just need to know which crate will end up on top of each stack; in this example, the top crates are C in stack 1, M in stack 2, and Z in stack 3, so you should combine these together and give the Elves the message CMZ.

#     [D]
# [N] [C]
# [Z] [M] [P]
#  1   2   3
#
# move 1 from 2 to 1
# move 3 from 1 to 3
# move 2 from 2 to 1
# move 1 from 1 to 2

stacks = [
  [], # pretend to be 0-indexed thanks
  %w[z n],
  %w[m c d],
  %w[p],
]

require 'pry'
input = File.read("data-5.txt")

results = input.strip.split("\n").each do |line|
  _, count, _, start_stack, _, end_stack = line.split(" ")
  (0...count.to_i).each do |i|
    item = stacks[start_stack.to_i].pop
    stacks[end_stack.to_i] << item
  end
end
p stacks
p stacks.compact.map(&:last).join("")
