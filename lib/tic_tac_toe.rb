require 'pry'
class TicTacToe
  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  def input_to_index(number)
    #When the current player inputs a number 1-9, the board gets the appropriate symbol on said space on the board
    number.to_i - 1
    
    
  end
  def position_taken?(index)
    if @board[index].include? ("X")
    true 
      elsif @board[index].include? ("O")
        true
      else 
        false
    end
  end
  def valid_move?(index)
      if position_taken? (index)
        false
      elsif index.to_i <= @board.length - 1 && index.to_i >= 0 #Array length - 1 for user input 
        true
      end
  end
  def move(index, player)
    @board[index] = player 
    
  
  end
  def turn
  number = gets
  index = input_to_index(number)
    if valid_move?(index)
      move(index,current_player)
    else 
      turn
    end 
    display_board
  end
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  def won?
   WIN_COMBINATIONS.each do |combos|
     one = combos[0]
     two = combos[1]
     three  = combos[2]
     if @board[one] == @board[two] && @board[one] == @board[three] && @board[one] != " "
       return combos
    end
    end
    return nil 
  end 
  def full?
    @board.all? {|symbol| symbol == "X" || symbol == "O" }
  end
  def draw?
    if won?
      false 
    elsif full?
    true #if !@board.include? WIN_COMBINATIONS true 
    end 
  end
    def over?
      if draw?
      true
      elsif won?
      true
      end
    end
  def winner
    if winning_array = won?
    index = winning_array.first
    @board[index]
  end
  end
  def play 
    until over? do 
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif puts "Congratulations #{winner}!"
    end
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
end