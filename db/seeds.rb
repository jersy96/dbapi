# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

File.open("hotels.csv", "r") do |f|
  f.each_line do |line|
    camps = line.split(';')
    h = Hotel.create(
      name: camps[0], address: camps[1], state: camps[2],
      phone: camps[3], fax: camps[4], email: camps[5],
      website: camps[6], hotel_type: camps[7], number_of_rooms: camps[8]
    )
    puts "created hotel #{h.name} with email #{h.email} and id #{h.id}"
  end
end
