require 'pry'

input = File.read("data-14.txt")

resting_sand = "o"
rock = "#"
air = "."
sand_source = "+"

# Sand is produced one unit at a time, and the next unit of sand is not produced until the previous unit of sand comes to rest.
# A unit of sand is large enough to fill one tile of air in your scan.
#
# A unit of sand always falls down one step if possible. If the tile immediately below is blocked (by rock or sand),
# the unit of sand attempts to instead move diagonally one step down and to the left. If that tile is blocked,
# the unit of sand attempts to instead move diagonally one step down and to the right.
# Sand keeps moving as long as it is able to do so, at each step trying to move down, then down-left, then down-right.
# If all three possible destinations are blocked, the unit of sand comes to rest and no longer moves, at which point the next unit of sand is created back at the source.
#
# So, drawing sand that has come to rest as o, the first unit of sand simply falls straight down and then stops: