require 'yaml'
require 'byebug'
require 'ap'

count_before = Quality.count

puts '---------'
puts 'Seeding qualities'
puts '---------'

file = File.read 'db/seeds/data/qualities.yml'
data = YAML.safe_load(file)

data.each_with_index do |q, i|
  quality = OpenStruct.new(q)

  puts "#{i + 1} - #{quality.text}"

  record = Quality.find_by(slug: quality.slug)

  properties = OpenStruct.new(
    slug: quality.slug,
    text: quality.text,
    icon: quality.icon,
    gist: quality.gist
  )

  if record.nil?
    Quality.create!(properties.to_h)
  else
    record.update!(properties.to_h)
  end
end

puts '---------'
count_after = Quality.count
difference = count_after - count_before
puts "Before seeding, the database had #{count_before} qualities."
puts "After seeding, the database has #{count_after}."
puts "That's #{difference} new ones."
puts '---------'
puts 'Success!'
puts '---------'
puts ' '
