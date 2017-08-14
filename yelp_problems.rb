require 'byebug'
def spiral(n) # this is the boundary of the matrix, and it's size is n ^ 2
  backwards = false
  start = 0
  loop do
      if backwards
        start.downto(start - n + 1).each do |num|
          puts num
        end
        start += 1
      else
        start.upto(start + n - 1).each do |num|
          puts num
        end
        start += n - 1
      end
      break if start >= n**2
      backwards = !backwards
    end
end

# spiral(3)
# if n = 3
# (0, 1, 2)
# (3, 4, 5)
# (6, 7, 8)

# in other words, boundary when (n + 1) % 3 == 0
#=========================================================================
def contig_subarrs_that_sum_to_k(k, arr) # so this problem worked with contiguous subarrays that sum to a value k
  # for example, arr[j] - arr[i] vs. arr[j]
  # if you do a running sum, any difference that equals k is what we're looking for.
  # then we can increment a counter, we can save j - i for a max size, or we can even grab the subarray.
  running_sum = 0
  arr.each_with_index do |el, index|
  end
end
#=========================================================================
def subset_sum(arr, k)
  memo = Array.new(arr.length) { Array.new(k) } # memo[index][k]
  subset_sum_helper(arr, k, 0)
  # take the element as a potential value as one function
  # take element as another func
end

def subset_sum_helper(arr, k, index)
  return true if k == 0
  return false if index >= arr.length
  # memoize the combination of k's and index -- try bottom up

  memo = Array.new(arr.length) { Array.new(k) }

  # bottom up fashion:

  subset_sum_helper(arr, k - arr[index], index + 1) || # 2 ^ n --> exponential
  subset_sum_helper(arr, k, index + 1)
end

p subset_sum([34, 34, 54, 124, 64, 24], 9)

#=========================================================================
# CONTINUE THIS GUY
# # # # # # # # ##  # # # # # # # # # # # # # # # #
# Given a number and a list of numbers, write a program that gives the total
# number of times the numbers in the list sum to the given number.
# Numbers in the list can be repeated.
# if arr = [1,2,3] and k = 3, then we can do 1, 1, 1, or 3. that's easy with recursion
def count_num_times(arr, k)
  # base case:
  return 0 if arr.empty?

  count_num_times(arr, k - arr.first) +
  count_num_times(arr.shift, k)
end
#####################
class Node
  def initialize
    @store = {}
  end
end
class Trie

end


#=========================================================================

# create a BST and write a function to find the second largest element in the tree
class BST
  def initialize
    @root = TreeNode.new
  end

  def insert(val)
    @root = insert!(@root, val)
  end

  def insert!(node, val)
    return Node.new(val) if node.nil?
    if val > @root.val
      @root.right = insert!(root.right, val)
    else # <=
      @root.left = insert!(root.left, val)
    end
  end

  def delete(val)
    # find the value and delete it
    # if not there, we'll raise an error
      @root = delete!(@root, val)
  end

  def delete!(node, val)
    raise "Value not found" if node.nil?
    if node.val > val
      node.left = delete!(node.left, val) # val will be on left of curr node
    elsif val > node.val
      node.right = delete!(node.right, val)
    else # node.val == val
      # find the largest in the left subtree or smallest in the right subtree and promote
      return node.left if node.right.nil?
      return node.right if node.left.nil?

      #if we get here, then node has both children
      replacement = find_max(node.left)
      replacement.left = delete(node.left, replacement.val)
      node = replacement
    end
    node
  end

  def second_largest
    s = []
    node = @root
    until node.nil?
      s << node
      node = node.right
    end
    if node.left
      find_max(node.left)
    else
      s[-2]
    end
  end
end

#=========================================================================
# LRU Cache
class LRUCache
  def initialize(max, prc )
    @map = {}
    @max = max
    @store = LinkedList.new
    @count = 0
    @prc = prc
  end
  def get(key)
    node = @map[key]
    if node
      update!(node)
    else
      eject! if @count == max
      add(key)
    end
  end

  private

  def eject!
    # remove head
  end

  def add(key)
    @store.append(key)
  end
end
#=========================================================================
# Trie implementation
#=========================================================================
class Trie

  def initialize
    @root = Node.new # dummy sentinel
  end

  def insert(word)
    insert!(word, index)
  end

  private
  def insert!(word, index)
    node = @root
    loop do
      if node[word[index]]
        node = node[word[index]]
      else
        node[word[index]] = Node.new()
    end
  end
end

#=========================================================================
# Heap implementation
#=========================================================================
class Heap
  def initialize

  end
end
#=========================================================================
# TOPOLOGICAL SORT WITHOUT BUILDING GRAPH implementation
# https://leetcode.com/problems/course-schedule/discuss/
#=========================================================================

#=========================================================================
# FIND TARGET ARRAY IN A MATRIX WITH SORTED ROW AND COLS
def find_sorted(arr, val)

end

arr = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]
p find_sorted(arr, val)
#=========================================================================
# BUILD A BST
class BST
  def initialize(val)
    @root = Node.new(val)
  end
  def insert(val)
    @root = insert!(@root, val)
  end

  def insert!(node, val)
    return Node.new(val) if node.nil?
    if val > node.val
      node.right = insert!(node.right, val)
    else #val <= node.val
      node.left = insert!(node.left, val)
    end
    node # want to return the tree back up at every step. 
  end

  def delete(val)
    @root = delete!(@root, val)
  end

  def delete!(node, val)
    if val > node.val
      node.right = delete!(node.right, val)
    elsif val < node.val
      node.left = delete!(node.left, val)
    else # equal, so delete this vlaue
      return node.left if node.right.nil?
      return node.right if node.left.nil?
      # both children are present...
      # find min on left subtree and promote
      left_min_node = find_min(node.left)
      left_min_node.left = delete!(left_min, left_min.val )
      node = left_min_node
    end
    node # at eevery step of the eway
  end
end
