class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val= 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# 1) Create an empty stack nodeStack and push root node to stack. 
# 2) Do following while nodeStack is not empty. 
# ….a) Pop an item from stack and print it. 
# ….b) Push right child of popped item to stack 
# ….c) Push left child of popped item to stack

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