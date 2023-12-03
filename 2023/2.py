input = open("input.txt", "r").read()
# print(input) 

maximums = {
  'red': 12,
  'green': 13,
  'blue': 14,
}
valid_game_ids = []

for line in input.splitlines():
  parts = line.split(": ")
  gameid = int(parts[0][5:])
  valid_game_ids.append(gameid)
  for group in parts[1].split('; '):
    for subgroup in group.split(', '):
      if gameid in valid_game_ids: 
        subparts = subgroup.split(' ')
        count = int(subparts[0])
        color = subparts[1]
        # for all max, if invalid remove gameid from valid list
        if (count > maximums[color]):
          valid_game_ids.remove(gameid)
answer = print(sum(valid_game_ids))



input = open("input.txt", "r").read()
# print(input) 

sum = 0

for line in input.splitlines():
  parts = line.split(": ")
  gameid = int(parts[0][5:])
  maximums = {}
  for group in parts[1].split('; '):
    for subgroup in group.split(', '):
      subparts = subgroup.split(' ')
      count = int(subparts[0])
      color = subparts[1]
      maxcolor = maximums.get(color, 0)
      if (count > maxcolor):
        maximums[color] = count
  power = maximums.get('red', 0) * maximums.get('blue', 0) * maximums.get('green', 0)
  sum += power
answer = print(sum)