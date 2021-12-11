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
    second_numbers = {}
    numbers.keys.each do |key|
      new_key = convert_string_to_second_mapping(key)
      second_numbers[new_key] = numbers[key]
    end
    l "Digits map for task 2: #{second_numbers}"
    @pairs.each do |(a,b)|
      eight = a.find{|x| 7 == x.size} 
      map = {}
      incorrect_map = {}
      [?a,?b,?c,?d,?e,?f,?g].each_with_index do |correct,i|
        map[correct] = eight[i]
        incorrect_map[eight[i]] = correct
      end
      converted_eight = eight.chars.map{|c| incorrect_map[c]}.join
      # Convert four digit from incorrect to correct.
      converted = b.map{|x| x.chars.map{|c| incorrect_map[c]}.sort.join}
      second_converted = converted.map{|x| convert_string_to_second_mapping(x)}
      digits = converted.map{|str| second_numbers[str]}
      l "#{b}"
      l "#{converted}"
      l "#{second_converted}"
      l "#{digits}"
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
  def convert_string_to_second_mapping str
    mp = {}
    mp[?a] = ?d
    mp[?b] = ?e
    mp[?c] = ?a
    mp[?d] = ?f
    mp[?e] = ?g
    mp[?f] = ?b
    mp[?g] = ?c
    str.chars.map{|c| mp[c]}.join
  end
end

