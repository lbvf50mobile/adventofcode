class Solution
  def start(arr)
    counter = 0
    numbers = arr.map(&:to_i)
    (1...numbers.size).each do |i|
      counter += 1 if numbers[i-1] < numbers[i]
    end
    counter.to_s
  end
end

