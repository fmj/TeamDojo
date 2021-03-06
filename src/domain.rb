require_relative 'graphs.rb'

class Programmer

  attr_reader :name, :kudos, :skills
  def initialize(name, kudos = 0, skills = [])
    @name = name
    @kudos = kudos
    @skills = skills
  end
  
end

class Network

	def initialize
		@graph = Graph.new
	end

	def add(programmer)
		@graph.push(programmer)
	end

	def recommendation(recommender, recommendee)
		@graph.connect_mutually(recommender, recommendee)
	end

	def distance_between(one, two)
		@graph.dijkstra(one, two)
  end

  def has_recommendation?(recommender, recommendee)
    @graph.has_edge_between(recommender, recommendee)
  end

  def has_programmer(programmer)
    @graph.has_vertex(programmer)
  end

  def all_programmers
    @graph
  end

end

