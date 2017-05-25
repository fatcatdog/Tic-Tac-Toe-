class ComputerPlayer
  attr_reader :name
  attr_accessor :mark
  attr_reader :board

  def initialize(name)
    @name = name
    @mark = mark
  end


  def display(board)
    @board = board
  end

  def get_move
    @board.empty_positions.each do |pos|
      return pos if @board.would_win?(pos, @mark)
    end
    @board.empty_positions.sample
  end

end
