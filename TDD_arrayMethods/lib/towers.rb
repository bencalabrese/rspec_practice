class Towers
  attr_reader :grid

  def initialize
    @grid = [[3,2,1],[],[]]
  end

  def move(start_pos, end_pos)
    is_valid?(start_pos, end_pos)
    grid[end_pos] << grid[start_pos].pop
  end

  def won?
    grid == [[], [3,2,1], []] || grid == [[], [], [3,2,1]]
  end

private
  def is_valid?(start_pos, end_pos)
    raise "off board" unless start_pos.between?(0,2) && end_pos.between?(0,2)
    raise "no disk at that position" if grid[start_pos].empty?

    unless grid[end_pos].empty?
      raise "illegal move" if grid[end_pos].last < grid[start_pos].last
    end
  end

end
