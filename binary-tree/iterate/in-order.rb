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
def inorder_traversal(root)
  return [] if !root

  stack = []
  current = root
  data = []

  until !current and stack.size == 0 do
    if current
      stack.push(current)
      current = current.left
    else
      node = stack.pop()
      data.push(node.val)
      current = node.right
    end
  end

  return data
end