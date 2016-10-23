class Node
   attr_accessor :left
   attr_accessor :right
   attr_accessor :father
   attr_accessor :code
   attr_reader :value
   def initialize value1,value2,value3,value4
     @value=value1
     @left=value2
     @right=value3
     @father=value4
   end
   def left=(left)
     @left=left
   end
   def right=(right)
     @right=right
   end
   def father=(father)
     @father=father
   end
end
class Huffman
  attr_accessor :array
  def initialize m
    @b=m.sort
    @array=Array.new
    @number=Array.new
   for i in 0..@b.length-1
     @array[i]=Node.new(@b[i],nil,nil,nil)
   end
   for i in 1..@array.length-1
      node=Node.new(@array[i-1].value+@array[i].value,@array[i-1],@array[i],nil)
      @array[i-1].father=node
      @array[i].father=node
      @array[i]=node
      @array.sort{|a,b| a.value<=>b.value}
   end
  end
  def transparent(node,value)
     if node.left!=nil
       transparent(node.left,value+"0")
     end
     if node.right!=nil
       transparent(node.right,value+"1")
     else
       puts node.value.to_s+":"+value
     end
  end
  def print
    node=@array[@array.length-1]
    transparent(node,"")
  end
end
class Test
  a=Huffman.new([9,2,3,5,6,13,45,23,1,7])
  a.print
end
