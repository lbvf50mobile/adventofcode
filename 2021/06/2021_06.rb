class Solution
  def start1(arr)
    @l = ""
    arr = arr[0].split(?,).map(&:to_i)
    l "First 1."
    number_of_days = 80
    print_stack = false
    l "Number of days: #{number_of_days}. Print stack: #{print_stack.inspect}."
    l "Initial state: #{arr.join(?,)}"
    number_of_days.times do |step|
      day = step + 1
      i = 0
      while i < arr.size
        arr[i] -= 1
        arr.push(9) if -1 == arr[i]
        arr[i] = 6 if -1 == arr[i] 
        i += 1
      end
      if print_stack
        l "After #{day.to_s.rjust(2," ")}: #{arr.join(?,)}"
      else
        l "After #{day.to_s.rjust(2," ")}: #{arr.size}"
      end
    end
    l_up "Answer is: #{arr.size}"
    return @l
  end
  def start2(arr)
    @l = ""
    arr = arr[0].split(?,).map(&:to_i)
    current_day = Array.new(9,0)
    add_day = Array.new(9,0)
    arr.each do |state|
      current_day[state] += 1
    end
    l "Second 2."
    number_of_days = 256
    l "Number of days: #{number_of_days}."
    l "Initial state: #{arr.join(?,)}"
    l "Grouped: #{current_day.join(?,)}"
    number_of_days.times do |step|
      day = step + 1
      l "Start #{day}--------------------"
      add_day = Array.new(9,0)
      l "#{add_day} - must be clear."
      l "#{current_day} - this is how starts."
      (0...9).each do |i|
        if i.between?(1,8)
          add_day[i-1] += current_day[i]
        else
          add_day[6] += current_day[i]
          add_day[8] += current_day[i]
        end
      end
      l "#{add_day} - must be shifted."
      current_day = add_day
      l "After #{day.to_s.rjust(2," ")}: (#{current_day.sum}) #{current_day.join(?,)}"
      l "End #{day}--------------------"
    end
    l_up "Answer is: #{current_day.sum}"
    return @l
  end
  def l(str)
    @l += str + "\n"
  end
  def l_up(str)
    @l = str + "\n" + @l
  end
end

