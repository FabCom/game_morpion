# frozen_string_literal: true

class Board
  attr_accessor :board_lines, :board_cases

  @@cases = %w[A1 B1 C1 A2 B2 C2 A3 B3 C3]

  def initialize
    @board_cases = {}
    @board_lines = Array.new(29)
    @@cases.each { |current| @board_cases[current] = BoardCase.new }
    draw
  end

  def draw
    line_counter_7 = 0
    @board_lines.each_index do |index|
      line_counter_7 = 0 if line_counter_7 == 7
      @board_lines[index] = ''
      case index
      when 0
        @board_lines[index] = "#{'A1'.brown}#{' ' * 13}|#{'B1'.brown}#{' ' * 13}|#{'C1'.brown}#{' ' * 15}"
        line_counter_7 -= 1
      when 1..7
        %w[A1 B1 C1].each do |board_case|
          @board_lines[index] <<  ' ' * 4 + @board_cases[board_case].state[line_counter_7].to_s + ' ' * 4
        end
        @board_lines[index].insert(15, '|')
        @board_lines[index].insert(31, '|')
      when 8
        @board_lines[index] = '-' * 47
        line_counter_7 -= 1
      when 9
        @board_lines[index] = "#{'A2'.brown}#{' ' * 13}|#{'B2'.brown}#{' ' * 13}|#{'C2'.brown}#{' ' * 15}"
        line_counter_7 -= 1
      when 10..16
        %w[A2 B2 C2].each do |board_case|
          @board_lines[index] <<  ' ' * 4 + @board_cases[board_case].state[line_counter_7].to_s + ' ' * 4
        end
        @board_lines[index].insert(15, '|')
        @board_lines[index].insert(31, '|')
      when 17
        @board_lines[index] = "#{' ' * 15}|#{' ' * 15}|#{' ' * 15}"
        line_counter_7 -= 1
      when 18
        @board_lines[index] = '-' * 47
        line_counter_7 -= 1
      when 19
        @board_lines[index] = "#{'A3'.brown}#{' ' * 13}|#{'B3'.brown}#{' ' * 13}|#{'C3'.brown}#{' ' * 15}"
        # line_counter_7 -= 1
      when 20..26
        %w[A3 B3 C3].each do |board_case|
          @board_lines[index] <<  ' ' * 4 + @board_cases[board_case].state[line_counter_7 - 1].to_s + ' ' * 4
        end
        @board_lines[index].insert(15, '|')
        @board_lines[index].insert(31, '|')
      when 27
        @board_lines[index] = "#{' ' * 15}|#{' ' * 15}|#{' ' * 15}"
        line_counter_7 -= 1
      end
      line_counter_7 += 1
    end
  end

  def self.cases
    @@cases
  end
end
