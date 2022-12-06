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


#             [G] [W]         [Q]
# [Z]         [Q] [M]     [J] [F]
# [V]         [V] [S] [F] [N] [R]
# [T]         [F] [C] [H] [F] [W] [P]
# [B] [L]     [L] [J] [C] [V] [D] [V]
# [J] [V] [F] [N] [T] [T] [C] [Z] [W]
# [G] [R] [Q] [H] [Q] [W] [Z] [G] [B]
# [R] [J] [S] [Z] [R] [S] [D] [L] [J]
#  1   2   3   4   5   6   7   8   9

stacks = [
  [], # pretend to be 0-indexed thanks
  %w[r g j b t v z],
  %w[j r v l],
  %w[s q f],
  %w[z h n l f v q g],
  %w[r q t j c s m w],
  %w[s w t c h f],
  %w[d z c v f n j],
  %w[l g z d w r f q],
  %w[j b w v p],
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
