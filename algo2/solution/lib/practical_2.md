## Problem
This is a two part problem:
1. First, write a series of instructions on how to build out an LRU Cache (pretend
the person you're writing to has no idea how to build one. Don't forget to address
the reasoning behind using particular data structures).
2. Implement an LRU Cache from scratch with no outside references. **Don't look
at the code or instructions from your homework!**

## Solution

### Part 1
Write first part here:
1. An LRU Cache stores the most recently used items up to a certain max amount
2. when you retrieve or insert an item, the item is the most recently used and should to the end
3. Use a hash map and a linked list.
4. the hash map holds keys and it points to a node holding a value
5. if you insert something and it exceeds the max size, you need to eject the oldest node
5. The HashMap is an array of keys, which points to nodes. The nodes hold keys and values and the nodes are part of a linked-list, which will track the order of the most recently retrieved item.
6. When you insert an item to the cache, you check to see if it's already included. If it is already in the cache, you remove it from the linked-list and append that node to the end. If it's not included, just append to the end.
7. If you append the node to the linked list and it exceeds the max capacity of the Cache, remove the oldest node from the linked list and remove the key from the HashMap.


### Part 2
```ruby
class LRUCache
  initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end


end
```
