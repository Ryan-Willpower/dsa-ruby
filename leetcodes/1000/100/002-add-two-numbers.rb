# https://leetcode.com/problems/add-two-numbers

class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  n1 = travel_through_node(l1)
  n2 = travel_through_node(l2)

  return convert_number_to_node(n1 + n2)
end

# @param {ListNode} node
# @return {number}
def travel_through_node(node)
  result_stack = []
  current = node

  while current do
    result_stack.push(current.val)
    current = current.next ? current.next : nil
  end

  result = 0
  index = result_stack.size - 1

  until result_stack.empty? do
    num = result_stack.pop

    result += (num * (10 ** index))

    index -= 1
  end

  return result
end

# @param {number} node
# @return {ListNode}
def convert_number_to_node(num)
  return ListNode.new(num) if num == 0

  stack_result = []
  current = num
  index = 1

  until current == 0 do
    split_number = current % (10 ** index)

    stack_result.push(split_number / (10 ** (index - 1)))

    current -= split_number
    index += 1
  end

  node = nil

  stack_result.each do |n|
    current = node

    if node
      until current.next == nil do
          current = current.next
      end

      current.next = ListNode.new n
    else
      node = ListNode.new n
    end
  end

  return node
end
