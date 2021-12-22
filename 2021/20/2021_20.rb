class Solution
  def start1(arr)
    @l = ""
    input arr
    correct = check(arr)
    l "Correctly parsed: #{correct.inspect}."
    steps = 2
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
      create_flashed_map
      increase_each_cell_by_one
      iterate_over_cells_start_flashes
      print_matrix
    end
  end
  def print_matrix
    @matrix.each do |row|
      l "#{row.join}"
    end
    l " "
  end
  def create_flashed_map
    @flashed = Array.new(@matrix.size).map{ Array.new(@matrix[0].size,false)}
  end
  def increase_each_cell_by_one
    @matrix.size.times.each do |i|
      @matrix[0].size.times.each do |j|
        @matrix[i][j] += 1
      end
    end
  end
  def iterate_over_cells_start_flashes
    @matrix.size.times.each do |i|
      @matrix[0].size.times.each do |j|
        start_flash_bfs(i,j) if ((! @flashed[i][j]) && @matrix[i][j] > 9)
      end
    end
  end
  def start_flash_bfs(i,j)
    return if ! ((! @flashed[i][j]) && @matrix[i][j] > 9)
    i_bound, j_bound = @matrix.size-1, @matrix[0].size - 1
    q = [[i,j]]
    @flashed[i][j] = true
    while ! q.empty?
      i,j = q.pop
      increase_around(i,j)
      @matrix[i][j] = 0
      (-1..1).each do |di|
        (-1..1).each do |dj|
          ii = di + i
          jj = dj + j
          next if ii == i && jj == j
          next if ! ii.between?(0,i_bound)
          next if ! jj.between?(0,j_bound)
          next if @flashed[ii][jj]
          next if @matrix[ii][jj] <= 9
          @flashed[ii][jj] = true
          q.unshift([ii,jj])
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
        next if @flashed[ii][jj]
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

