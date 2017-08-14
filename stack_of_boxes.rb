=begin
  - Recursive relationship is:
    - let's sort across one dimension (let's pick height)
    - take the tallest one out of consideration + generate the tallest possible stack for
      the the N-1 boxes
    - if the tallest box is bigger across all three dimensions, add it and return
  - so what does this look like in practice?
=end

def stack_of_boxes(stack)
  stack.sort!(&:height) # assuming box is an object with a height attr_reader
  tallest_box = stack.pop

  tallest_stack = stack_of_boxes(stack)

  if bigger_than?(tallest_box, stack.last)
    return tallest_stack << tallest_box
  else
    tallest_stack
  end
end
