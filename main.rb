#!/usr/bin/env ruby
require 'pry'
require './app'

def main
  app = App.new
  app.run
end

main
