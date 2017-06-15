# Given a doubly linked list, like the one you built, reverse it.
# You can assume that this method is monkey patching the LinkedList class
# that you built, so any methods and instance variables in that class
# are available to you.

class LinkedList
  # ....

  def reverse
    each do |node|
      node.prev, node.next = node.next, node.prev
    end
  end
end
