class MyLinkedList

=begin
    Initialize your data structure here.
=end
  def initialize()
      @head = nil
  end


=begin
    Get the value of the index-th node in the linked list. If the index is invalid, return -1.
    :type index: Integer
    :rtype: Integer
=end
  def get(index)
    n = 0
    node = @head

    until n == index do
      return -1 if node.next == nil

      node = node.next

      n += 1     
    end

    return node.val
  end


=begin
    Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
    :type val: Integer
    :rtype: Void
=end
  def add_at_head(val)
    if !@head
      @head = Node.new(val)
    else
      new_head = Node.new(val,@head)
      @head = new_head
    end
  end


=begin
    Append a node of value val to the last element of the linked list.
    :type val: Integer
    :rtype: Void
=end
  def add_at_tail(val)
    if @head == nil
      add_at_head(val)
      
      return
    end

    node = @head

    until node.next == nil do
      node = node.next
    end

    node.next = Node.new(val)
  end


=begin
    Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted.
    :type index: Integer
    :type val: Integer
    :rtype: Void
=end
  def add_at_index(index, val)
    return if index > size()
      
    if !@head || index == 0
      add_at_head(val)

      return
    end

    if index == size()
      add_at_tail(val)

      return
    end

    n = 0
    node = @head 

    until (n + 1) == index do
      return if node.next == nil && (n + 1) < index

      node = node.next

      n += 1
    end

    old_node = node.next

    node.next = Node.new(val, old_node)
  end


=begin
    Delete the index-th node in the linked list, if the index is valid.
    :type index: Integer
    :rtype: Void
=end
  def delete_at_index(index)
    return if index > (size() - 1)

    if index == 0
      @head = @head.next

      return
    end

    n = 0
    node = @head

    until (n + 1) == index do
      return if node.next == nil && (n + 1) < index

      node = node.next

      n += 1
    end

    node_to_delete = node.next
    next_node_after_del_node = node_to_delete.next
    node.next = next_node_after_del_node
  end

  def size()
    return 0 if !@head

    n = 1
    node = @head
    
    until !node.next do
      n += 1
      node = node.next 
    end

    return n
  end

end

class Node
  attr_reader :val
  attr_accessor :next

  def initialize(val, next_node = nil)
      @val = val
      @next = next_node
  end
end