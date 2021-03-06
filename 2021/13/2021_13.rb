# = = = = = = =
# Accepted.
# Thanks God!
# = = = = = = =
class Solution
  def start1(arr)
    @l = ""
    @arr = arr
    @points, @folds = [],[]
    fill_points_and_folds
    @width = @points.map(&:first).max + 1
    @height = @points.map(&:last).max + 1
    l "Height: #{@height}, Width: #{@width}."
    @correct = check_correct
    l "Input read correctly: #{@correct.inspect}."
    @board = []
    create_board
    l "Board is created."
    # draw_board
    begin
      l "Fold: #{@folds.first}"
      do_fold(@folds.first)
      number = get_number_of_points
      l "Height: #{@height}, Width: #{@width}."
      l "Number of points is: #{number}."
      # draw_board
    rescue => e
      l e.message
    end
    l_up "First 1."
    return @l
  end
  def start2(arr)
    @l = ""
    @arr = arr
    @points, @folds = [],[]
    fill_points_and_folds
    @width = @points.map(&:first).max + 1
    @height = @points.map(&:last).max + 1
    l "Height: #{@height}, Width: #{@width}."
    @correct = check_correct
    l "Input read correctly: #{@correct.inspect}."
    @board = []
    create_board
    l "Board is created."
    # draw_board
    begin
      @folds.each do |fold|
        do_fold(fold)
      end
      draw_board
    rescue => e
      l e.message
    end
    l_up "Second 2."
    return @l
  end
  def l(str)
    @l += str + "\n"
  end
  def l_up(str)
    @l = str + "\n" + @l
  end
  def fill_points_and_folds
    @arr.each do |row|
      if /\d+,\d+/ === row
        x,y = row.split(?,).map(&:to_i)
        @points.push([x,y])
      elsif /fold along y/ === row
        fold = row.scan(/\d+$/)[0].to_i
        @folds.push([?y,fold])
      elsif /fold along x/ === row
        fold = row.scan(/\d+$/)[0].to_i
        @folds.push([?x,fold])
      end
    end
  end
  def check_correct
    top = @points.map{|(a,b)| "#{a},#{b}\n"}.join
    bottom = @folds.map{|(way,num)| "fold along #{way}=#{num}\n"}.join
    @arr.join.strip == [top,bottom].join("\n").strip
  end
  def create_board
    @board = Array.new(@height).map{ Array.new(@width,false)}
    @points.each do |(column,row)|
      @board[row][column] = true
    end
  end
  def do_fold(fold)
    if ?x == fold.first
      x_fold(fold.last)
    elsif ?y == fold.first
      y_fold(fold.last)
    else
      raise "Error: Unknown type of fold #{fold}."
    end
  end
  def y_fold(fold)
    top = fold
    bottom = @height - 1 - fold
    raise "Error !(top >= bottom)" if ! (top >= bottom)
    single_stripe = [0, fold - bottom - 1]
    double_stripe = [fold - bottom, fold - 1]
    (double_stripe.first..double_stripe.last).each do |i|
      (0...@width).each do |j|
        delta = fold - i
        ii = fold + delta
        @board[i][j] ||= @board[ii][j]
      end
    end
    @height = fold
  end
  def x_fold(fold)
    left = fold
    right = @width - 1 - fold
    sigle_stripe = [0, fold - right - 1]
    double_stripe = [fold - right, fold - 1]
    (double_stripe.first..double_stripe.last).each do |j|
      (0...@height).each do |i|
        delta = fold - j
        jj = fold+delta
        @board[i][j] ||= @board[i][jj]
      end
    end
    @width = fold
  end
  def get_number_of_points 
    num = 0
    (0...@height).each do |i|
      (0...@width).each do |j|
        num += 1 if @board[i][j]
      end
    end
    num
  end
  def draw_board
    l "Board."
    @board[0...@height].each do |line|
      l line[0..@width].map{|x| x ? "#" : ?.}.join
    end
  end
end

