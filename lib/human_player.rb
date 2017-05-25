class HumanPlayer
  attr_reader :name
  attr_accessor :mark

    def initialize(name)
      @name = name
      @mark = mark
    end


    def get_move
      print "please enter a move"
      move = gets.chomp

      until valid_move(move)
        print "please enter a valid move (ex. 0, 1)"
        move = gets.chomp
    end
        parse_move(move)
    end


    def display(board)
      @board = board
      puts
      puts board.to_s
    end


private
  def valid_move(move)
    move = parse_move(move)
    return false unless move.length == 2
    move.all? {|coord| coord.between?(0, 2) }
    @board.valid?(move)
  end

  def parse_move(move)
    move.split(",").map(&:to_i)
  end
end
