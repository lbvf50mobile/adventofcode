class Solution
  def start1(arr)
    ans = ""
    p arr.map(&:size).uniq
    matrix = arr.map{|x| x.chars.tap{|x| x.pop}.map(&:to_i)}
    p matrix.map(&:size).uniq
    size = matrix.size
    number_of_ones = matrix.transpose.map(&:sum)
    number_of_zeros = number_of_ones.map{|x| size - x}
    most = number_of_zeros.zip(number_of_ones).map{|(a,b)| a > b ? 0 : 1}
    gamma = most.join.to_i(2)
    least = number_of_zeros.zip(number_of_ones).map{|(a,b)| a < b ? 0 : 1}
    epsilon = least.join.to_i(2)
    ans += "#{gamma * epsilon} \n";
    ans += "1: " + number_of_ones.to_s + "\n";
    ans += "0: " + number_of_zeros.to_s + "\n";
    ans += "m: " + most.to_s + "\n";
    ans += "l: " + least.to_s + "\n";
    ans += "g: #{gamma} \n";
    ans += "e: #{epsilon} \n";
    
    return "First 1\n" + ans
  end
  def start2(arr)
    return "Second 2\n"
  end
end

