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
    line01_x = ["A1","B1","C1"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_x)
    line02_x = ["A2","B2","C2"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_x)
    line03_x = ["A3","B3","C3"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_x)
    column01_x = ["A1","A2","A3"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_x)
    column02_x = ["B1","B2","B3"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_x)
    column03_x = ["C1","C2","C3"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_x)
    diag01_x = ["A1","B2","C3"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_x)
    diag02_x = ["A3","B2","C1"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_x)
    line01_o = ["A1","B1","C1"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_o)
    line02_o = ["A2","B2","C2"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_o)
    line03_o = ["A3","B3","C3"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_o)
    column01_o = ["A1","A2","A3"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_o)
    column02_o = ["B1","B2","B3"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_o)
    column03_o = ["C1","C2","C3"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_o)
    diag01_o = ["A1","B2","C3"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_o)
    diag02_o = ["A3","B2","C1"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_o)
    # line01 = ["A1","B1","C1"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_x || BoardCase.state_o)
    # line02 = ["A2","B2","C2"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_x || BoardCase.state_o)
    # line03 = ["A3","B3","C3"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_x || BoardCase.state_o)
    # column01 = ["A1","A2","A3"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_x || BoardCase.state_o)
    # column02 = ["B1","B2","B3"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_x || BoardCase.state_o)
    # column03 = ["C1","C2","C3"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_x || BoardCase.state_o)
    # diag01 = ["A1","B2","C3"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_x || BoardCase.state_o)
    # diag02 = ["A3","B2","C1"].map{|current|@board.board_cases[current].state}.all?(BoardCase.state_x || BoardCase.state_o)

    if line01_x || line02_x || line03_x || column01_x || column02_x || column03_x || diag01_x || diag02_x || line01_o || line02_o || line03_o || column01_o || column02_o || column03_o || diag01_o || diag02_o
      @game_statut = 0
    end
  end

  def edit_board_case(input)
    if @player_turn.symbol == "x"
      @board.board_cases[input].state = BoardCase.state_x
    else
      @board.board_cases[input].state = BoardCase.state_o
    end
  end

  def test_board_case(input)
    if Board.cases.include?(input) == true && @board.board_cases[input].state == BoardCase.state_empty
      edit_board_case(input)
    elsif Board.cases.include?(input) == false
      @screen.board_case_not_exist
      turn()
    elsif
      @screen.board_case_not_empty
      turn()
    end
  end

  def another_game?(winner)
    if @game_statut == 0
      @board.draw()
      @turn_counter = 10
      if winner != 0
        @screen.end_game_winner(@board.board_lines, winner.name)
        @players.each {|player| player == winner ? player.add_victory : player.add_defeat }
      elsif winner == 0
        @screen.end_game_equality(@board.board_lines)
      end
      @screen.ask_play_again(@players)
      input = gets.chomp
      if input == 0
        Application.end_game
      elsif input == 1
        Game.new(@players)
      end
    end
  end

  def turn
    while @turn_counter < 10 && @game_statut == 1
      @screen = Display.new
      @screen.rules()
      @board.draw()
      @screen.board(@board.board_lines)
      @screen.player_statut(@turn_counter, @player_turn.name)
      @screen.ask_case
      input = gets.chomp
      test_board_case(input)
      is_win()
      another_game?(winner = @player_turn )
      change_player_turn()
      @turn_counter += 1
    end
    another_game?(winner = 0)
  end
end
