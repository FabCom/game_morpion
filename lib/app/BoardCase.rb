class BoardCase
  @@state_empty = ["       ","       ","       ","       ","       ","       ","       "]
  @@state_x =     ["#     #"," #   # ","  # #  ","   #   ","  # #  "," #   # ","#     #"]
  @@state_o =     ["#######","#     #","#     #","#     #","#     #","#     #","#######"]

  attr_accessor :state

  def initialize
    @state = @@state_empty
  end

  def self.state_empty
    @@state_empty
  end

  def self.state_x
    @@state_x
  end

  def self.state_o
    @@state_o
  end

  # def get_state
  #   self.state
  # end
  #
  # def is_empty?
  #   self.state == @state_empty ? true : false
  # end
  #
  # def is_x?
  #   self.state == @state_x ? true : false
  # end
  #
  # def is_o?
  #   self.state == @state_o ? true : false
  # end
end
