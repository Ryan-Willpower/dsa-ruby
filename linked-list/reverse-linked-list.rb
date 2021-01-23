class ListNode
  attr_reader :val
  attr_accessor :next

  def initialize(val, next_node = nil)
      @val = val
      @next = next_node
  end
end

# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  # 23 -> 6 -> 15 -> nil
  # 6 -> 23 -> 15 -> nil
  # 15 -> 6 -> 23 -> nil

  # first_node: 6 -> 15 -> nil
  first_node = head.next 

  # head: 23 -> 15 -> nil
  head.next = first_node.next

  # first_node: 6 -> 23 -> 15 -> nil
  first_node.next = head

  # second_node: 15 -> nil
  second_node = first_node.next.next

  # first_node: 6 -> 23 -> nil
  first_node.next.next = second_node.next

  # second_node: 15 -> 6 -> 23 -> nil
  second_node.next = first_node

  p second_node
end

head = ListNode.new(23, ListNode.new(6, ListNode.new(15)))

reverse_list(head)
