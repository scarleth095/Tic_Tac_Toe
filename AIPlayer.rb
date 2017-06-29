require_relative 'Player' 
class AIPlayer < Player
    def initialize(checker, lookahead)
        """ adds tiebreak and lookahead as parameters
        """
        if checker == 'X' or checker == 'O'
            if lookahead >= 0
                @checker=checker
                 @lookahead=lookahead
                
            end
        end
    end
    def printPlayer
        print 'Player ' +@checker+ '('+ @tiebreak +','+@ookahead+')'
    end
    def max(scores,board)
        m=-1
        (0..board.height-1).each do |row|
            (0..board.width-1).each do |col|
                if scores[row][col]>m
                        m=scores[row][col]
                end
            end
        end
        return m 
    end
    def max_score_row_column(scores,board)
        """ determines max score of list based on tiebreak
        """
         m=-1
         r=0
         c=0
        (0..board.height-1).each do |row|
            (0..board.width-1).each do |col|
               # print "\n"
               # print scores[row][col]
               # print m
                if scores[row][col]>m
                        m=scores[row][col]
                        r=row
                        c=col
                end
            end
        end
        return [r,c]
    end
    def scores_for(board) 
        """finds the score list for player based on lookahead
        """
        scores=Array.new(board.height) { Array.new(board.width, 0) }
        (0..board.height-1).each do |row|
            (0..board.width-1).each do |col|
                if board.can_add_to(row,col)==false
                    scores[row][col]=-1
                else
                    scores[row][col]=50
                end
            end
        end
        if @lookahead>0
            (0..@lookahead).each do |k| 
                opponent=AIPlayer.new("X", @lookahead-1)
                (0..board.height-1).each do |row|
                    (0..board.width-1).each do |col|
                        if scores[row][col]==50
                            board.add_checker(@checker,row,col)
                            if board.is_win_for(@checker)==true
                                scores[row][col]=100
                            elsif max(opponent.scores_for(board),board)==0
                                scores[row][col]=100
                            elsif max(opponent.scores_for(board),board)==100
                                scores[row][col]=0
                            end
                            board.remove_checker(row,col)
                        end
                    end
                end
            end
        end
        return scores
    end
                    
    def  next_move(board)
        """returns AI best next move
        """
        return max_score_row_column(scores_for(board),board)
    end
end
        
            
                
        
        
        
