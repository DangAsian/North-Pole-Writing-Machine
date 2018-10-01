require 'erb'

kids_data   = File.read('data/kids-data.txt')
naughty_letter = File.read('templates/naughty_letter_template.txt.erb')

kids_data.each_line do |kid|

  kid_data_array = kid.split

  name     = kid_data_array[0]
  behavior = kid_data_array[1]
  toys     = kid_data_array[2..7]
  infraction = kid.split("|")[1]
  rand_toy = toys.sample

  other_toys = ""

  toys.each do |toy|
    if toy != rand_toy || toy != "Kaleidoscope"
      other_toys += "#{toy}, "
    end
  end
  other_toys

  next unless behavior == 'naughty'

  filename    = 'letters/naughty/' + name + '.txt'
  letter_text = ERB.new(naughty_letter, nil, '-').result(binding)

  # puts letter_text
  puts "Writing #{filename}."
   File.write(filename, letter_text)

end

puts 'Done!'
