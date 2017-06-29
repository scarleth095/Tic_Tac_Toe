
require_relative 'Board' 

class Player 
    attr_accessor :checker
    attr_accessor :num_moves
    def  initialize(checker)
        @checker=checker
        @num_moves=0
    end



    def  printPlayer
        print 'Player ' +@checker
       
    end



    def opponent_checker
        if @checker=='X'
            return 'O'
        else
            return 'X'
        end
    end



    def next_move(board)
        print "Enter a row: \n"
        row=(gets.strip).to_i
        print "Enter a column: \n"
        col=(gets.strip).to_i
        while board.can_add_to(row,col)== false do
            print 'Try again!'
            print "Enter a row: \n"
            row=(gets.strip).to_i
            print "Enter a column: \n"
            col=(gets.strip).to_i
        end
        @num_moves+=1
        return [row,col]
    end
end



        
            
            
                  
            
            
            
