# 1. Push root to first stack.
# 2. Loop while first stack is not empty
#    2.1 Pop a node from first stack and push it to second stack
#    2.2 Push left and right children of the popped node to first stack
# 3. Print contents of second stack
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[]}
def postorder_traversal(root)
  return [] if !root

  first_stack = [root]
  second_stack = []
  data = []

  until first_stack.empty? do
    node = first_stack.pop

    second_stack.push(node)

    if node.left
      first_stack.push(node.left)
    end
    
    if node.right
      first_stack.push(node.right)
    end
  end

  until second_stack.empty? do
    node = second_stack.pop
    data.push(node.val)
  end

  return data
end