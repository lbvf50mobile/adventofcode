# = = = = = = =
# Accepted.
# Thanks God!
# = = = = = = =
class Solution
  def start(arr)
    counter = 0
    numbers = arr.map(&:to_i)
    (1...numbers.size).each do |i|
      counter += 1 if numbers[i-1] < numbers[i]
    end
    "start\n"  + counter.to_s
  end
  def start1(arr)
    counter = 0
    ans = []
    numbers = arr.map(&:to_i)
    sum = numbers[0..2].sum
    ans.push("#{sum} start")
    (3...numbers.size).each do |i|
      new_sum = sum - numbers[i-3] + numbers[i]
      if new_sum > sum
        ans.push("#{new_sum} increased")
        counter += 1
      else
        ans.push("#{new_sum} decreased")
      end
      sum = new_sum
    end
    "start1\n"  + counter.to_s + "\n" + ans.join("\n") + "\n" + counter.to_s
  end
end

