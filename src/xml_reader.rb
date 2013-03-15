require "Nokogiri"

f = File.open("ProNet.xml")
doc = Nokogiri::XML(f)
f.close

