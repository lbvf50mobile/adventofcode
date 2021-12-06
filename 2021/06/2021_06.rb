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
    return "Second 2\n"
  end
  def l(str)
    @l += str + "\n"
  end
  def l_up(str)
    @l = str + "\n" + @l
  end
end

