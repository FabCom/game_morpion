class Display

  @@title = File.read("./assets/title_mini.txt")

  def initialize
    system("clear")
  end

  def init
    ascii_art = File.read("./assets/title.txt")
    puts ascii_art.red
    puts puts
    puts "                           Appuie sur " + "ENTRER".brown + " pour commencer"
    gets.chomp
    system('clear')
  end

  def rules
    puts puts
    puts @@title.bold.red
    puts puts
    puts "    Bienvenue dans ce jeu du morpion dans lequel les joueurs vont s'affronter sur un plateau de 9 cases."
    puts puts
    puts "    L'objectif est de réussir à aligner 3 symboles à l'horizontal, à la vertical ou en diagonal."
  end

  def ask_name(index)
    puts puts
    puts "    Blaze du joueur #{index + 1}"
    print "    > "
  end

  def player_statut(turn, player_name)
    if turn == 1
      puts "        #{player_name}, tu as de la chance ! C'est à toi de commencer.".green.bold
    else
      puts "        #{player_name}, c'est à ton tour de jouer.".green.bold
    end
  end

  def board(board_lines)
    puts puts
    board_lines.each {|line| print " " * 25 ; puts line}
  end

  def ask_case
    puts puts
    puts "    Quelle case choisis-tu ?"
    print "    > "
  end

  def board_case_not_empty
    puts "    Cette case n'est pas vide, il te faut en choisir une autre."
    gets.chomp
  end

  def board_case_not_exist
    puts "    Cette case n'existe pas, il te faut en choisir une autre."
    gets.chomp
  end

  def end_game_winner(board_lines, player_win_name)
    system('clear')
    puts @@title.bold.red
    puts puts
    puts " " * 25 + "Partie terminée"
    puts puts
    puts " " * 15 + "Bravo #{player_win_name}".bold.green.blink
    board(board_lines)
  end

  def end_game_equality(board_lines)
    system('clear')
    puts @@title.bold.red
    puts puts
    puts " " * 25 + "Partie terminée"
    puts puts
    puts " " * 15 + "Aucun de vous deux n'a remporté la partie".bold.green.blink
    board(board_lines)
  end

  def ask_play_again(players)
    players.each do |player|
      puts player.scores
      puts puts
    end
    puts "    Une autre partie ?              Taper " + "0".brown + " pour ne plus jouer            Taper " + "1".brown + " pour continuer"
    print "    > "
  end
end
