class Solution
  def start1(arr)
    @l = ""
    @crabs, @positions = [],{}
    get_crabs_and_positions arr
    correct_input = check_crabs_converted_correctly arr
    l "Input parsed correctly: #{correct_input}"
    l "Number of crabs: #{@crabs.size}"
    l "Number of positions: #{@positions.keys.size}"
    position_fuel_price = {} # Cost to move crabs to the position.
    @positions.keys.each do |destination|
      position_fuel_price[destination] = 0
      @positions.keys.each do |source|
        pos_amount =  @positions[source]
        price = (source - destination).abs * pos_amount
        position_fuel_price[destination] += price
      end
    end
    min = position_fuel_price.to_a.min{|x| x[1]}
    l "Minumum cost is: #{min[1]} at the poistion #{min[0]}"
    l_up "Answer: #{min[1]}"
    l_up "First 1."
    return @l
  end
  def start2(arr)
    @l = ""
    l_up "Second 2."
    return @l
  end
  def l(str)
    @l += str + "\n"
  end
  def l_up(str)
    @l = str + "\n" + @l
  end
  def get_crabs_and_positions arr
    @crabs = arr[0].split(?,).map(&:to_i)
    @positions = @crabs.each_with_object(Hash.new){|x,o| o[x] ||= 0; o[x]+=1}
  end
  def check_crabs_converted_correctly arr
    arr[0].strip == @crabs.join(?,)
  end
end

