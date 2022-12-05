# A, X rock
# In the first round, your opponent will choose Rock (A), and you should choose Paper (Y). This ends in a win for you with a score of 8 (2 because you chose Paper + 6 because you won).
# In the second round, your opponent will choose Paper (B), and you should choose Rock (X). This ends in a loss for you with a score of 1 (1 + 0).
# The third round is a draw with both players choosing Scissors, giving you a score of 3 + 3 = 6.
require 'pry'
input = File.read("data-2.txt")

guides = [
  { name: "rock", symbols: ["X", "A"], beats: "scissors", points: 1 },
  { name: "scissors", symbols: ["C", "Z"], beats: "paper", points: 3 },
  { name: "paper", symbols: ["B", "Y"], beats: "rock", points: 2 },
]
data = input.split("\n").map { |line|
  k, v = line.split(" ")
  { k => v }
}.compact

def points_from_win(elf_choice, human_choice)
  if human_choice[:beats] == elf_choice[:name]
    6
  elsif human_choice[:name] == elf_choice[:name]
    3
  else
    0
  end
end

result = data.map do |datum|
  elf = datum.first.first
  human = datum.first.last
  elf_choice = guides.find { |guide| guide[:symbols].include?(elf) }
  human_choice = guides.find { |guide| guide[:symbols].include?(human) }
  human_choice[:points] + points_from_win(elf_choice, human_choice)
end
p result.sum
