class Solution
  def start1(arr)
    p "1================================"
    ans = "First 1\n"
    lines = convert_arr_to_lines(arr)
    maxx,maxy = find_maxx_maxy(lines)
    ans += "maxx=#{maxx}, maxy=#{maxy}\n"
    @matrix = Array.new(maxy+1).map{ Array.new(maxx+1,0)}
    ans += string_lines(lines)
    horizontal = select_horizontal(lines)
    mes = "Horizontal size: #{horizontal.size}, #{horizontal[0].inspect}\n"
    p mes
    ans += mes
    ans += string_lines(horizontal)
    draw_horizontal(horizontal)
    ans += string_matrix
    vertical = select_vertical(lines)
    mes = "Vertical size: #{vertical.size}, #{vertical[0].inspect}\n"
    p mes
    ans += mes
    draw_vertical(vertical)
    ans += string_lines(vertical)
    ans += string_matrix
    answer = count_cells_bigger_then_1
    p "Number of cells greater or equal to 2 is #{answer}"
    ans = "Number of cells greater or equal to 2 is #{answer}\n"  + ans
    return ans
  end
  def start2(arr)
    return "Second 2\n"
  end
  def convert_arr_to_lines(arr)
    arr.map{|x|
      flat_line = x.gsub(/^(\d+).+(\d+).+(\d+)+.(\d+)/,"\\1,\\2,\\3,\\4").split(?,).map(&:to_i)
      line = [[flat_line[0],flat_line[1]],[flat_line[2],flat_line[3]]]
    }
  end
  def find_maxx_maxy(lines)
    maxx = (lines.map{|x| x[0][0]} + lines.map{|x| x[1][0]}).max
    maxy = (lines.map{|x| x[0][1]} + lines.map{|x| x[1][1]}).max

    [maxx,maxy]
  end
  def select_horizontal(lines)
    lines.select{|x| x[0][1] == x[1][1]}
  end
  def select_vertical(lines)
    lines.select{|x| x[0][0] == x[1][0]}
  end
  def draw_horizontal(lines)
    # p "I am draw horizontal and I draw #{lines.size} lines."
    counter = 0
    dots = 0
    lines.each_with_index do |line,index|
      raise "No horizontal." if line[0][1] != line[1][1]
      y = line[0][1]
      counter += 1
      # p "Draw #{line.inspect} y = #{y} and #{[line[0][0],line[1][0]].inspect}."
      min,max = [line[0][0],line[1][0]].minmax
      (min..max).each do |x|
        raise "No Y for y = #{y}, x = #{x} Horizontal" if ! @matrix[y]
        raise "No X for y = #{y}, x = #{x} Horizontal" if ! @matrix[y][x]
        @matrix[y][x] += 1
        dots += 1
      end
    end
    # p "Was drawn #{counter} lines. And #{dots} cells."
  end
  def draw_vertical(lines)
    # p "I am draw vertical and I draw #{lines.size} lines."
    lines.each do |line|
      x = line[0][0]
      min,max = [line[0][1],line[1][1]].minmax
      (min..max).each do |y|
        @matrix[y][x] += 1
      end
    end
  end
  def count_cells_bigger_then_1
    @matrix.flatten.select{|x| x > 1}.size
  end
  def string_lines(lines)
    ans = ""
    lines.each_with_index do |line,i|
      ans += "#{i+1} " + line.inspect + "\n"
    end
    ans
  end
  def string_matrix
    @matrix.map{|x| x.join(?,)}.join("\n") + "\n"
  end
end

