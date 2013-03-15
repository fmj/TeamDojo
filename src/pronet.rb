require 'sinatra'
require_relative 'domain.rb'

def empty_cell
  "<td></td>"
end

def page_header
  "<html><body><table>"
end

def page_footer
  "</table></body></html>"
end

def table_header
  tablehead = ""

  tablehead << "<tr>"
  tablehead << empty_cell

  @network.all_programmers.each do |programmer|
    tablehead << "<td>#{programmer.name}</td>"
  end

  tablehead << "</tr>"

  tablehead
end

get '/' do

  @network = Network.new

  @dave = Programmer.new("Dave")
  @bob = Programmer.new("Bob")

  @network.add(@dave)
  @network.add(@bob)

  @network.recommendation(@dave, @bob)

  buffer = page_header

  buffer << table_header

  @network.all_programmers.each do |programmer|
    buffer << "<tr>"
    buffer << "<td>#{programmer.name}</td>"
    @network.all_programmers.each do |other_programmer|
      buffer << "<td>#{@network.distance_between(programmer, other_programmer)}</td>"
    end
    buffer << "</tr>"
  end


  buffer << page_footer

  buffer
end
