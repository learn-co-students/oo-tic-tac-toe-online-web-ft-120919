class TicTacToe

  WIN_COMBINATIONS = [

    # Row wins
    [0,1,2],
    [3,4,5],
    [6,7,8],

    # Column wins
    [0,3,6],
    [1,4,7],
    [2,5,8],

    # Diagonal wins
    [0,4,8],
    [2,4,6]

    ]


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


  def input_to_index(user_input)

    # Keep in mind: 0-8 vs 1-9
    board_index = user_input.to_i - 1
  end


  def move(position, token = "X")
    @board[position] = token
  end


  def position_taken?(position)
    (@board[position] == "X") || (@board[position] == "O")
  end


  def valid_move?(index)
    (index.between?(0,8)) && (!position_taken?(index))
  end


  def turn_count

    turn_count = 0

    @board.each do |position|
      if position == "X" || position == "O"
        turn_count += 1
      end
    end

    turn_count

  end


  def current_player

    if turn_count % 2 == 0
      "X"
    else
      "O"
    end

  end


  def won?

    WIN_COMBINATIONS.detect do |win_combo|

      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return win_combo
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return win_combo
      else
        false
      end

    end

  end


  def turn

    puts "Enter a position (1-9):"

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


  def full?
    @board.all?{|occupied| occupied != " "}
  end


  def draw?
    !(won?) && (full?)
  end


  def over?
    won? || full? || draw?
  end


  def winner

    WIN_COMBINATIONS.detect do |win_combo|

      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return "X"
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return "O"
      else
        nil
      end

    end

  end


  def play

    while over? == false
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end

  end

end
