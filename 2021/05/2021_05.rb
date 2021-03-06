# = = = = = = =
# Accepted.
# Thanks God!
# = = = = = = =
class Solution
  def start1(arr)
    arr.map!(&:strip!)
    p "1================================"
    ans = "First 1\n"
    lines = convert_arr_to_lines(arr)
    @lines = lines
    check = check_lines_correctnes(arr,lines)
    mes = "Check correct convertions: #{check.inspect}. Sizes lines=#{lines.size}, arr=#{arr.size}\n"
    p mes
    ans += mes
    p find_first_mismatch(arr,lines)
    maxx,maxy = find_maxx_maxy(lines)
    ans += "maxx=#{maxx}, maxy=#{maxy}\n"
    @matrix = Array.new(maxy+1).map{ Array.new(maxx+1,0)}
    increase_v_and_h
    answer = @matrix.flatten.count{|x| x >= 2}
    mes = "Answer is: #{answer}\n"
    p mes
    ans += mes
    ans += str_mtrx
    
    return ans
  end
  def start2(arr)
    arr.map!(&:strip!)
    p "2================================"
    ans = "Second 2\n"
    lines = convert_arr_to_lines(arr)
    @lines = lines
    check = check_lines_correctnes(arr,lines)
    mes = "Check correct convertions: #{check.inspect}. Sizes lines=#{lines.size}, arr=#{arr.size}\n"
    p mes
    ans += mes
    p find_first_mismatch(arr,lines)
    maxx,maxy = find_maxx_maxy(lines)
    ans += "maxx=#{maxx}, maxy=#{maxy}\n"
    @matrix = Array.new(maxy+1).map{ Array.new(maxx+1,0)}
    increase_v_and_h
    increase_grow_diagonal
    increase_shrink_diagonal
    answer = @matrix.flatten.count{|x| x >= 2}
    mes = "Answer is: #{answer}\n"
    p mes
    ans += mes
    ans += str_mtrx
    
    return ans
  end
  def convert_lines_to_arr(lines)
    lines.map{|x| "#{x[0][0]},#{x[0][1]} -> #{x[1][0]},#{x[1][1]}"}
  end
  def check_lines_correctnes(arr,lines)
    arr.join("\n") == convert_lines_to_arr(lines).join("\n")
  end
  def find_first_mismatch(arr,lines)
    arr.zip(convert_lines_to_arr(lines)).find{|(x,y)| x != y}
  end
  def convert_arr_to_lines(arr)
    arr.map{|x|
      flat_line = x.gsub(/^(\d+),(\d+) -\> (\d+),(\d+)/,"\\1,\\2,\\3,\\4").split(?,).map(&:to_i)
      line = [[flat_line[0],flat_line[1]],[flat_line[2],flat_line[3]]]
    }
  end
  def find_maxx_maxy(lines)
    maxx = (lines.map{|x| x[0][0]} + lines.map{|x| x[1][0]}).max
    maxy = (lines.map{|x| x[0][1]} + lines.map{|x| x[1][1]}).max
    [maxx,maxy]
  end
  def increase_v_and_h
    @lines.each do |l|
      a,b = l[0], l[1]
      if a[0] == b[0]
        x = a[0]
        min,max = [a[1],b[1]].minmax
        (min..max).each{|y| @matrix[y][x] += 1 }
      end
      if a[1] == b[1]
        y = a[1]
        min,max = [a[0],b[0]].minmax
        (min..max).each{|x| @matrix[y][x] += 1 }
      end
    end
  end
  def increase_grow_diagonal
    @lines.each do |l|
      l = l.sort_by{|x| x[0]}
      a,b = l[0], l[1]
      next if a[0] == b[0] || a[1] == b[1]
      dx = b[0] - a[0]
      dy = b[1] - a[1] 
      next if dx != dy
      (dx+1).times do |i|
        @matrix[a[1]+i][a[0]+i] += 1
      end
    end
  end
  def increase_shrink_diagonal
    @lines.each do |l|
      l = l.sort_by{|x| x[0]}
      a,b = l[0], l[1]
      next if a[0] == b[0] || a[1] == b[1]
      dx = b[0] - a[0]
      dy = b[1] - a[1] 
      next if dx != -dy
      (dx+1).times do |i|
        @matrix[a[1]-i][a[0]+i] += 1
      end
    end
  end
  def str_mtrx
    x = @matrix.map{|row| row.map(&:to_s).map{|x| ?0 == x ? ?. : x}.join}
    x.join("\n")
  end
end

