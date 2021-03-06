# = = = = = = =
# Accepted.
# Thanks God!
# = = = = = = =
class Solution
  def start1(arr)
    horizontal, depth = 0,0
    total = 0
    answer = []
    # forward 5 adds 5 to your horizontal position, a total of 5.
    # down 5 adds 5 to your depth, resulting in a value of 5.
    # forward 8 adds 8 to your horizontal position, a total of 13.
    # up 3 decreases your depth by 3, resulting in a value of 2.
    # down 8 adds 8 to your depth, resulting in a value of 10.
    # forward 2 adds 2 to your horizontal position, a total of 15.
    arr.each do |el|
      action, value  = el.split(" ")
      value = value.to_i
      case action
      when 'forward'
        horizontal += value
        answer.push "forward #{value} adds #{value} to your horizontal position, a total of #{horizontal}."
      when 'down'
        depth += value
        answer.push "down #{value} adds #{value} to your depth, resulting in a value of #{depth}."
      when 'up'
        depth -= value
        answer.push "up #{value} decreases your depth by #{value}, resulting in a value of #{depth}."
      else
        raise "Unknown command."
      end
    end
    result = horizontal * depth
    return "First 1\n result = #{result}\n" + answer.join("\n")
  end
  def start2(arr)
    horizontal, depth, aim = 0,0,0
    total = 0
    answer = []
    arr.each do |el|
      action, value  = el.split(" ")
      value = value.to_i
      case action
      when 'forward'
        horizontal += value
        depth += (aim * value)
        answer.push "forward #{value} adds #{value} to your horizontal position, a total of #{horizontal}. aim=#{aim} depth=#{depth}"
      when 'down'
        aim += value
        answer.push "down #{value} adds #{value} to your depth, resulting in a value of #{depth}. aim=#{aim} depth=#{depth}"
      when 'up'
        aim -= value
        answer.push "up #{value} decreases your depth by #{value}, resulting in a value of #{depth}. aim=#{aim} depth=#{depth}"
      else
        raise "Unknown command."
      end
    end
    result = horizontal * depth
    return "Second 2\n result = #{result}\n" + answer.join("\n")
  end
end

