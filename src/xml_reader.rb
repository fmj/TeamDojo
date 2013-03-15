require "Nokogiri"
require "domain.rb"

f = File.open("ProNet.xml")
doc = Nokogiri::XML(f)
f.close

#puts doc.xpath"/*[local-name()='Network']/*[local-name()='Programmer']"

values = doc.xpath("/*[local-name()='Network']/*[local-name()='Programmer']")

programmers = values.map do |programmer|
  name =  programmer.xpath"./@name"

  raw_skills = programmer.xpath"./*[local-name()='Skills']"
  skills2 =raw_skills.xpath("./*[local-name()='Skill']")
          skills = skills2.map do |skill|
            skill.text
          end
  #raw_recomends = programmer.xpath"./*[local-name()='Recommends']"
  #recomend = raw_recomends.xpath
  Programmer.new(name, 0, skills)
end


programmers[0].skills.each do |s|

  puts s
end

puts programmers[0].skills.size()

#programmers.each do |programmer|
#
#  puts programmer.name
#  puts programmer.kudos
#  programmer.skills.each do |s|
#  puts s
#    end
#end
