
class Board

attr_reader :grid

  def initialize(grid = nil)
    @grid = grid || Array.new(3) {Array.new(3) }
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def empty?(pos)
    self[pos].nil?
  end

  def place_mark(pos, mark)
    self[pos] = mark
  end


  def winner
    [:X, :O].each {|mark| return mark if won?(mark)}
    nil
  end

  def over?
    !winner.nil? || @grid.flatten.count(nil) == 0
  end

  def to_s
    @grid.map do |row|
      row.map {|el| el.nil? ? "_" : el }.join(" ")
   end.join("\n")
  end

  def empty_positions
    positions.select { |pos| self.empty?(pos)}
  end

  def would_win?(pos, mark)
   place_mark(pos, mark)
   would_win = winner == mark
   self[pos] = nil
   would_win
  end


  def valid?(move)
    move.all? {|coord| coord.between?(0, 2) } && empty_positions.include?(move)
  end 

  private

   def positions
     p = []
     3.times do |row|
       3.times {|col| p << [row, col] }
   end
   p
 end

   def won?(mark)
    lines.any? do |line|
       line.all? {|pos| self[pos] == mark }
     end
   end

    def lines
    h_lines = (0..2).map do |y|
      [[0, y], [1, y], [2, y]]
    end

    v_lines = (0..2).map do |x|
      [[x, 0], [x, 1], [x, 2]]
    end

    d_lines =
      [[0, 0], [1, 1], [2, 2]],
      [[2, 0], [1, 1], [0, 2]]

    h_lines + v_lines + d_lines
    end
  end

  if __FILE__ == $PROGRAM_NAME
    b = Board.new
    puts b.to_s
    b.place_mark([0, 1], :X)
    b.place_mark([2, 0], :O)
    puts b.to_s
  end
