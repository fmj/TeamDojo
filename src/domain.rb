require './graphs.rb'

class Programmer
  def initialize(name, skills = [])
    @name = name
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
		@graph.connect(recommender, recommendee)
	end

	def distance_between(one, two)
		@graph.dijkstra(one, two)
	end
end

