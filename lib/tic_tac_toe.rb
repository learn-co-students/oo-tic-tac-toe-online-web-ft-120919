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
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end #init

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "--------------------------------------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "--------------------------------------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end #display_board

  def input_to_index(user_str)
    index = user_str.to_i - 1
    index 
  end #input_to_index

  def move(index, symbol)
    @board[index] = symbol 
    @board 
  end #move

  def position_taken?(index)
    is_space = @board[index] == " "
    is_taken = !(is_space)
    is_taken 
  end #position_taken?

  def valid_move?(index)
    if position_taken?(index) || index < 0 || index > 8
      false
    else
      true
    end #if 
  end #valid_move?

  def turn_count
    count = 0
    @board.each do |spot|
      count += 1 if spot != " "
    end #each
    count 
  end #turn_count 

  def current_player
    turns_so_far = turn_count
    if turns_so_far % 2 == 0
      "X"
    else
      "O"
    end #if 
  end #current_player 

  def turn 
    print "Please enter position between 1 and 9: "
    user_choice = gets
    board_index = input_to_index(user_choice)
    symbol = current_player
 
    while !valid_move?(board_index) do
      print "Please enter position between 1 and 9: "
      user_choice = gets
      board_index = input_to_index(user_choice)
    end #while

    move(board_index, symbol)
    display_board
  end #turn 

  def won? 
    winner_exists = false
    winning_combo = []
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == @board[combo[1]] and @board[combo[1]] == @board[combo[2]] and (@board[combo[0]] == 'X' or @board[combo[0]] == 'O')
        winner_exists = true
        winning_combo = combo
      end #if
    end #each
    
    if winner_exists
      winning_combo
    else
      false
    end #if
  end #won 

  def full?
    if turn_count == 9
      true
    else
      false
    end #if 
  end #full?

  def draw?
    if full? and !won?
      true
    else
      false
    end #if 
  end #draw?

  def over?
    if won? || draw?
      true
    else
      false
    end #if
  end #over?

  def winner
    the_winner = won? ? @board[won?[0]] : nil 
  end #winner

  def play 
    while !over? do
        turn 
    end #while

    if won?
      puts "Congratulations #{winner}!"
    else 
      puts "Cat's Game!"
    end #if
  end #play

end #class TicTacToe