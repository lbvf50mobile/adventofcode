# https://adventofcode.com/2015/day/1
def not_quite_list(str)
ans = 0
str.chars.each do |char|
  if ?( == char
    ans += 1
  else
      ans -= 1
    end
  end
  ans
end

require 'yaml'
input = YAML.load_file('input.yaml')
output = input.map{|(str,num)| 
   ans =  not_quite_list(str)
   [ans == num, str, num, ans]
}
p output

File.write('output.yaml',output.to_yaml)

