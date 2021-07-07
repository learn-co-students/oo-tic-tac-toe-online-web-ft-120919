require 'pry'

class TicTacToe
  attr_accessor :won_by, :board

=begin
Define a WIN_COMBINATIONS constant within the TicTacToe class, and set
it equal to a nested array filled with the index values for the
various winning combinations possible in Tic Tac Toe.
=end
  WIN_COMBINATIONS = [
      [0,1,2], # Top row
      [3,4,5],  # Middle row
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
  ]

def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

=begin
The pseudocode for the #turn method:
ask for input
get input
translate input into index
if index is valid
 make the move for index
 show the board
else
 ask for input again
end
=end
  def turn
    puts "Please enter 1-9:" # 1. Ask the user for their move by specifying a position between 1-9.
    user_input = gets.strip # 2. Receive the user's input.
    #binding.pry
    index = input_to_index(user_input) # 3. Translate that input into an index value.

    if valid_move?(index) # If the move is valid, make the move and display the board.
      move(index)
      display_board
    else
      turn
    end

  end

=begin
  Define a method into which we can pass user input (in the form of a string, e.g., "1", "5", etc.)
  and have it return to us the corresponding index of the @board array.
=end
  def input_to_index(input)
    i = input.to_i
    # following takes input
    index = i-1
    return index
  end

=begin
  Your #move method must take in two arguments: the index in the @board array that the player chooses
  and the player's token (either "X" or "O"). The second argument, the player's token, should default to "X".
=end
  def move(index, token = "X")
    token = current_player
    @board[index] = token
  end


=begin
Will check to see if that position on the @board is vacant or
if it contains an "X" or an "O". If the position is free, the method should return false
(i.e., "the position is not taken"); otherwise, it will return true.
=end
def position_taken?(index)
  if (@board[index]=="X" || @board[index]=="O")
    return true
  end
  return false
end

=begin
method valid_move?  that accepts a position to check and returns true if the move is valid
and false or nil if not.
A valid move means that the submitted position is:
- Present on the game board.
- Not already filled with a token.
=end
# This INDEX starts at zero
def valid_move?(index)
  if (!position_taken?(index) && index.between?(0,8))
    return true
  end
  return false
end

# whose turn is it ? is it x or o?
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

=begin
Your #won? method should return false/nil if there is no win combination present
in the board
and return the winning combination indexes as an array if there is a win.
=end
  def won?
    WIN_COMBINATIONS.each do |combo|
      i1=combo[0]
      i2=combo[1]
      i3=combo[2]
      i1eqi2=(@board[i1]==@board[i2])
      i2eqi3=(@board[i2]==@board[i3])
      empty = @board[i1]==" "
      if (i1eqi2 && i2eqi3 && !empty)
          @won_by = @board[i1]
          return combo
        end
    end
    return false
  end

=begin draw? that returns true if the board is full and has not been won,
 false if the board is won, and false if the board is neither won nor full.
=end
  def draw?
    if won?
      return false
    elsif full?
      return true
    else # over
      return false
    end
  end

# full? method should return true if every element in the board contains either an "X" or an "O".
  def full?
    return turn_count==9
  end

# over? that returns true if the board has been won or is full (i.e., is a draw).
  def over?
    if (won? || draw?)
      return true
    end
    return false
  end

#  given a winning @board, the winner method should return the token, "X" or "O", that has won the game.
  def winner
    if (won?)
      return @won_by
    end
  end

=begin
The play method is the main method of the Tic Tac Toe application and is responsible for the game loop.
until the game is over
  take turns
end

if the game was won
  congratulate the winner
else if the game was a draw
  tell the players it ended in a draw
end
=end
  def play
    #binding.pry
    puts "Welcome to Tic Tac Toe"
    display_board

    while (!over?)
      turn
    end

    if(won?)
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

# what turn is it? counts the number of xs and os in tic tac toe
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
end
