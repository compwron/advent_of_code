# mjqjpqmgbljsphdztnvjfqwrcgsmlb
# After the first three characters (mjq) have been received,
# there haven't been enough characters received yet to find the marker.
# The first time a marker could occur is after the fourth character is received,
# making the most recent four characters mjqj. Because j is repeated, this isn't a marker.
#
# The first time a marker appears is after the seventh character arrives.
# Once it does, the last four characters received are jpqm, which are all different.
# In this case, your subroutine should report the value 7,
# because the first start-of-packet marker is complete after 7 characters have been processed.
#
# Here are a few more examples:
#
# bvwbjplbgvbhsrlpgdmjqwftvncz: first marker after character 5
# nppdvjthqldpwncqszvftbrmjlhg: first marker after character 6
# nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg: first marker after character 10
# zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw: first marker after character 11
# How many characters need to be processed before the first start-of-packet marker is detected?


# mjqjpqmgbljsphdztnvjfqwrcgsmlb: first marker after character 19
# bvwbjplbgvbhsrlpgdmjqwftvncz: first marker after character 23
# nppdvjthqldpwncqszvftbrmjlhg: first marker after character 23
# nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg: first marker after character 29
# zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw: first marker after character 26

input = "
mjqjpqmgbljsphdztnvjfqwrcgsmlb
bvwbjplbgvbhsrlpgdmjqwftvncz
nppdvjthqldpwncqszvftbrmjlhg
nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg
zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw
"

# input = "
# bvwbjplbgvbhsrlpgdmjqwftvncz"
require 'pry'

input = File.read("data-6.txt")

def last_4_uniq_index(chars)
  so_far = []
  chars.each_with_index.map { |c, i|
    so_far << c
    if so_far.last(14).uniq.count == 14
      return i + 1
    end
  }
  "none"
end

output = input.strip.split("\n").map do |line|
  chars = line.split("")
  last_4_uniq_index(chars)
end
p output


