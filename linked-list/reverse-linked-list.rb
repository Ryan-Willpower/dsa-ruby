# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  return head if !head or !head.next

  prev = nil
  current = head
  next_node = head.next

  until !next_node do
    current.next = prev

    prev = current
    current = next_node
    next_node = current.next
  end

  current.next = prev

  return current
end