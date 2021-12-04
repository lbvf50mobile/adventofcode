require 'set'
class Solution
  def start1(arr)
    ans = "First 1\n"
    numbers = arr.shift
    numbers = numbers.split(" ").map(&:to_i)
    checked_numbers = []
    desks = [] 
    arr.each_slice(6){|x| desks.push Desk.new(x) }
    winner = nil
    numbers.each do |n|
      checked_numbers.push(n)
      winner = false
      desks.each do |desk|
        tmp = desk.check(n)
        winner = tmp if tmp
        break if winner
      end
      break if winner
    end
    raise "Cannot find winer" if ! winner
    
    return ans;
  end
  def start2(arr)
    return "Second 2\n"
  end
end

class Desk
  # Accepts 6 lites. Fist is empty one.
  def initialize(arr)
    @raw = arr.join("\n")+"\n"
    @winner = nil
    arr.shift
    numbers = arr.map{|x| x.split(" ").map(&:to_i)}
    @lines = []
    # Rows:
    numbers.each{|x| @lines.push(Line.new(x))}
    numbers.transpose.each{|x| @lines.push(Line.new(x))}
  end
  def check(number)
    p number
    @lines.each{|x| x.check(number)}
    @winner = @lines.find{|x| x.win}
  end
  def inspect
    ans = ""
    ans += @raw
    ans += @winner.inspect + "\n" if @winner
    ans
  end
end
# 3. `desk` have `lines` line contains `nums_set`, `marked` and `win` boolean. Consturctor accepts an array. Methods `check` and `win` and `result`. 
class Line
  attr_reader :win
  def initialize(arr)
    @nums_set = Set.new(arr)
    @marked = []
    @win = false
  end
  def result
    @marked.sum * @marked.last
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
    "(#{@marked.join(?+)})*#{@marked.last} = #{@marked.sum} * #{@marked.last} = #{@marked.sum*@marked.last}"
  end
end




