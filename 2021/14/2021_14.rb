class Solution
  def start1(arr)
    @l = ""
    @arr = arr
    @polymer, @pair_insertions = "", []
    read_input
    l "Read input: done."
    checked = check_input
    l "Read correctly: #{checked.inspect}."
    l "Polymer: #{@polymer}."
    @pol = @polymer.chars
    @hash = @pair_insertions.each_with_object(Hash.new){|el,o| o[el.first] = el.last}
    10.times{ start_process }
    @counter = @pol.each_with_object(Hash.new){|el,o| o[el]||=0; o[el]+=1;}
    min,max = @counter.values.minmax
    l "#{max} - #{min} = #{max - min};"
    l_up "First 1."
    return @l
  end
  def start2(arr)
    @l = ""
    @arr = arr
    @polymer, @pair_insertions = "", []
    read_input
    l "Read input: done."
    checked = check_input
    l "Read correctly: #{checked.inspect}."
    l "Polymer: #{@polymer}."
    @pol = @polymer.chars.each_cons(2).each_with_object(Hash.new){|(a,b),o| o[a+b]||= 0 ; o[a+b] += 1;}
    l "input: #{@pol.keys.inspect}."
    @hash = @pair_insertions.each_with_object(Hash.new){|el,o| o[el.first] = el.last}
    10.times{ start_process_hash }
    min,max = @pol.values.minmax
    l "#{max} - #{min} = #{max - min};"
    l_up "Second 2."
    return @l
  end
  def l(str)
    @l += str + "\n"
  end
  def l_up(str)
    @l = str + "\n" + @l
  end
  def read_input
    # First element must be an polymer template.
    @polymer = @arr[0]
    @polymer = @polymer.strip
    (1...@arr.size).each do |i|
      row = @arr[i].strip
      if />/ === row
        @pair_insertions.push([row[0..1],row[-1]])
      end
    end
  end
  def check_input
    pairs = @pair_insertions.map{|(a,b)| "#{a} -> #{b}"}
    generated = @polymer + "\n\n" + pairs.join("\n")
    generated.strip == @arr.join.strip
  end
  def start_process
    new_pol = []
    (0..@pol.size-2).each do |i|
      new_pol.push(@pol[i])
      new_pol.push(@hash[@pol[i] + @pol[i+1]])
    end
    new_pol.push(@pol.last)
    @pol = new_pol
  end
  def start_process_hash
    new_pol = {}
    @pol.to_a.each do |(key,number)|
      a = key[0]; c = key[1]; b = @hash[key];
      one = a + b
      two = b + c
      new_pol[one] ||= 0; new_pol[two] ||= 0;
      new_pol[one] += number; new_pol[two] += number
    end
    @pol = new_pol
  end
end

