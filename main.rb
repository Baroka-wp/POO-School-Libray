#!/usr/bin/env ruby

require './teacher'
require './student'
require './person'
require './book'
require './app'

def main
  app = App.new
  app.run
end

main
