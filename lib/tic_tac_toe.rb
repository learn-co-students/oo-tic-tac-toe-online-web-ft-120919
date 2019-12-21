require "pry"

class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
    @winner = nil
  end
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  
  def beginning
    puts "Welcome to Tic Tac Toe!"
    display_board
  end
  
  def display_board
    puts ""
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts ""
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token               # return value?
  end
  
  def position_taken?(index)
    @board[index] != " "
  end
  
  def valid_move?(index)
    !position_taken?(index) && (0..8).include?(index)
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn
    completed = "no"
    token = current_player
    until completed == "yes"
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index) == true
        move(index, token)
        completed = "yes"
      end
    end
    display_board
  end
  
  def won?
    result = false
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|position| @board[position] == "X"}
        result = combo
        @winner = "X"
      elsif combo.all? {|position| @board[position] == "O"}
        result = combo
        @winner = "O"
      end
    end
    result
  end
  
  def full?
    @board.include?(" ") ? false : true
  end
  
  def draw?
    won? == false && full?
  end
  
  def over?
    won? != false || full?
  end
  
  def winner
    result = nil
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|position| @board[position] == "X"}
        result = "X"
      elsif combo.all? {|position| @board[position] == "O"}
        result = "O"
      end
    end
    result
  end
  
  def play
    beginning
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
  
end

