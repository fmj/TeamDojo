require_relative 'domain'
require_relative 'xml_reader'

class XmlReaderTest

  describe "XmlMapper", "#get_network" do

    before :each do
      @reader = XmlReader.new("/Users/karianneberg/code/teamdojo/src/ProNet.xml")
    end

    it "finds programmers" do
      programmers = @reader.get_programmers()
      programmers.keys().size().should == 10
      p = programmers["Stu"]
      p.name.should == "Stu"
    end

    it "connects programmers" do

      @reader.get_network().all_programmers().size().should == 10
    end

    it "connects stu to frank" do
      programmers = @reader.get_programmers()
      stu = programmers["Stu"]
      frank = programmers["Frank"]
      network = @reader.get_network()
      network.has_programmer(stu).should be_true
      network.has_recommendation?(stu, frank).should be_true
    end
  end
end