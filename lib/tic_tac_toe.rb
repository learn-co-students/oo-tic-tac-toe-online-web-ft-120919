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
        token = current_player
        if valid_move?(index)
          move(index, token)
          display_board
        else
            turn
        end
    end
    def won?
        WIN_COMBINATIONS.detect do |combination|
          if (@board[combination[0]]) == "X" && (@board[combination[1]]) == "X" && (@board[combination[2]]) == "X"
            return combination
          elsif (@board[combination[0]]) == "O" && (@board[combination[1]]) == "O" && (@board[combination[2]]) == "O"
            return combination
          end
            false
        end
      end
      def full?
        @board.all? do |index|
             index == "X" || index == "O"
            end
     end

   def draw?
      if full? && !won? 
         true
      elsif won?
        false
      else
        false

      end
    end
    def over?
        if won? || full?
            true
        end
    end
    def winner
        WIN_COMBINATIONS.detect do |combination|
            if (@board[combination[0]]) == "X" && (@board[combination[1]]) == "X" && (@board[combination[2]]) == "X"
             return  "X"
            elsif (@board[combination[0]]) == "O" && (@board[combination[1]]) == "O" && (@board[combination[2]]) == "O"
             return  "O"
            end
          end
    end
    # def play
    #     if !over?
    #         turn
    #     elsif won?
    #         puts "Congratulations #{winner}!"
    #     elsif draw?
    #         puts "Cat's Game!"
    #     end
    # end
    def play
        until over? == true
          turn
        end
      
      
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
      end
      
end