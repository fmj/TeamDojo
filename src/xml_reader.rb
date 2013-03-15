require "Nokogiri"
require "domain.rb"

def get_programmers(values, network)
  programmers = Hash[values.map do |programmer|
    name = programmer.xpath "./@name"

    raw_skills = programmer.xpath "./*[local-name()='Skills']"
    skills2 =raw_skills.xpath("./*[local-name()='Skill']")
    skills = skills2.map do |skill|
      skill.text
    end


    p =Programmer.new(name, 0, skills)
    network.add(p)
    [name, p]
  end
  ]
  programmers
end


def get_network

  f = File.open("ProNet.xml")
  doc = Nokogiri::XML(f)
  f.close

  #puts doc.xpath"/*[local-name()='Network']/*[local-name()='Programmer']"

  values = doc.xpath("/*[local-name()='Network']/*[local-name()='Programmer']")

  network = Network.new

  programmers =get_programmers(values, network)
  programmers2 = values.map do |programmer|
    name = programmer.xpath "./@name"
    p1 =programmers[name]

    raw_recomends = programmer.xpath "./*[local-name()='Recommendations']"
    recomended = raw_recomends.xpath "./*[local-name()='Recommendation']"
    recomend = recomended.map do |rec|

      p2 = programmers[rec.text]
      network.recommendation(p1, p2)
    end

  end
  network
end

puts get_network


get_network()

def recommends(values, programmer, network)
  programmers = values.map do |programmer|
    raw_recomends = programmer.xpath "./*[local-name()='Recommendations']"
    recomended = raw_recomends.xpath "./*[local-name()='Recommendation']"
    recomend = recomended.map do |rec|
      rec.text
    end
  end
  recomend
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
