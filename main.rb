#!/usr/bin/env ruby
require 'pry'
require './teacher'
require './student'
require './book'
require './app'

def main
  app = App.new
  app.run
end

main
