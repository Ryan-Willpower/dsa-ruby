class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val= 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# @param {TreeNode} root
# @return {Integer[]}
def preorder_traversal(root)
  return [] if !root

  stack = []
  stack.push(root)

  data = []

  while stack.size > 0 do
    node = stack.pop()

    data.push(node.val)

    if node.right
      stack.push(node.right)
    end

    if node.left
      stack.push(node.left)
    end
  end

  return data
end