
class Board
    attr_accessor :height
    attr_accessor :width

    def initialize(d)
        @height=d
        @width=d
        @board=Array.new(@height) { Array.new(@width, " ") }
    end

 
    def printBoard
        (-1..@height-1).each do |r|
            (-1..@width-1).each do |c|
                if r==-1
                    print c unless c==-1 
                    print " | " unless c==-1
                    if c==-1
                        print "  | "
                    end
                else

                    if c==-1
                        print r unless r==-1
                        print " | "
                    else
                        print @board[r][c]
                        print " | " 
                    end
                end
            end
             print "\n-------------------\n"
         end
     end




    def add_checker(checker, row, col)
        if ((0..@height)===row && (0..@width)===col) \
            && @board[row][col]==" " \
            && (checker=='X' or checker=="O")
            @board[row][col]=checker 
        end
    end
    def remove_checker(row,col)
        @board[row][col]=" "
    end


        
    
        

    def clear
        @board=Array.new(@height) { Array.new(@width, " ") }
    end



    def can_add_to(row, col)
        if ((0..@height)===row && (0..@width)===col) && @board[row][col]==" "
            return true
        end
        return false
    end
        



    def is_full
        (0..@height-1).each do |r|
            (0..@width-1).each do |w|
                if can_add_to(r,w) 
                    return false
                end
            end
        end
        return true
    end






    def is_win_for(checker)
        """checks for a win for the specified checker
        """
        if is_horizontal_win(checker)== true or \
           is_vertical_win(checker)== true or \
           is_down_diagonal(checker)== true or \
           is_up_diagonal(checker) == true
            return true
        end
        return false
    end
    



    def is_horizontal_win(checker)
        """ Checks for a horizontal win for the specified checker.
        """
        (0..@height-1).each do |row|
            (0..@width-1).each do |col|
                if @board[row][col] != checker
                    break
                end
                if @board[row][col]== checker && col==@width-1
                    return true
                end

            end
        end
        return false
    end



    def is_vertical_win(checker)
        """ Checks for a vertical win for the specified checker
        """
        (0..@width-1).each do |col|
            (0..@height-1).each do |row|
                if @board[row][col]== checker && row==@height-1
                    return true
                end
                if @board[row][col] != checker
                    break
                end

            end
        end
        return false
    end


     



    def is_down_diagonal(checker)
        """ Checks for a down diagonal win for the specified checker
        """
        (0..@width-1).each do |d|
            if @board[d][d]!=checker
                return false
            end
        end
        return true
    end
        



    def is_up_diagonal(checker)
        """ Checks for a up diagonal win for the specified checker
        """
        (0..@width-1).each do |d|
            if @board[(@width-1)-d][d]!=checker
                return false
            end
        end
        return true
    end
end      