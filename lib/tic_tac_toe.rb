require 'pry'

class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

  WIN_COMBINATIONS =
    [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]

  ]  
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, player_token = "X")
    @board[index] = player_token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    index.between?(0,9) && !position_taken?(index)
  end

  def turn_count
    @board.count {|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Plese select a position between 1 and 9."
    user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(index)
      player_token = current_player
      move(index, player_token)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win|
      if (@board[win[0]]) == "X" && (@board[win[1]]) == "X" && (@board[win[2]]) == "X"
        return win
      elsif
        (@board[win[0]]) == "O" && (@board[win[1]]) == "O" && (@board[win[2]]) == "O"
        return win
      else
      end
    end
    return false
  end

  def full?
    @board.all? {|occupied| occupied != " "}
  end

  def draw? 
    !(won?) && (full?)
  end

  def over?
    won? || full? || draw?
  end

  def winner
    WIN_COMBINATIONS.each do |win|
      if (@board[win[0]]) == "X" && (@board[win[1]]) == "X" && (@board[win[2]]) == "X"
        return "X"
      elsif (@board[win[0]]) == "O" && (@board[win[1]]) == "O" && (@board[win[2]]) == "O"
        return "O"
      else
      end
    end
    nil
  end

  def play
    while over? == false
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      draw?
      puts "Cat's Game!"
    end
  end

end