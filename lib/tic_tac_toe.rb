require 'pry'
class TicTacToe

    def initialize(board = nil)
       # assigns an instance variable @board to an array with 9 blank spaces " "
       @board = board || Array.new(9, " ")
    end

        #defines a constant WIN_COMBINATIONS with arrays for each win combination
        WIN_COMBINATIONS = [
            [0,1,2], 
            [3,4,5],
            [6,7,8],
            [0,3,6],
            [1,4,7],
            [2,5,8],
            [0,4,8],
            [6,4,2] 
            ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        #accepts the user's input (a string) as an argument
        #converts the user's input (a string) into an integer
        #converts the user's input from the user-friendly format (on a 1-9 scale) to the 
        #array-friendly format (where the first index starts at 0)
        input.to_i - 1
    end

    def move(position, token)
        @board[position] = token
    end

    def position_taken?(position)
        #returns true/false based on whether the position on the board is already occupied
        # binding.pry
        @board[position] != " "
    end

    # def valid_move?(position)
    #     @board[position] == " "
    #     # position.between(0,8) && !position_taken?(position)
    # end

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
      end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end
    
    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        # ask for input
        puts "Please enter 1-9:"
        user_input = gets.strip #gets input
        index = input_to_index(user_input) # translate input into index
        if valid_move?(index) #if index is valid
            cp = current_player
            move(index, cp) # make the move for index
            display_board # show the board
        else
            turn #ask for input again
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |win_combo|
          if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
            return win_combo
          elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
            return win_combo
          end
            false
        end
      end

    def full?
        @board.all? {|occupied| occupied != " "}
    end
    
    def draw?
        !(won?) && (full?)
    end
    
    def over?
        won? || draw?    
    end
    
    def winner
        winning_combo = won?
        if winning_combo
            return @board[winning_combo[0]]
        end
    end

    def play
        while !over?
          turn
        end
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
    end

end