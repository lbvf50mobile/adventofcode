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
      a = a.sort_by(&:size).map{|x| x.chars.sort.join}
      b = b.sort_by(&:size).map{|x| x.chars.sort.join}
      numbers = convert_b(b)
      l "#{a.join(?,)}, #{numbers.join(?,)}"
    end
    l_up "Answer is: #{answer}"
    l_up "Second 2."
    return @l
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
  def set_cr(arr)
    @criteria = []
    @criteria[0] = ->x{false}
    @criteria[1] = ->x{ 2 == x.size}
    @criteria[2] = ->x{false}
    @criteria[3] = ->x{false}
    @criteria[4] = ->x{false}
    @criteria[5] = ->x{false}
    @criteria[6] = ->x{false}
    @criteria[7] = ->x{false}
    @criteria[8] = ->x{ 7 == x.size}
    @criteria[9] = ->x{false}
  end

  def convert_b(arr)
    set_cr(arr)
    arr.map{|x|
      ans = nil
      @criteria.each_with_index do |fun,i|
        ans = i if fun[x]
      end
      ans ? ans : x
    }
  end
end

