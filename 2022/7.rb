require 'pry'

input = File.read("data-7.txt")
# To begin, find all of the directories with a total size of at most 100000, then calculate the sum of their total sizes.
# In the example above, these directories are a and e; the sum of their total sizes is 95437 (94853 + 584).
# (As in this example, this process can count files more than once!)
#
# Find all of the directories with a total size of at most 100000. What is the sum of the total sizes of those directories?
# $ cd /
# $ ls
# dir a
# 14848514 b.txt
# 8504156 c.dat
# dir d
# $ cd a
# $ ls
# dir e
# 29116 f
# 2557 g
# 62596 h.lst
# $ cd e
# $ ls
# 584 i
# $ cd ..
# $ cd ..
# $ cd d
# $ ls
# 4060174 j
# 8033020 d.log
# 5626152 d.ext
# 7214296 k
# - / (dir)
#   - a (dir)
#     - e (dir)
#       - i (file, size=584)
#     - f (file, size=29116)
#     - g (file, size=2557)
#     - h.lst (file, size=62596)
#   - b.txt (file, size=14848514)
#   - c.dat (file, size=8504156)
#   - d (dir)
#     - j (file, size=4060174)
#     - d.log (file, size=8033020)
#     - d.ext (file, size=5626152)
#     - k (file, size=7214296)

# tree = { "\\" => [{ "a" => [{ :filename => 1, :filesize => 11 }, { :filename => 2, :filesize => 22 }] }] }
tree = { "\\" => [] }
current_path = ["\\"]
input.strip.split("\n").each do |l|
  line = l.strip
  p tree
  p line
  next if line == "$ cd /"
  next if line == "$ ls"
  current_dir = tree
  # if line == "dir e"
  #   binding.pry
  # end
  current_path.each do |cdx|
    if cdx == "\\"
      current_dir = current_dir[cdx]
    else
      current_dir = current_dir.find {|hash| hash.keys.first == cdx}[cdx]
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
p tree
