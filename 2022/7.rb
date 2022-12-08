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
binding.pry
p tree
# binding.pry
bigs = []

# def sum_r(dir, dir_sums = {})
#   p "sum_r"
#   dir.each do |sub_d|
#     p [sub_d.class]
#     if sub_d.class == Array
#       p "arr"
#       sum_r(sub_d)
#     elsif sub_d.class == Hash
#       if sub_d.has_key?(:filesize)
#         p sub_d
#         dir_sums[sub_d] ||= 0
#         dir_sums[sub_d] += sub_d[:filesize].to_i
#       else
#         sub_d.values.each { |ss|
#           sum_r(ss)
#         }
#       end
#     end
#   end
#   dir_sums
# end
#
# p sum_r(tree)

# for every key in the tree,

# binding.pry
#
# def sum_r(x)
#   return x.first if x.length == 1 && x.first.first != "\\"
#   return 0 if x.length < 1
#
#   x.to_a.pop + sum_r(x.to_a)
# end
# sum_r(tree)
#
#
# p tree.to_a.flatten
#   .map { |f|
#     f.class == Hash && f.has_key?(:filesize) ? f[:filesize] : 0
#   }
#   .inject(:+)




