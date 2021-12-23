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
end

