#!/usr/bin/env ruby
require './helpers/options'
class App
  def initialize
    @options = Options.new
  end

  def run
    puts
    puts ' Welcome to School Library App ! '
    puts '--------***--------------'
    option = nil
    while option != 7
      puts 'Please choose an option by entrerin a number: '
      @options.options
      print '[Input number]: '
      option = gets.chomp.strip.to_i
      @options.make(option)
      puts
    end
    puts '--------***--------------'
    puts ' GOOD BYE 🎉🎉🎉'
    puts '--------***--------------'
  end
end
