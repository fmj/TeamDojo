require 'sinatra'
require_relative 'domain.rb'

get '/' do

  @network = Network.new

  @dave = Programmer.new("Dave")
  @bob = Programmer.new("Bob")

  @network.add(@dave)
  @network.add(@bob)

  @network.recommendation(@dave, @bob)

  buffer = "<html><body><table><tr>"

  @network.all_programmers.each do |programmer|
    buffer << "<td>#{programmer.name}</td>"
  end

  buffer << "</body></html>"

  buffer
end
