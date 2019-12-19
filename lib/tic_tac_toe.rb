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
    @board = [] 
    9.times {|index| @board[index] = " "}
  end 
  
  def display_board
    b = @board 
    puts " #{b[0]} | #{b[1]} | #{b[2]} "
    puts "-----------"
    puts " #{b[3]} | #{b[4]} | #{b[5]} "
    puts "-----------"
    puts " #{b[6]} | #{b[7]} | #{b[8]} "
  end 
  
  def input_to_index(position)
    position.to_i - 1
  end 
    
  def move(index, token = "X")
    @board[index] = token
  end 
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end 
  
  def valid_move?(index)
    (0..8) === index && !self.position_taken?(index)
  end 
      
  def turn_count
    (0..8).count{|i| position_taken?(i)}
  end
  
  def current_player
    (turn_count + 1).odd? ? "X" : "O" #player for next turn
  end 
  
  def turn 
    player = current_player
    puts "Your move, player #{player}"
    index = input_to_index(gets)
    while !valid_move?(index)
      puts "Invalid move"
      index = input_to_index(gets)
    end 
    move(index, player)
    display_board
  end 
  
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if win_combo.all?{|i| @board[i] == "X"} || win_combo.all?{|i| @board[i] == "O"}
        return win_combo 
      end 
    end 
    return nil 
  end 
  
  def full?
    @board.none?(" ")
  end 
  
  def draw?
    full? && !won?
  end 
  
  def over?
    won? || draw?
  end 
  
  def winner
    win_combo = won?
    if win_combo
      return @board[win_combo[0]]
    else 
      return nil 
    end 
  end 
  
  def play 
    while !over? do 
      turn 
    end 
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end 
  end
  
end 