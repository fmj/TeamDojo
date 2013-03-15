require './graphs.rb'

g = Graph.new
g.push "Dave"
g.push "Jason"
g.push "Tom"
g.push "Bob"
g.push "Emma"

g.connect "Dave", "Jason"
g.connect "Dave", "Tom"
g.connect "Dave", "Emma"
g.connect "Jason", "Bob"
g.connect "Tom", "Emma"
g.connect "Emma", "Bob"


puts g.dijkstra "Dave", "Bob"