class TicTacToe

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2,]]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, token)
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] == nil || @board[index] == "" || @board[index] == " " ? false : true
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0, 8)
    end

    def turn_count
        count = 0
        count += @board.count("X")
        count += @board.count("O")
        count
    end

    def current_player
        turn_count.odd? ? "O" : "X"
    end

    def turn
        puts "Please enter 1-9"
        input = gets.strip
        index = input_to_index(input)
        valid_move?(index) ? move(index, current_player) : turn
        display_board
    end

    def won?
        win = nil
        WIN_COMBINATIONS.each do |combo|
            combo.all?{|i| @board[i] == "X"} || combo.all?{|i| @board[i] == "O"} ? win = combo : false
        end
        win == nil ? false : win
    end
    
    def full?
        @board.none?(" ") 
    end

    def draw?
        full? && won? == false
    end

    def over?
        draw? || won? 
    end

    def winner
        won? ? turn_count.odd? ? "X" : "O" : nil
    end

    def play
        while !over?
            turn
        end
        puts won? ? "Congratulations #{winner}!" : "Cat's Game!"
    end

end