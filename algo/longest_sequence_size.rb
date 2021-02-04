#จงเขียนฟังก์ชันที่รับพารามิเตอร์เป็นอะเรย์ของตัวเลขที่ไม่เรียงลำดับ แล้วรีเทิร์นค่าความยาวของลำดับของตัวเลขที่ติดกันที่ค่าเพิ่มขึ้นที่ยาวที่สุด 
# ตััวอย่าง 
# {1,30,6,2,4,100,130,50,70,20} 
# ลำดับของตัวเลขที่ติดกันที่ค่าเพิ่มขึ้นที่ยาวที่สุดคือ 2,4,100,130  ดังนั้นผลลัพท์ของฟังก์ชันคือ 4 

def get_longest_positive_sequence(num)
  result_sequence = []
  sequence = []

  num.each_with_index do |n, i|
    if sequence.empty?
      sequence.push n
      next
    end

    # if this n more than last, push
    if sequence.last < n
      sequence.push n
    else
      # if result size less than current size, replace
      # else, reset current
      if result_sequence.size < sequence.size
        result_sequence = sequence
      end

      sequence = [n]
    end
  end

  p result_sequence.size
end
