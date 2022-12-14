require 'pry'

input = File.read("data-13.txt")


def compare(left, right)
  if left.is_a?(Integer) && right.is_a?(Integer)
    if left < right
      return :ok
    elsif left > right
      return :wrong
    else
      return :continue
    end
  elsif left.is_a?(Array) && right.is_a?(Array)
    return :wrong if right.count < left.count
    left.each_with_index.map do |l, l_idx|
      result = compare(l, right[l_idx])
      return :wrong if result == :wrong
    end
  elsif left.is_a?(Integer) && right.is_a?(Array)
    return :wrong if right.count < [left].count
    [left].each_with_index.map do |l, l_idx|
      result = compare(l, right[l_idx])
      return :wrong if result == :wrong
    end
  else
    :continue
  end
end

result = input.split("\n").each_slice(3).to_a.map do |three|
  left = eval(three[0])
  right = eval(three[1])
  p [left, right, compare(left, right)]
  compare(left, right)
end