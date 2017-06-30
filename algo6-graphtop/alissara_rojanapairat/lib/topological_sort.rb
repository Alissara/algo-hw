require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  queue = []

  vertices.each do |vertex|
    queue << vertex if vertex.in_edges.empty?
  end

  until queue.empty?
    current = queue.shift
    sorted << current

    current.out_edges.dup.each do |edge|
      next_vertex = edge.to_vertex
      edge.destroy!
      if next_vertex.in_edges.empty?
        queue << next_vertex
      end

    end
  end

  sorted.count == vertices.count ? sorted : []
end
