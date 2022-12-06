# The Elf finishes helping with the tent and sneaks back over to you. "Anyway, the second column says how the round needs to end: X means you need to lose, Y means you need to end the round in a draw, and Z means you need to win. Good luck!"
#
# The total score is still calculated in the same way, but now you need to figure out what shape to choose so the round ends as indicated. The example above now goes like this:
#
# In the first round, your opponent will choose Rock (A), and you need the round to end in a draw (Y), so you also choose Rock. This gives you a score of 1 + 3 = 4.
# In the second round, your opponent will choose Paper (B), and you choose Rock so you lose (X) with a score of 1 + 0 = 1.
# In the third round, you will defeat your opponent's Scissors with Rock for a score of 1 + 6 = 7.
# Now that you're correctly decrypting the ultra top secret strategy guide, you would get a total score of 12.
#
# Following the Elf's instructions for the second column, what would your total score be if everything goes exactly according to your strategy guide?
require 'pry'
input = File.read("data-2.txt")

win_guide = [
  {result: "draw", symbol: "Y"},
  {result: "human_lose", symbol: "X"},
]
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
