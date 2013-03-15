require './domain.rb'


describe @network, "#distance_between" do

  before :each do
    @network = Network.new
  end

  it "returns 0 for same person" do
    dave = Programmer.new("Dave")
    @network.add(dave)
    @network.distance_between(dave, dave).should eq 0

  end

  it "returns 1 for neighbour" do
    dave = Programmer.new("Dave")
    bob = Programmer.new("Bob")

    @network.add(dave)
    @network.add(bob)

    @network.recommendation(dave, bob)

    @network.distance_between(dave, bob).should eq 1
  end
end