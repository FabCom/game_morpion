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
      puts "#{player_name}, tu as de la chance ! C'est à toi de commencer.".green
    else
      puts "#{player_name}, c'est à ton tour de jouer.".green
    end
  end

  def board(board_lines)
    puts puts
    board_lines.each {|line| print " " * 25 ; puts line}
  end

  def ask_case
    puts puts
    puts "    Quelle case choisis-tu ?"
    print "    >"
  end
end
