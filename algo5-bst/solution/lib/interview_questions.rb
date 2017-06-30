# Post Order Traversal (Left, Right, Root):
  def post_order_traversal(tree_node = @root, arr = [])

    if tree_node.left
      post_order_traversal(tree_node.left, arr)
    end

    if tree_node.right
      post_order_traversal(tree_node.right, arr)
    end

    arr.push(tree_node.value)

    arr
  end

# Pre Order Traversal (Root, Left, Right):
  def pre_order_traversal(tree_node = @root, arr = [])
  end

# In Order Iterative:
# 1. Create an empty stack
# 2. Initialize current node as root
# 3. Push the current into the stack, and set current as current.left
#    until current is null;
# 4. If current is null and stack isn't empty
#    1. Pop top item from stack and print
#    2. Set current to popped item.right
#    3. Go back to step 3
# 5. If current is null and stack is empty then we are done

  def in_order_iterative(tree_node = @root, arr = [])
    current = tree_node
    arr << current
    current = current.left
    until current.nil?
      arr << current
      current = current.left
    end

    if current.nil? && !arr.empty?
      print arr.pop
      current =
  end

# LCA:
# In a binary search tree, an *ancestor* of a `example_node` is a node
# that is on a higher level than `example_node`, and can be traced directly
# back to `example_node` without going up any levels. (I.e., this is
# intuitively what you think an ancestor should be.) Every node in a binary
# tree shares at least one ancestor -- the root. In this exercise, write a
# function that takes in a BST and two nodes, and returns the node that is the
# lowest common ancestor of the given nodes. Assume no duplicate values.
