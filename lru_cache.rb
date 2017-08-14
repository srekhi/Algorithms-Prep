class Node
  def initialize
    @val = val
    @prev, @next = nil
  end

  def remove
    prev_node = node.prev
    next_node = node.next 
  end
end

class LRUCache
  def initialize(max)
    @store = LinkedList.new
    @lookup = Hash.new
    @max = max
    @count = 0
  end

  def get(key)
    node = @lookup[key]
    if node # then it exists in my linked List
      update!(node)
    else # we're going to add
      eject! if @count == @max
      @lookup[key] = node
    end
    node
  end

  def eject!
    node = @store.last
    node.remove!
  end
end
