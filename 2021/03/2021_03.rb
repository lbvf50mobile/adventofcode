# = = = = = = =
# Accepted.
# Thanks God!
# = = = = = = =
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
    ans = ""
    matrix = arr.map{|x| x.chars.tap{|x| x.pop}.map(&:to_i)}
    @matrix = matrix
    oxigen = find("get_ox_rating")
    co2 = find("get_co_rating")
    o, c = oxigen.join.to_i(2), co2.join.to_i(2)
    ans += "anwer: #{c * o} \n"
    ans += "Values:\n";
    ans += "o: " + oxigen.to_s + " #{o}\n"
    ans += "c: " + co2.to_s + " #{c}"
    return "Second 2\n" + ans
  end
  # Create filter that select numbers from the arra by bit.
  def filter(index,bit,arr)
    arr.select{|x| x[index] == bit}
  end
  def find(type)
    p type
    tmp = @matrix
    (0...@matrix[0].size).each do |i|
      p tmp
      p type.to_sym
      p self.send(type.to_sym,tmp)
      tmp = filter(i,self.send(type.to_sym,tmp)[i],tmp)
      break if tmp.size == 1
    end
    raise "Size error" if tmp.size != 1
    tmp[0]
  end
  def get_ox_rating(matrix)
    size = matrix.size
    number_of_ones = matrix.transpose.map(&:sum)
    number_of_zeros = number_of_ones.map{|x| size - x}
    # If 0 and 1 are equally common, keep values with a 1 in the position being considered.
    # Most Common.
    oxygen_rating = number_of_zeros.zip(number_of_ones).map{|(zero,one)| one >= zero ? 1 : 0 }
  end
  def get_co_rating(matrix)
    size = matrix.size
    number_of_ones = matrix.transpose.map(&:sum)
    number_of_zeros = number_of_ones.map{|x| size - x}
    # If 0 and 1 are equally common, keep values with a 0 in the position being considered.
    # Least common.
    co2_rating = number_of_zeros.zip(number_of_ones).map{|(zero,one)| zero <= one ? 0 : 1 }
  end
end

