# = = = = = = =
# Accepted.
# Thanks God!
# = = = = = = =
class Solution
  def start1(arr)
    @l = ""
    @crabs, @positions = [],{}
    get_crabs_and_positions arr
    correct_input = check_crabs_converted_correctly arr
    debug = false
    l "Input parsed correctly: #{correct_input}"
    l "Debuging: #{debug.inspect}"
    l "Number of crabs: #{@crabs.size}"
    l "Number of positions: #{@positions.keys.size}"
    start_pos,end_pos = @positions.keys.minmax
    l "From #{start_pos} til #{end_pos} there are #{end_pos - start_pos + 1} steps"
    l "Crabs: #{@crabs.inspect}" if debug
    l "Positions: #{@positions.inspect}" if debug
    position_fuel_price = {} # Cost to move crabs to the position.
    (start_pos..end_pos).each do |destination|
      l "Start Move to #{destination}. ===================" if debug
      position_fuel_price[destination] = 0
      @positions.keys.each do |source|
        pos_amount =  @positions[source]
        way = (source - destination).abs
        price =  way * pos_amount
        l "#{price}  #{way}*#{pos_amount}=#{price}  #{destination}-#{source} = #{way}"  if debug
        position_fuel_price[destination] += price
      end
      l "#{position_fuel_price[destination]} :total" if debug
      l "End Move to #{destination}. ===================\n\n" if debug
    end
    min = position_fuel_price.to_a.min_by{|x| x[1]}
    l "Min: #{min.inspect}" if debug
    l "Minumum cost is: #{min[1]} at the poistion #{min[0]}"
    l_up "Answer: #{min[1]}"
    l_up "First 1."
    return @l
  end
  def start2(arr)
    @l = ""
    @crabs, @positions = [],{}
    get_crabs_and_positions arr
    correct_input = check_crabs_converted_correctly arr
    debug = false
    l "Input parsed correctly: #{correct_input}"
    l "Debuging: #{debug.inspect}"
    l "Number of crabs: #{@crabs.size}"
    l "Number of positions: #{@positions.keys.size}"
    start_pos,end_pos = @positions.keys.minmax
    l "From #{start_pos} til #{end_pos} there are #{end_pos - start_pos + 1} steps"
    l "Crabs: #{@crabs.inspect}" if debug
    l "Positions: #{@positions.inspect}" if debug
    position_fuel_price = {} # Cost to move crabs to the position.
    (start_pos..end_pos).each do |destination|
      l "Start Move to #{destination}. ===================" if debug
      position_fuel_price[destination] = 0
      @positions.keys.each do |source|
        pos_amount =  @positions[source]
        way = (source - destination).abs
        price =  0 == way ? 0 : ((way*(1+way))/2)*pos_amount
        l "#{price}  #{price}  #{destination}-#{source} = #{way}"  if debug
        position_fuel_price[destination] += price
      end
      l "#{position_fuel_price[destination]} :total" if debug
      l "End Move to #{destination}. ===================\n\n" if debug
    end
    min = position_fuel_price.to_a.min_by{|x| x[1]}
    l "Min: #{min.inspect}" if debug
    l "Minumum cost is: #{min[1]} at the poistion #{min[0]}"
    l_up "Answer: #{min[1]}"
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

