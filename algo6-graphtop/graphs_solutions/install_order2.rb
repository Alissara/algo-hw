# In this version of the problem, all packages will be listed, including
# independent ones (independant packages have nil or no value for their
# dependencies), but the package ids may not be numbers.

require_relative 'graph'
require_relative 'topological_sort'

def install_order2(arr)
  vertices = {}

  arr.each do |sub|
    vertices[sub[0]] = Vertex.new(sub[0]) unless vertices[sub[0]]
    vertices[sub[1]] = Vertex.new(sub[1]) unless vertices[sub[1]] && vertices[sub[1]].nil?
    Edge.new(vertices[sub[1]], vertices[sub[0]]) unless vertices[sub[1]].nil?


  end

  topological_sort(vertices.values).map { |v| v.value }

end

arr = [[3, 1], [2, 1], [6, 5], [3, 6], [3, 2], [4, 3], [9, 1], [1, nil], [5, nil]]
arr2 = [['a', 'b'], ['c', 'b'], ['d', 'a'], ['b'], ['e', 'd']]

p install_order2(arr) #== [1, 5, 2, 9, 6, 3, 4]
p install_order2(arr2)
