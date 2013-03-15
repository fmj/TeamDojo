require "Nokogiri"

f = File.open("ProNet.xml")
@doc = Nokogiri::XML(f)

puts doc.xpath"/*[local-name()='Network']/*[local-name()='Programmer']"

f.close

