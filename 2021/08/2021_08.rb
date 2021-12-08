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
    numbers = {}
    numbers["abcefg"] = 0
    numbers["cf"] = 1
    numbers["acdeg"] = 2
    numbers["acdfg"] = 3
    numbers["bcdf"] = 4
    numbers["abdfg"] = 5
    numbers["abdefg"] = 6
    numbers["acf"] = 7
    numbers["abcdefg"] = 8
    numbers["abcdfg"] = 9
    @pairs.each do |(a,b)|
      full_array = (a+b)
      eight = full_array.find{|x| 7 == x.size} 
      map = {}
      [?a,?b,?c,?d,?e,?f,?g].each_with_index do |correct,i|
        map[correct] = eight[i]
      end
      new_numbers = numbers.to_a.map{|(a,b)| [a.chars.map{|x| map[x]}.join,b]}.to_h
      print_map = map.to_a.map{|x| x.join(?:)}.join(?,)
      l "#{eight} => #{print_map} #{new_numbers[eight].inspect}"
      l "#{numbers.inspect}"
      l "#{new_numbers.inspect}"
      l "---------------------------------------"
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
end

