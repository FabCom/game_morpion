# frozen_string_literal: true

class BoardCase
  @@state_empty = ['       ', '       ', '       ', '       ', '       ', '       ', '       ']
  @@state_x =     ['#     #', ' #   # ', '  # #  ', '   #   ', '  # #  ', ' #   # ', '#     #']
  @@state_o =     ['#######', '#     #', '#     #', '#     #', '#     #', '#     #', '#######']

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

  def is_empty?
    state == @@state_empty
  end
end
