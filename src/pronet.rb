require 'sinatra'
require_relative 'domain.rb'
require_relative 'xml_reader.rb'

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
  buffer = page_header

  buffer << "<a href='separation'>Degrees of separation</a><br />"
  buffer << "<a href='list'>Programmer list</a>"

  buffer << page_footer

  buffer
end

get '/separation' do

  #@network = Network.new
  #
  #@dave = Programmer.new("Dave")
  #@bob = Programmer.new("Bob")
  #
  #@network.add(@dave)
  #@network.add(@bob)

  reader = XmlReader.new("/Users/karianneberg/code/teamdojo/src/ProNet.xml")

  @network = reader.get_network

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

get '/list' do
  File.read(File.join('src', 'ProNet.xml'))
end

get '/strengths' do
  reader = XmlReader.new("/Users/karianneberg/code/teamdojo/src/ProNet.xml")

  @network = reader.get_network
  @programmers = reader.get_programmers
  jason = @programmers["Jason"]
  bill = @programmers["Bill"]
  frank = @programemrs["Frank"]
  team = [jason, bill, frank]
  buffer = page_header
  buffer << "team score for: #{team}"
  buffer << page_footer

  buffer
end
