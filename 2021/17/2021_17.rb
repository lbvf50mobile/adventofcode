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
    @matrix, @i_bound, @j_bound = nil, nil, nil
    set_input(arr)
    correct = check(arr)
    answer = 0
    l "Input parsed correctly: #{correct.inspect}"
    l "Size is: #{@i_bound+1}x#{@j_bound+1}"
    @min_points = []
    store_min_points_coordinates
    l "There are #{@min_points.size} min points."
    @pools = []
    create_pools
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
  def create_pools
    @min_points.each do |point|
      create_pool(point)
    end
  end
  def create_pool(point)
    q = []
    create_new_used_map
    q.push(point)
    @used[point[0]][point[1]] = true
    sum = 0
    while ! q.empty?
      i,j = q.shift
      sum += 1
      cur = @matrix[i][j]
      [[i+1,j],[i-1,j],[i,j+1],[i,j-1]].each do |(ii,jj)|
        next if !(ii.between?(0,@i_bound) && jj.between?(0,@j_bound))
        next if @used[ii][jj]
        val = @matrix[ii][jj]
        next if 9 == val
        next if val <= cur
        @used[ii][jj] = true
        q.push([ii,jj])
      end
    end
    @pools.push(sum)
    l "Point #{point.inspect} pool size #{sum}"
  end
  def create_new_used_map
    @used = Array.new(@i_bound + 1).map{ Array.new(@j_bound+1, false)}
  end
  def store_min_points_coordinates
    (0..@i_bound).each do |i|
      (0..@j_bound).each do |j|
        center = @matrix[i][j]
        center_is_minimum = true
        [[i+1,j],[i-1,j],[i,j+1],[i,j-1]].each do |(ii,jj)|
          next if !(ii.between?(0,@i_bound) && jj.between?(0,@j_bound))
          point = @matrix[ii][jj]
          center_is_minimum = false if point <= center 
        end
        @min_points.push([i,j]) if center_is_minimum
      end
    end
  end
end


