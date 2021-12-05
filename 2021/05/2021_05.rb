class Solution
  def start1(arr)
    p "1================================"
    ans = "First 1\n"
    lines = convert_arr_to_lines(arr)
    maxx,maxy = find_maxx_maxy(lines)
    ans += "maxx=#{maxx}, maxy=#{maxy}\n"
    @matrix = Array.new(maxy+1).map{ Array.new(maxx+1,0)}
    horizontal = select_horizontal(lines)
    mes = "Horizontal size: #{horizontal.size}, #{horizontal[0].inspect}\n"
    p mes
    ans += mes
    ans += string_lines(horizontal)
    draw_horizontal(horizontal)
    ans += string_matrix
    vertical = select_vertical(lines)
    p vertical.size
    draw_vertical(vertical)
    answer = count_cells_bigger_then_1
    p "Number of cells greater or equal to 2 is #{answer}"
    ans += "Number of cells greater or equal to 2 is #{answer}" 
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
    maxx, maxy = -1, -1
    lines.each do |line|
      maxx = line[0][0] if maxx < line[0][0]
      maxx = line[1][0] if maxx < line[1][0]
      maxy = line[0][1] if maxy < line[0][1]
      maxy = line[1][1] if maxy < line[1][1]
    end
    [maxx,maxy]
  end
  def select_horizontal(lines)
    lines.select{|x| x[0][1] == x[1][1]}
  end
  def select_vertical(lines)
    lines.select{|x| x[0][0] == x[1][0]}
  end
  def draw_horizontal(lines)
    lines.each do |line|
      raise "No horizontal." if line[0][1] != line[1][1]
      y = line[0][1]
      (line[0][0]..line[1][0]).each do |x|
        raise "No Y for y = #{y}, x = #{x} Horizontal" if ! @matrix[y]
        raise "No X for y = #{y}, x = #{x} Horizontal" if ! @matrix[y][x]
        @matrix[y][x] += 1
      end
    end
  end
  def draw_vertical(lines)
    lines.each do |line|
      x = line[0][0]
      (line[0][1]..line[1][1]).each do |y|
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

