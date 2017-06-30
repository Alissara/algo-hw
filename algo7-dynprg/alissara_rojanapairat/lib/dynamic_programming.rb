class DynamicProgramming
  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
    @maze_cache = {}
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]
    ans = blair_nums(n - 1) + blair_nums(n - 2) + ((n * 2) - 1)
    @blair_cache[n] = ans
    return ans
  end

  def frog_hops(n)
    return nil if n > 999
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_cache_builder(n)
    cache = {
      1 => [[1]],
      2 => [[1,1], [2]],
      3 => [[1,1,1], [1,2], [2,1], [3]],
      # 4 => [[1,1,1,1], [1,1,2], [1,2,1], [2,1,1], [1,3], [3,1], [2,2]],
    }
    return cache if n < 4
    (4..n).each do |i|
      c3 = cache[i - 3].map { |sub| sub + [3] }
      c2 = cache[i - 2].map { |sub| sub + [2] }
      c1 = cache[i - 1].map { |sub| sub + [1] }
      cache[i] = c1.concat(c2).concat(c3)
    end

    cache
  end

  def frog_hops_top_down(n)
  end

  def super_frog_hops(n, k)
    cache = super_frog_cache_builder(n, k)
    cache[n]
  end

  def super_frog_cache_builder(n, k)
    # (1..k).each do |i|
    #   hops = frog_hops(n-i)
    # end
    cache = {
      1 => [[1]],
      2 => [[1,1], [2]],
      3 => [[1,1,1], [1,2], [2,1], [3]],
      4 => [[1,1,1,1], [1,1,2], [1,2,1], [2,1,1], [1,3], [3,1], [2,2], [4]],
    }
    if n > k
      # return cache if n < 5
      ((k + 1)..n).each do |i|
        c4 = cache[i - 4].map { |sub| sub + [4] } if cache[i - 4]
        c3 = cache[i - 3].map { |sub| sub + [3] } if cache[i - 3]
        c2 = cache[i - 2].map { |sub| sub + [2] } if cache[i - 2]
        c1 = cache[i - 1].map { |sub| sub + [1] } if cache[i - 1]
        [c2, c3, c4].each do |subarr|
          c1.concat(subarr) if subarr
        end
        cache[i] = c1
      end
      return cache
    elsif n <= k
      return cache
    end
  end

  def make_change(amt, coins)
    return [] if amt == 0
  end

  def maze_solver(maze, start_pos, end_pos)
    # return end_pos if arr.last == end_pos
    # moves = [[0, 1], [1, 0], [0, -1], [-1, 0]]
    # pos = start_pos
    # path = []
    # moves.each do |mv|
    #   next_mv = [pos[0] + mv[0], pos[1] + mv[1]]
    # end

    return [end_pos] if start_pos == end_pos
    valid_moves = get_valid_moves(maze, start_pos)
    path_length = 1.0 / 0.0
    path = []
    valid_moves.each do |move|
      new_path = maze_solver(maze, move, end_pos)
      if new_path.length < path_length
        path = new_path
        path_length = path.length
      end
    end
    path = start_pos + path


  end


end
