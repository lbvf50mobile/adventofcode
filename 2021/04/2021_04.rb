require 'set'
class Solution
  def start1(arr)
    return "First 1\n"
  end
  def start2(arr)
    return "Second 2\n"
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




