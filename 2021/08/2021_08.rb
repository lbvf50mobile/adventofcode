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
    numbers[0] = "abcefg"
    numbers[1] = "cf"
    numbers[2] = "acdeg"
    numbers[3] = "acdfg"
    numbers[4] = "bcdf"
    numbers[5] = "abdfg"
    numbers[6] = "abdefg"
    numbers[7] = "acf"
    numbers[8] = "abcdefg"
    numbers[9] = "abcdfg"
    @pairs.each do |(a,b)|
      full_array = (a+b)
      eight = full_array.find{|x| 7 == x.size} 
      map = {}
      [?a,?b,?c,?d,?e,?f,?g].each_with_index do |value,i|
        map[eight[i]] = value
      end
      print_map = map.to_a.map{|x| x.join(?:)}.join(?,)
      b = b.map{|x| [x,x.chars.map{|z| map[z]}.sort.join]}
      print_b = b.map{|x| x.join(?:)}.join(?,)
      l "#{eight} => #{print_map} => #{print_b}"
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

