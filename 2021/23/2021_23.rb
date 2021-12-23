class Solution
  def start1(arr)
    @l = ""
    fill_input(arr)
    check = check_input(arr)
    l "Input checked: #{check.inspect}."
    @adjacency_list = {}
    @mark_as_visited = {}
    make_adjacency_list
    fill_mark_as_visited
    @path = []
    @valid_paths = []
    @visited = {}
    backtracking('start')
    print_paths
    l_up "Number of paths: #{@valid_paths.size}."
    l_up "First 1."
    return @l
  end
  def start2(arr)
    @l = ""
    fill_input(arr)
    check = check_input(arr)
    @d = true
    l "Input checked: #{check.inspect}. Debug = #{@d.inspect}."
    @adjacency_list = {}
    make_adjacency_list
    @limit = {}
    set_limits_for_nodes
    l @limit.to_a.map{|x| x.join(?:)}.join(?,) if @d
    @visits_number = {}
    prepare_visits_number
    @path = []
    @valid_paths = []
    backtracking2('start')
    print_paths
    l_up "Number of paths: #{@valid_paths.size}."
    l_up "Second 2."
    return @l
  end
  def l(str)
    @l += str + "\n"
  end
  def l_up(str)
    @l = str + "\n" + @l
  end
  def fill_input(arr)
    @matrix = arr.map(&:strip).map{|x| x.split(?-)}
  end
  def check_input(arr)
    arr.map(&:strip).join("\n") == @matrix.map{|x| x.join(?-)}.join("\n")
  end
  def make_adjacency_list
    @matrix.each do |(a,b)|
      @adjacency_list[a] ||= []
      @adjacency_list[b] ||= []
      @adjacency_list[a].push(b)
      @adjacency_list[b].push(a)
    end
  end
  def fill_mark_as_visited
    @matrix.flatten.uniq.each do |node|
      if /[A-Z]/ === node
        @mark_as_visited[node] = false
      else
        @mark_as_visited[node] = true
      end
    end
  end
  def set_limits_for_nodes
    @matrix.flatten.uniq.each do |node|
      if /[A-Z]/ === node
        @limit[node] = -1
      else
        if 1 == @adjacency_list[node].size
          @limit[node] = 2
        else
          @limit[node] = 1
        end
      end
    end
    @limit['start'] = 1
  end
  def prepare_visits_number
    @matrix.flatten.uniq.each do |node|
      @visits_number[node] = 0
    end
  end
  def print_paths
    @valid_paths.each do |path|
      l path.join(?,)
    end
    l " "
  end
  def backtracking(node)
    raise "No such node #{node}." if @adjacency_list[node].nil?
    if @mark_as_visited[node]
      @visited[node] = true
    end
    @path.push(node)
    if 'end' == node
      @valid_paths.push(@path.clone)
      @visited[node] = false
      @path.pop()
      return
    end
    @adjacency_list[node].each do |next_node|
      backtracking(next_node) if ! @visited[next_node]
    end
    @path.pop()
    @visited[node] = false
  end
  def backtracking2(node)
    raise "No such node #{node}." if @adjacency_list[node].nil?
    if @limit[node] > 0
      @visits_number[node] += 1
    end
    @path.push("#{node}:#{@visits_number[node]}/#{@limit[node]}")
    if 'end' == node
      @valid_paths.push(@path.clone)
      @visits_number[node] -= 1 if @limit[node] > 0
      @path.pop()
      return
    end
    @adjacency_list[node].each do |next_node|
      if @limit[next_node] < 0
        backtracking2(next_node)
        next
      end
      if @visits_number[next_node] < @limit[next_node]
        backtracking2(next_node)
        next
      end
    end
    @path.pop()
    if @limit[node] > 0
      @visits_number[node] -= 1
    end
  end
end

