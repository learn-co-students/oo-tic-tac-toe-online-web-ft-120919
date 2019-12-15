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
    user_input = user_input.to_i
    user_input-1
  end
  
  def move(index, x_o="X")
    @board[index] = x_o 
    @board
  end 
  
  def position_taken?(board_index)
    @board[board_index] == " "? false : true
  end
  
  def valid_move?(board_index)
    !position_taken?(board_index) && board_index < 9 && board_index <= 0 ? true : false
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
    puts "What's your move, 1-9?"
    user_input = gets 
    player_index = input_to_index(user_input)
    x_o = current_player
    if valid_move?(player_index)
      move(player_index, x_o="X")
      display_board 
    else 
      puts "invalid"
      puts "What's your move, 1-9?"
      binding.pry
      user_input = gets 
      
      player_index = input_to_index(user_input)
      
    end
    
    
  end
  
  def winner
  end 
  
  def play 
  end 
end 