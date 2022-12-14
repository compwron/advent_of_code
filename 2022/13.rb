require 'pry'

input = File.read("data-13.txt")
#!/usr/bin/env ruby

require 'json'

def all_integers?(heads)
  heads.map(&:class).uniq == [Integer]
end

def compare(left, right)
  return if left.empty? && right.empty?
  return true if left.empty?
  return false if right.empty?

  heads = [left.first, right.first]

  if all_integers?(heads)
    return true if left.first < right.first
    return false if left.first > right.first
  else
    heads = heads.map { |i| i.is_a?(Integer) ? [i] : i } # bad to override content
    result = compare(heads[0], heads[1])
    return result if [true, false].include? result
  end

  compare(left.slice(1..), right.slice(1..))
end

puts File.read('data-13.txt').split("\n\n")
         .map { |i| i.split("\n") }
         .map { |i| i.map { |j| JSON.parse(j) } }
         .map.with_index(1) { |(l, r), i| compare(l, r) ? i : 0 }
         .sum

dividers = [2, 6].map { |i| [i] }
packets = [nil] + File.read('data-13.txt').split("\n\n")
                      .map { |i| i.gsub('[]', '[0]') }
                      .map { |i| i.split("\n") }
                      .map { |i| i.map { |j| JSON.parse(j) } }
                      .reduce([]) { |acc, (i, j)| acc << i << j }
                      .concat(dividers)
                      .sort_by(&:flatten)

puts dividers.map { |i| packets.index(i) }.reduce(:*)
