require "rubygems"
require "nokogiri"
require_relative "domain.rb"
require_relative "graphs.rb"

class XmlReader

  def initialize(filename)
    f = File.open(filename)
    @doc = Nokogiri::XML(f)
    f.close
    @values = @doc.xpath("/*[local-name()='Network']/*[local-name()='Programmer']")

    @network = Network.new

  end

  def self.from_string(xml_string)
    @doc = Nokogiri::XML(xml_string)
  end

  def get_network
    programmers = get_programmers()
    programmers2 = @values.map do |programmer|
      name = programmer.xpath "./@name"
      p1 = programmers[name]

      raw_recomends = programmer.xpath "./*[local-name()='Recommendations']"
      recomended = raw_recomends.xpath "./*[local-name()='Recommendation']"
      recomend = recomended.map do |rec|

        p2 = programmers[rec.text]
        if p2
          @network.recommendation(p1, p2)
        end
      end

    end
    @network
  end

  def get_programmers()
    programmers = Hash[@values.map do |programmer|
      name = programmer.xpath "./@name"

      raw_skills = programmer.xpath "./*[local-name()='Skills']"
      skills2 =raw_skills.xpath("./*[local-name()='Skill']")
      skills = skills2.map do |skill|
        skill.text
      end


      p =Programmer.new(name, 0, skills)
      @network.add(p)
      [name, p]
    end
    ]
    programmers
  end

  def recommends()
    programmers = @values.map do |programmer|
      raw_recomends = programmer.xpath "./*[local-name()='Recommendations']"
      recomended = raw_recomends.xpath "./*[local-name()='Recommendation']"
      recomend = recomended.map do |rec|
        rec.text
      end
    end
    recomend
  end
end

#programmers[0].skills.each do |s|
#
#  puts s
#end

#puts programmers[0].skills.size()

#programmers.each do |programmer|
#
#  puts programmer.name
#  puts programmer.kudos
#  programmer.skills.each do |s|
#  puts s
#    end
#end
