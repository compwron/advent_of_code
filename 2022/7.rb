require 'pry'

input = File.read("data-7.txt")
# To begin, find all of the directories with a total size of at most 100000, then calculate the sum of their total sizes.
# In the example above, these directories are a and e; the sum of their total sizes is 95437 (94853 + 584).
# (As in this example, this process can count files more than once!)
#
# Find all of the directories with a total size of at most 100000.
# What is the sum of the total sizes of those directories?

# tree = { "\\" => [{ "a" => [{ :filename => 1, :filesize => 11 }, { :filename => 2, :filesize => 22 }] }] }
tree = { "\\" => [] }
current_path = ["\\"]
input.strip.split("\n").each do |l|
  line = l.strip
  next if line == "$ cd /"
  next if line == "$ ls"
  current_dir = tree
  current_path.each do |cdx|
    if cdx == "\\"
      current_dir = current_dir[cdx]
    else
      current_dir = current_dir.find { |hash| hash.keys.first == cdx }[cdx]
    end
  end
  if line.include? "dir "
    dirname = line.split(" ")[1]
    current_dir << { dirname => [] }
  elsif line.include? "cd .."
    current_path.pop
  elsif line.include? "cd "
    next_dir = line.split(" ").last
    current_path << next_dir
  else
    filesize, filename = line.split(" ")
    current_dir << { filesize: filesize, filename: filename }
  end
end

sizes = Hash.new(0)

def foo(item, current_key = "", totals = Hash.new(0))
  # p "foo #{current_key}"
  # p totals
  # p item
  if item.class == Hash
    if item.has_key?(:filesize)
      totals[current_key] += item[:filesize].to_i
      totals
    else
      item.keys.each do |k|
        foo(item[k], current_key += k, totals)
      end
    end
  elsif item.class == Array
    item.each do |i2|
      foo(i2, current_key, totals)
    end
  end
  totals
end

result = tree.keys.map do |k|
  foo(tree[k])
end

p result
# [{"ae"=>584, "a"=>94269, ""=>23352670, "d"=>24933642}]


