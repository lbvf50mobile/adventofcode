class Solution
  def start1(arr)
    @l = ""
    @matrix, @i_bound, @j_bound = nil, nil, nil
    set_input(arr)
    correct = check(arr)
    answer = 0
    l "Input parsed correctly: #{correct.inspect}"
    l "Size is: #{@i_bound+1}x#{@j_bound+1}"
    answer = task1_sum
    l_up "Answer is: #{answer}"
    l_up "First 1."
    return @l
  end
  def start2(arr)
    @l = ""
    l_up "Second 2."
    return @l
  end
  def l(str)
    @l += str + "\n"
  end
  def l_up(str)
    @l = str + "\n" + @l
  end
  def set_input(arr)
    @matrix = arr.map(&:strip).map{|x| x.chars.map(&:to_i)}
    @i_bound = @matrix.size - 1
    @j_bound = @matrix[0].size - 1
  end
  def check(arr)
    @matrix.map{|x| x.join}.join("\n") == arr.map(&:strip).join("\n")
  end
  def task1_sum
    sum = 0
    (0..@i_bound).each do |i|
      row = []
      minimums = []
      (0..@j_bound).each do |j|
        center = @matrix[i][j]
        row.push(center)
        center_is_minimum = true
        [[i+1,j],[i-1,j],[i,j+1],[i,j-1]].each do |(ii,jj)|
          next if !(ii.between?(0,@i_bound) && jj.between?(0,@j_bound))
          point = @matrix[ii][jj]
          center_is_minimum = false if point <= center 
        end
        sum += (center + 1) if center_is_minimum
        minimums.push(center) if center_is_minimum
      end
      l "#{row.join(?,)} => #{minimums.join(?,)}"
    end
    sum
  end
end


