# = = = = = = =
# Accepted.
# Thanks God!
# = = = = = = =
require 'set'
class Solution
  def start1(arr)
    @l = ""
    @pairs = []
    convert_arr_to_pairs(arr)
    correct = check(arr)
    l "Correct parsing: #{correct.inspect}"
    answer = 0
    @pairs.each do |(a,b)|
      numbers = b.map(&:size)
      needed = numbers.select{|x| [2,4,3,7].include?(x)}
      local_size = needed.size
      answer += local_size
      l "#{b.inspect} | #{numbers.inspect} | #{local_size} : #{needed.inspect} => #{answer}"
    end
    l_up "Answer is: #{answer}"
    l_up "First 1."
    return @l
  end
  def start2(arr)
    @l = ""
    @pairs = []
    convert_arr_to_pairs(arr)
    correct = check(arr)
    l "Correct parsing: #{correct.inspect}"
    answer = 0
    @pairs.each do |(a,b)|
      a = a.map{|x| x.chars.sort.join}
      b = b.map{|x| x.chars.sort.join}
      numbers = numbers_str_to_digit(convert_b(a,b))
      answer += numbers
      l "#{a.join(?,)}, #{numbers}"
    end
    l_up "Answer is: #{answer}"
    l_up "Second 2."
    return @l
  end
  def numbers_str_to_digit(arr)
    raise "Incorrect arrays size." if 4 != arr.size
    arr.each_with_index.reduce(0){|sum,(num,i)| sum += num.to_i * (10**3)/(10**i)}
  end
  def l(str)
    @l += str + "\n"
  end
  def l_up(str)
    @l = str + "\n" + @l
  end
  def convert_arr_to_pairs(arr)
    @pairs = []
    arr.each do |str|
      str = str.strip
      left,right = str.split(?|)
      left = left.split(" ").map(&:strip)
      right = right.split(" ").map(&:strip)
      @pairs.push([left,right])
    end
  end
  def check(arr)
    arr.map(&:strip) == @pairs.map{|(a,b)| a.join(" ") + " | " + b.join(" ")}
  end
  def set_cr(a,b)
    one = a.find{|x| 2 == x.size}.chars.to_set
    four = a.find{|x| 4 == x.size}.chars.to_set
    seven = a.find{|x| 7 == x.size}.chars.to_set
    four_minus_one = four - one

    @criteria = []
    @criteria[0] = ->x{ 6 == x.size && ! (four_minus_one - x.chars.to_set).empty?}
    @criteria[1] = ->x{ 2 == x.size}
    @criteria[2] = ->x{
      set = x.chars.to_set
      first_ = 5 == x.size
      second_ = (four_minus_one - set).empty?
      third_ = (one - set).empty?
      first_ && ! second_ &&  ! third_
    }
    @criteria[3] = ->x{
      set = x.chars.to_set
      first_ = 5 == x.size
      second_ = (one - set).empty?
      first_ && second_ 
    }
    @criteria[4] = ->x{ 4 == x.size}
    @criteria[5] = ->x{
      set = x.chars.to_set
      first_ = 5 == x.size
      second_ = (four_minus_one - set).empty?
      third_ = (one - set).empty?
      first_ &&  second_ &&  ! third_
    }
    @criteria[6] = ->x{
      set = x.chars.to_set
      first_ = 6 == x.size
      second_ = (four_minus_one - set).empty?
      third_ = (one - set).empty?
      first_ && second_ && ! third_
    }
    @criteria[7] = ->x{ 3 == x.size}
    @criteria[8] = ->x{ 7 == x.size}
    @criteria[9] = ->x{
      set = x.chars.to_set
      first_ = 6 == x.size
      second_ = (four_minus_one - set).empty?
      third_ = (one - set).empty?
      first_ && second_ &&  third_
    }
  end

  def convert_b(a,b)
    set_cr(a,b)
    b.map{|x|
      ans = nil
      @criteria.each_with_index do |fun,i|
        ans = i if fun[x]
      end
      ans ? ans : x
    }
  end
end

