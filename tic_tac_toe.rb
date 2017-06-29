require_relative 'Board'
require_relative 'Player' 
require_relative 'AIPlayer' 


    
def tic_tac_toe(player1, player2)
    if not ['X','O'].include?(player1.checker) or (not ['X','O'].include?(player2.checker)) \
       or player1.checker == player2.checker
       print 'need one X player and one O player.' 
       return false
   end

    print 'Welcome to Tic Tac Toe!' 
    print "\n"
    @newboard = Board.new(3)
    @newboard.printBoard
    
    while true do
        if process_move(player1, @newboard)
            return true
        end

        if process_move(player2, @newboard)
            return true
        end
    end
end
def process_move(player, board)
    print "\n"
    print  player.checker+ "'s" +' '+ 'turn'
    p_next_move= player.next_move(board)
    board.add_checker(player.checker,p_next_move[0],p_next_move[1])
    print "\n"
    board.printBoard
    if board.is_win_for(player.checker)== true
        print "\n"
        print player.checker+ ' wins!  Congratulations!'
        print "\n"
        return true
    
    elsif board.is_full== true
        print "It's a tie!"
        print "\n"
        return true
    
    else
        return false
    end
end

print "\nWelcome to Tic Tac Toe\n To play against another player enter P\n to play against the computer enter C\n"

key=(gets.strip)
while ['P','C'].include?(key)==false
    print "\n To play against another player enter P\n to play against the computer enter C\n"
    key=(gets.strip)
end
if key =="P"
    tic_tac_toe(Player.new("X"),Player.new("O"))
elsif  key=="C"
    print "Player will be X computer will be O"
    tic_tac_toe(Player.new("X"),AIPlayer.new("O",3))
end
        





    
    

    