class Solution
  def start1(arr)
    @l = ""
    input arr
    correct = check(arr)
    l "Correctly parsed: #{correct.inspect}."
    steps = 100
    @flashes_total = 0
    make_steps(steps)
    l_up "Steps: #{steps}."
    l_up "Answer: #{@flashes_total}."
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
  def make_steps(number)
    l "Before any steps:"
    print_matrix
    number.times do |i|
      l "After step #{i+1}:"
      increase_each_cell_and_around
      set_overloades_to_zero
      print_matrix
    end
  end
  def print_matrix
    @matrix.each do |row|
      l "#{row.join}"
    end
    l " "
  end
  def increase_each_cell_and_around
    @matrix.size.times.each do |i|
      @matrix[0].size.times.each do |j|
        @matrix[i][j] += 1
        if 9 < @matrix[i][j]
          increase_around(i,j)
        end
      end
    end
  end
  def set_overloades_to_zero
    @matrix.size.times.each do |i|
      @matrix[0].size.times.each do |j|
        if 9 < @matrix[i][j]
          @matrix[i][j] = 0
          @flashes_total += 1
        end
      end
    end
  end
  def increase_around(i,j)
    i_bound, j_bound = @matrix.size-1, @matrix[0].size - 1
    (-1..1).each do |di|
      (-1..1).each do |dj|
        ii = di + i
        jj = dj + j
        next if ii == i && jj == j
        next if ! ii.between?(0,i_bound)
        next if ! jj.between?(0,j_bound)
        @matrix[ii][jj] += 1
      end
    end
  end
  def input arr
    @matrix = arr.map(&:strip).map{|x| x.chars.map(&:to_i)}
  end
  def check arr
    arr.map(&:strip).join("\n") === @matrix.map(&:join).join("\n")
  end
end

