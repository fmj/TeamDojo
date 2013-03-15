bill = {'name' => "Bill", 'skills' => ['Java', 'C++'], 'recommends' => ['Ted']}
ted = {'name' => "Ted", 'skills' => ['Java', 'C++'], 'recommends' => []}

programmers = [bill, ted]

puts "name\tskills\trecommends"
programmers.each do |programmer| 
  puts programmer["name"] + "\t" + programmer["skills"].to_s  + "\t" + programmer['recommends'].to_s
end