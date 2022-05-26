require_relative './app'
require './initialize'
require 'json'

puts 'Hey! Welcome to your app!'
init

def main
  app = App.new
  app.start
end
main
