class TicTacToe
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
    ]
  
  
  def initialize(board=nil)
     @board = Array.new(9, " ")
  end 
  
  
  def input_to_index(input)
    input.to_i-1
  end 
  
  
  def valid_move?(input)
    input.between?(0, 8) && !position_taken?(input)
  end 
  
  def move(input, player)
    @board[input] = player
    
  end 
  
  
  def full?
    @board.all? do |token|
      if token == "X" || token == "O"
        true 
      else 
        false 
  end 
end 
  end 
  
  
  def turn
    puts "Please pick 1-9"
    input = gets.strip
    index = input_to_index(input)
    player = current_player
    if valid_move?(index)
      move(index, player)
      display_board
    else 
      turn
    end 
  end 
  
  
  def won?
      winning = nil
    WIN_COMBINATIONS.each do |win_combo|
      row1 = win_combo[0]
      row2 = win_combo[1]
      row3 = win_combo[2]
      if @board[row1] == "X" && @board[row2] == "X" && @board[row3] == "X"
       winning = win_combo
      elsif 
      if @board[row1] == "O" && @board[row2] == "O" && @board[row3] == "O"
       winning = win_combo
    end
  end 
end 
winning
  end 
  
  
  def position_taken?(input)
   @board[input] == "X" || @board[input] == "O"
  end 
  
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end 
  
  
  def current_player
     turn_count % 2 == 0 ? "X" : "O"
  end 

  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  
  def draw?
    !won? && full?
  end 
  
  
  def over? 
    draw? || won?
  end 
  
  
  def winner
    if winning = won?
      @board[winning.first]
  end 
end 
  
  def play 
    until over?  
      turn 
    end 
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end 
  end 
end 