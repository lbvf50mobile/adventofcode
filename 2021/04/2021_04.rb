require 'set'
class Solution
  def start1(arr)
    ans = "First 1\n"
    numbers = arr.shift
    numbers = numbers.split(?,).map(&:to_i)
    checked_numbers = []
    desks = [] 
    arr.each_slice(6){|x| desks.push Desk.new(x) }
    winner = nil
    numbers.each do |n|
      checked_numbers.push(n)
      winner = false
      desks.each do |desk|
        desk.check(n)
        winner = desk if desk.winner
        break if winner
      end
      break if winner
    end
    raise "Cannot find winer" if ! winner
    line = winner.winner
    p line
    result = winner.unselected_sum * line.marked.last
    p result
    ans += result.to_s + "\n"
    ans += winner.inspect
    
    return ans;
  end
  def start2(arr)
    return "Second 2\n"
  end
end

class Desk
  # Accepts 6 lites. Fist is empty one.
  attr_reader :winner, :answer, :unselected_sum, :winner

  def initialize(arr)
    arr.shift
    numbers = arr.map{|x| x.split(" ").map(&:to_i)}
    @raw = arr.join()+"\n"
    @winner = nil
    @full_set = Set.new(numbers.flatten)
    @total_sum = numbers.sum{|x| x.sum}
    @unselected_sum = @total_sum
    @selected_sum = 0
    @lines = []
    numbers.each{|x| @lines.push(Line.new(x))}
    numbers.transpose.each{|x| @lines.push(Line.new(x))}
  end
  def check(number)
    return if ! @full_set.include?(number)
    @unselected_sum -= number
    @selected_sum += number
    @lines.each{|x| x.check(number)}
    @winner = @lines.find{|x| x.win}
  end
  def inspect
    ans = ""
    ans += @raw 
    ans += "Total sum: #{@total_sum}\n"
    ans += "Unselected sum: #{@unselected_sum}\n"
    ans += "Selected sum: #{@selected_sum}\n"
    if @winner
      ans += @winner.inspect
    end
    ans
  end
end
# 3. `desk` have `lines` line contains `nums_set`, `marked` and `win` boolean. Consturctor accepts an array. Methods `check` and `win` and `result`. 
class Line
  attr_reader :win, :marked
  def initialize(arr)
    @nums_set = Set.new(arr)
    @marked = []
    @win = false
  end
  def check(number)
    if @nums_set.include?(number)
      @marked.push(number)
      @win = true if 5 == @marked.size
      return true
    end
    return false
  end
  def inspect
    "win = #{@win.inspect}: #{@marked.join(?,)}"
  end
end




