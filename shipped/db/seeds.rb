# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

port_cities = ["Shanghai",
               "Singapore",
               "Guangzhou",
               "Qingdao",
               "Port Hedland",
               "Tianjin",
               "Rotterdam",
               "Ningbo",
               "Dalian",
               "Busan",
               "Hong Kong",
               "Qinhuangdao",
               "South Louisiana",
               "Port Kelang",
               "Houston",
               "Nagoya",
               "Antwerp",
               "Shenzhen",
               "Xiamen",
               "Dampier",
               "Dubai Ports",
               "Ulsan",
               "Chiba",
               "Newcastle",
               "Inchon",
               "Hamburg",
               "Metro Vancouver",
               "Kwangyang",
               "Tanjung Pelepas",
               "Kaohsiung",
               "Yokohama",
               "Yantian",
               "Hay Point",
               "New York/New Jersey",
               "Santos",
               "Tubarão",
               "Kitakyushu",
               "Gladstone",
               "Amsterdam Ports",
               "Saigon New Port",
               "Richards Bay",
               "Kobe",
               "Algeciras - La Linea",
               "Tokyo",
               "Osaka",
               "Beaumont",
               "Marseilles",
               "Bremen Ports",
               "Long Beach",
               "Corpus Christi",
               "New Orleans",
               "Bandar Abbas",
               "Taichung",
               "Laem Chabang",
               "Paradip",
               "Novorossisk",
               "Jubail",
               "Valencia",
               "Le Havre",
               "Hampton Roads, VA",
               "Saldanha Bay",
               "Jawaharlal Nehru",
               "Sepetiba/Itaguaí",
               "Daesan",
               "Baton Rouge, LA",
               "Bombay",
               "St. Petersburg",
               "Grimsby and Immingham",
               "Izmit (Kocaeli)",
               "Mobile",
               "Trieste",
               "Botas",
               "Jeddah",
               "Constantza",
               "Los Angeles",
               "Alexandria and El-Dekheila",
               "Pohang",
               "São Sebastião",
               "Primorsk",
               "Madras",
               "Lake Charles",
               "Tanjung Priok",
               "Colombo",
               "Genoa",
               "Manila",
               "Plaquemines",
               "Brisbane",
               "Chittagong",
               "Dunkirk",
               "Calcutta",
               "Paranaguá",
               "Bintulu",
               "Yanbu",
               "Barcelona",
               "Durban",
               "London",
               "Kota Baru",
               "Texas City, TX",
               "Karachi",
               "Calais"]

port_countries = ["China",
                  "Singapore",
                  "China",
                  "China",
                  "Australia",
                  "China",
                  "Netherlands",
                  "China",
                  "China",
                  "South Korea",
                  "China",
                  "China",
                  "United States",
                  "Malaysia",
                  "United States",
                  "Japan",
                  "Belgium",
                  "China",
                  "China",
                  "Australia",
                  "UAE",
                  "South Korea",
                  "Japan",
                  "Australia",
                  "South Korea",
                  "Germany",
                  "Canada",
                  "South Korea",
                  "Malaysia",
                  "Taiwan",
                  "Japan",
                  "China",
                  "Australia",
                  "United States",
                  "Brazil",
                  "Brazil",
                  "Japan",
                  "Australia",
                  "Netherlands",
                  "Viet Nam",
                  "South Africa",
                  "Japan",
                  "Spain",
                  "Japan",
                  "Japan",
                  "United States",
                  "France",
                  "Germany",
                  "United States",
                  "United States",
                  "United States",
                  "Iran",
                  "Taiwan",
                  "Thailand",
                  "India",
                  "Russia",
                  "Saudi Arabia",
                  "Spain",
                  "France",
                  "United States",
                  "South Africa",
                  "India",
                  "Brazil",
                  "South Korea",
                  "United States",
                  "India",
                  "Russia",
                  "United Kingdom",
                  "Turkey",
                  "United States",
                  "Italy",
                  "Turkey",
                  "Saudi Arabia",
                  "Romania",
                  "United States",
                  "Egypt",
                  "South Korea",
                  "Brazil",
                  "Russia",
                  "India",
                  "United States",
                  "Indonesia",
                  "Sri Lanka",
                  "Italy",
                  "Philippines",
                  "United States",
                  "Australia",
                  "Bangladesh",
                  "France",
                  "India",
                  "Brazil",
                  "Malaysia",
                  "Saudi Arabia",
                  "Spain",
                  "South Africa",
                  "United Kingdom",
                  "Indonesia",
                  "United States",
                  "Pakistan",
                  "France"]

port_list = Hash[port_cities.zip(port_countries)]

port_list.each do |key, val|
  Port.create(location: key + ", " + val)
end

15.times do
  User.create(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              password: 123456789,
              company: Faker::Company.name)
end

users = User.all
ports = Port.all

users.each do |user|
  3.times do
    random1 = rand(1..100)
    location = Port.find(random1).location

    user.boats.create(name: Faker::Cat.name,
                      location: location,
                      total_containers: 10,
                      available_containers: 5)
  end

  3.times do
    random2 = 0
    random3 = 0

    while random2 == random3 do
      random2 = rand(1..100)
      random3 = rand(1..100)
    end

    origin = Port.find(random2).location
    destination = Port.find(random3).location

    user.jobs.create(name: Faker::Hipster.word,
                     description: Faker::Lorem.paragraphs,
                     origin: origin,
                     destination: destination,
                     cost: rand(1000..500000),
                     needed_containers: rand(1..10))
  end

end

10.times do
  Route.create(boat_id: rand(1..45),
               job_id: rand(1..45))
end
