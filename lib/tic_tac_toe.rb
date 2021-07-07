class TicTacToe
    attr_accessor :board 

    def initialize (board = nil)
        @board = board || @board = Array.new(9, " ")
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    WIN_COMBINATIONS = [
        [0,1,2], #top row
        [3,4,5], #middle row
        [6,7,8], #bottom row

        [0,3,6],
        [1,4,7],
        [2,5,8],

        [0,4,8],
        [2,4,6]
    ]

    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def input_to_index(input)
        num = input.to_i
        index_num = num - 1
    end

    def move(index, token=X)
        @board[index] = token
    end

    def position_taken?(index)
        # return false if [" ", "", nil].include?(board[index])
        # return true if ["X", "O"].include?(board[index])   # working
        # board[position] == "X" || board[position] == "O" # workiing
        board[index] == "X" || board[index] == "O"
    end

    def valid_move?(index)
        if position_taken?(index) || (index > 8 || index < 0)
            false
        else
            true
        end
    end

    def turn
        puts "Ask for input" #ask for user input
        input = gets
        index = input_to_index(input) #translate input into index
        if valid_move?(index)    #if index is valid
            move(index, current_player)   #make the move for index
            display_board
        else 
            puts "Pick another position" #ask for input again
            gets
        end     
    end

    def won?

        WIN_COMBINATIONS.any? do |combo|
            if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
                return combo
            end
        end
        # @board.detect do |index|
            #use variable WIN_COMBINATIONS and @board
    end
    def full?
        @board.all? {|index| index != " "}
        # @board.all? do |index|
        #     if position_taken?(index) == true
        #         return true
        #     else 
        #         false 
        #     end
        # end

     end

     def draw?
        !(won?) && (full?)
     end

     def over?
        won? || full? || draw?
     end

    #  def winner
    #     if won? == [X,X,X]
    #         return "X"
    #     else "O"
    #     end

    #  end

     def winner
        WIN_COMBINATIONS.detect do |win_combo|
          if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
            return "X"
          elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
            return "O"
          else
            nil
          end
        end
      end
      

     def play
        until over? # until the game is over
            turn        # take turns
        end
        if won?
            puts "Congratulations #{winner}!"
        else draw?
            puts "Cat's Game!"
        end
           
        #   if the game was won
        #     congratulate the winner
        #   else if the game was a draw
        #     tell the players it ended in a draw
        #   end
     end




    
end      
    

         


