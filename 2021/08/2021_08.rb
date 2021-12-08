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
    counter_of_eight = 0
    @pairs.each do |(a,b)|
      counter_of_eight += 1 if (a + b).find(8)
    end
    l  "Each line has eight: #{(counter_of_eight == @pairs.size).inspect}"
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
end

