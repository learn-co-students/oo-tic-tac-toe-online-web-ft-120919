require 'pry'

class TicTacToe
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
      ]

  def initialize 
    @board = Array.new(9, " ")
  end 
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  
  def input_to_index(user_input)
    input = user_input.to_i - 1
    input
  end
  
  def move(index, x_o="X")
    @board[index] = x_o 
    
  end 
  
  def position_taken?(board_index)
    @board[board_index] == " " ? false : true
  end
  
  def valid_move?(board_index)
    !position_taken?(board_index) && board_index < 9 && board_index >= 0 ? true : false
  end 
  
  def turn_count
    count = 0
    @board.each { |b| 
      b != " " ? count +=1 : count
    }
    count
  end 
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end 
  
  
  def turn
    puts "Please enter a number (1-9):"
    user_input = gets.strip
    
    player_index = input_to_index(user_input)
    
    if valid_move?(player_index)
      # binding.pry
      x_o = current_player
      move(player_index, x_o)
      
    else
      # "invalid"
      
      turn
      
    end 
    display_board
    
  end
  
  
  def won?
    result = false
    i = 0 
    while i < WIN_COMBINATIONS.length do 
      if @board[WIN_COMBINATIONS[i][0]] == @board[WIN_COMBINATIONS[i][1]] && @board[WIN_COMBINATIONS[i][1]] == @board[WIN_COMBINATIONS[i][2]] && @board[WIN_COMBINATIONS[i][0]] != " " 
        result = WIN_COMBINATIONS[i]
      end
    i += 1
    end
    result 
  end 
  
  
  def full?
    turn_count == 9 ? true : false
  end 
  
  def draw?
    full? && !won? ? true : false
  end 
  
  def over?
    won? || full? || draw? ? true : false
  end
  
  def winner
    if won?
      @board[won?[0]]
    else
      nil
    end
  end 
  
  
  def play 
    
    until over?
      turn 
      
    end 
    
    if won?
      # winner
      # binding.pry
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  
  end 
  
end  

# binding.pry

# if valid_move?(player_index)
    #   move(player_index, x_o="X")
    #   display_board 
    # else 
    #   puts "invalid"
    #   puts "What's your move, 1-9?"
    #   user_input = gets 
    # user_input = 0