require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
 attr_reader :board

  attr_reader :current_player


 def initialize (player1, player2)
@board = Board.new
@player1 = player1
@player2 = player2
@player1.mark = :X
@player2.mark = :O
@current_player = @player1
 end
 def switch_players!
  if @current_player == @player1
    @current_player = @player2
  else
    @current_player = @player1
end
 end

 def play_turn
   current_player.display(@board)
   move = current_player.get_move
   @board.place_mark(move, current_player.mark)
   switch_players!
 end

def play
  until @board.over?
    play_turn
  end
  conclude
end

def conclude
puts
puts @board.to_s
puts
puts "congrats #{@board.winner}, you win!"
puts
end

end


if __FILE__ == $PROGRAM_NAME
  p1 = HumanPlayer.new("Jake")
  p2 = ComputerPlayer.new("Albert")
g = Game.new(p1, p2)
g.play
end
