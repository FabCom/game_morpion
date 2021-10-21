class Player
  attr_accessor :name, :symbol, :results

  def initialize
    @name = ask_name()
    @results = [0,0] #[victories, defeats]
  end

  def ask_name
    gets.chomp.to_s
  end

  def add_victory
    @results[0] += 1
  end

  def add_defeat
    @results[1] += 1
  end

  def state
    @name + " : #{@results[0]} parties gagnées et #{@results[0]} parties perdues"
  end

  def define_symbol(symbol)
    @symbol = symbol
  end

  def get_symbol
    @symbol
  end
end
