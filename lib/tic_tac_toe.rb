class TicTacToe
  
    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]
    
  def initialize
    @board = [" "," " ," " ," " ," " ," " ," " ," " ," " ]
  end 
  

 def  display_board
   p " #{@board[0]} | #{@board[1]} | #{@board[2]} "
	    p "-----------"
	    p " #{@board[3]} | #{@board[4]} | #{@board[5]} "
	    p "-----------"
        p " #{@board[6]} | #{@board[7]} | #{@board[8]} "

    end
 
 
 def input_to_index(string)
   user_index = string.to_i 
   array_index = user_index - 1
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
    
 def valid_move?(array_index)
        if array_index.between?(0,8)
            if !(position_taken?(array_index))
                true
            else
                false 
            end 
        else
            false
        end
    end   
  
   def turn_count
        turn_num = @board.count{|space| space == "X" || space == "O"}
    end

    def current_player
        if turn_count % 2 == 0
            "X"
        else
            "O"
        end
    end

    def turn 
        puts "Please enter a position to place your token (b/w 1 and 9 inclusive):"
        user_index = gets.chomp
        array_index = input_to_index(user_index)
        player_token = current_player
        if valid_move?(array_index)
            move(array_index, player_token)
            display_board
        else
            puts "Sorry, that input was invalid. Please enter a position to place your token (b/w 1 and 9 inclusive): "
            user_index = gets.chomp
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |win_combo|
            if (@board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X") 
                return win_combo
            elsif (@board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O")
                return win_combo
            end
            false
        end 
    end

    def full?
        @board.all? do |space|
            space != " "
        end
    end

    def draw?
        !(won?) && full?
    end

    def over?
        won? || draw?
    end

    def winner
        WIN_COMBINATIONS.detect do |win_combo|
            if (@board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X") 
                return "X"
            elsif (@board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O")
                return "O"
            end
            nil
        end 
    end

    def play
        until over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif
            puts "Cat's Game!"
        end
    end
 
end 

