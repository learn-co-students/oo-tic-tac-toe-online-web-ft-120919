class TicTacToe
    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]
    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
	    puts "-----------"
	    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
	    puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

    end
    def input_to_index(string_num)
         altered_string = string_num.to_i
        index = altered_string -1
    end
    def move(index, token = "X")
        @board[index] = token
    end
    def position_taken?(index)
        if @board[index] == "X" || @board[index] == "O"
            true
        else
            false
        end
    end
    def valid_move?(position)
        if @board[position]
            if @board[position] == "X" || @board[position] == "O"
                false
            else
                true
            end
        end
    
    end
    def turn_count
        @board.count {|position| position == "X" || position == "O"}
    end
    def current_player
        turn_count % 2 == 0 ? "X" : "O"      
    end
    def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        char = current_player
        if valid_move?(index)
          move(index, char)
          display_board
        else
          turn
        end
    end
        
end