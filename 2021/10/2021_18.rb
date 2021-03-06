# = = = = = = =
# Accepted.
# Thanks God!
# = = = = = = =
class Solution
  def start1(arr)
    @l = ""
    @input = parse_input(arr)
    correct = check_input(arr)
    l "Input parsed correctly: #{correct.inspect}"
    l "Number of lines: #{@input.size}"
    set_default_array_and_hashes
    check_input_for_corrupted
    l "Stats:"
    results = []
    @close_brackets.each do |c|
      n = @number_of_error_close_brackets[c]
      points = @error_closing_brackets_points[c]
      mul = n * points
      results.push(mul)
      l "#{c}: #{n}*#{points} = #{mul}"
    end
    answer = results.reduce(&:+)
    l_up "#{results.join(?+)}=#{answer}"
    l_up "Answer: #{answer}"
    l_up "First 1."
    return @l
  end
  def start2(arr)
    @l = ""
    @input = parse_input(arr)
    correct = check_input(arr)
    l "Input parsed correctly: #{correct.inspect}"
    l "Number of lines: #{@input.size}"
    set_default_array_and_hashes
    complete_lines
    sorted = @completion_lines_results.sort
    l "#{sorted.inspect}"
    answer = sorted[sorted.size/2]
    l "Middle is: #{answer}"
    l_up "Answer: #{answer}"
    l_up "Second 2."
    return @l
  end
  def l(str)
    @l += str + "\n"
  end
  def l_up(str)
    @l = str + "\n" + @l
  end
  def parse_input(arr)
    @input = []
    @input = arr.map(&:strip).map{|x| x.chars}
  end
  def check_input(arr)
    arr.map(&:strip).join("\n") == @input.map(&:join).join("\n")
  end
  def check_input_for_corrupted
    @input.each{|line| check_line_for_corrupted(line)}
  end
  def check_line_for_corrupted(line)
    stack = []
    char_illegal = nil
    char_must_be = ?_
    line.each do |c|
      if stack.empty? && @close_brackets.include?(c)
        char_illegal = c
        @number_of_error_close_brackets[c] += 1
        break
      end
      if @close_brackets.include?(c) && @open_close_pair[stack.last] != c
        char_illegal = c
        char_must_be = stack.last
        @number_of_error_close_brackets[c] += 1
        break
      end
      if @close_brackets.include?(c) && @open_close_pair[stack.last] == c
        stack.pop
        next
      end
      if @open_brackets.include?(c)
        stack.push(c)
        next
      end
      raise "Unpredicted case at #{line}."
    end
    if char_illegal
      l "#{line.join} - Expected #{char_must_be}, but found #{char_illegal} instead."
      return
    end
    l "#{line.join} - OK"
  end
  def complete_lines
    @input.each{|line| complete_line(line)}
  end
  def complete_line(line)
    stack = []
    char_illegal = nil
    char_must_be = ?_
    line.each do |c|
      if stack.empty? && @close_brackets.include?(c)
        char_illegal = c
        @number_of_error_close_brackets[c] += 1
        break
      end
      if @close_brackets.include?(c) && @open_close_pair[stack.last] != c
        char_illegal = c
        char_must_be = stack.last
        @number_of_error_close_brackets[c] += 1
        break
      end
      if @close_brackets.include?(c) && @open_close_pair[stack.last] == c
        stack.pop
        next
      end
      if @open_brackets.include?(c)
        stack.push(c)
        next
      end
      raise "Unpredicted case at #{line}."
    end
    if char_illegal
      # Just corrupted line skip it.
      return
    end
    if ! stack.empty?
      close_brackets = stack.reverse.map{|x| @open_close_pair[x]}
      scores = close_brackets.map{|x| @completion_points[x]}
      total_score = scores.reduce(0){|ans,el| ans*5 + el}
      @completion_lines_results.push(total_score)
      l "#{line.join} <===> #{close_brackets.join} => #{scores.join(?,)} = #{total_score}"
      return
    end
    raise "#{line.join} - Line without an error not corrupted not incompleted."
  end
  def set_default_array_and_hashes
    @open_brackets = [?(,?[,?{,?<]
    @close_brackets = [?),?],?},?>]
    @open_close_pair = {}
    @open_close_pair[?(] = ?)
    @open_close_pair[?[] = ?]
    @open_close_pair[?{] = ?}
    @open_close_pair[?<] = ?>
    @error_closing_brackets_points = {}
    @error_closing_brackets_points[?)] = 3
    @error_closing_brackets_points[?]] = 57
    @error_closing_brackets_points[?}] = 1197
    @error_closing_brackets_points[?>] = 25137
    @number_of_error_close_brackets = {}
    @number_of_error_close_brackets[?)] = 0
    @number_of_error_close_brackets[?]] = 0
    @number_of_error_close_brackets[?}] = 0
    @number_of_error_close_brackets[?>] = 0
    # Task 2.
    @completion_lines_results = []
    @completion_points = {}
    @completion_points[?)] = 1
    @completion_points[?]] = 2
    @completion_points[?}] = 3
    @completion_points[?>] = 4
  end
end

