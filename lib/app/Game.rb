class Game
  attr_accessor :turn_counter, :players, :player_turn, :game_id, :game_statut

  def initialize(players)
    @game_statut = 1
    @players = players
    define_first_player()
    @turn_counter = 1
    @board = Board.new
    turn()
  end

  def define_first_player
    @player_turn = @players.sample
    @players.each_with_index {|player, index| if player == @player_turn then @players[index].define_symbol("x") end}
    @players.each_with_index {|player, index| if player != @player_turn then @players[index].define_symbol("o") end}
  end

  def change_player_turn
    @player_turn = @players.select {|player| player != @player_turn}[0]
  end

  def is_win
    if @board.board_cases["A1"].state == @board.board_cases["A2"].state && @board.board_cases["A1"].state == @board.board_cases["A3"].state && @board.board_cases["A1"].state != BoardCase.state_empty then
      @game_statut = 0
    elsif @board.board_cases["B1"].state == @board.board_cases["B2"].state && @board.board_cases["B1"].state == @board.board_cases["B3"].state && @board.board_cases["B1"].state != BoardCase.state_empty then
      @game_statut = 0
    elsif @board.board_cases["C1"].state == @board.board_cases["C2"].state && @board.board_cases["C1"].state == @board.board_cases["C3"].state && @board.board_cases["C1"].state != BoardCase.state_empty then
      @game_statut = 0
    elsif @board.board_cases["A1"].state == @board.board_cases["B2"].state && @board.board_cases["A1"].state == @board.board_cases["C3"].state && @board.board_cases["A1"].state != BoardCase.state_empty then
      @game_statut = 0
    elsif @board.board_cases["C1"].state == @board.board_cases["B2"].state && @board.board_cases["C1"].state == @board.board_cases["A3"].state && @board.board_cases["C1"].state != BoardCase.state_empty then
      @game_statut = 0
    end
    puts @game_statut
  end

  def turn
    while @turn_counter < 10
      @screen = Display.new
      @screen.rules()
      puts @player_turn ; puts @player_turn.symbol
      @board.draw()
      @screen.board(@board.board_lines)
      @screen.player_statut(@turn_counter, @player_turn.name)
      @screen.ask_case
      input = gets.chomp
      # @board.board_cases[input].state = BoardCase.state_x
      # p @board.board_cases[input].state
      # gets.chomp
      if @player_turn.symbol == "x"
        @board.board_cases[input].state = BoardCase.state_x
      else
        @board.board_cases[input].state = BoardCase.state_o
      end
      is_win()
      change_player_turn()
      @turn_counter += 1
      if @game_statut == 0
        puts "Partie terminée"
        gets.chomp
      end
    end
  end
end
