# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative "bst_node"

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    if root.nil?
      @root = BSTNode.new(value)
    else
      insert_intermediate(value, @root)
    end
  end

  def insert_intermediate(value, root)
    if value < root.value
      if root.left.nil?
        root.left = BSTNode.new(value)
      else
        insert_intermediate(value, root.left)
      end
    elsif value >= root.value
      if root.right.nil?
        root.right = BSTNode.new(value)
      else
        insert_intermediate(value, root.right)
      end
    end
  end

  def find(value, tree_node = @root)
    if value == tree_node.value
      return tree_node
    elsif value < tree_node.value
      return nil if tree_node.left.nil?
      find(value, tree_node.left)
    elsif value >= tree_node.value
      return nil if tree_node.right.nil?
      find(value, tree_node.right)
    end
  end

  def delete(value)
    node = find(value, tree_node = @root)

    if node.left.nil? && node.right.nil?
      @root = nil if node.value == value
    end

  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    tree_node.right.nil? ? tree_node : maximum(tree_node.right)
  end

  def depth(tree_node = @root)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:

end
