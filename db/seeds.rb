# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Restaurant.delete_all
restaurants = [["Kikuya Japanese Restaurant", "1601 E 55th St, Chicago, IL 60615",7,"Japanese Restaurant","http://www.kikuyaonline.com/"],
            ["La Petite Folie", "1504 E 55th St, Chicago, IL 60615",10,"French Restaurant","http://www.lapetitefolie.com/"],
            ["Thai 55 Restaurant", "1607 E 55th St, Chicago, IL 60615",5,"Thai Restaurant","https://www.thai55restaurant.com/"],
            ["Jimmy John's", "1519 E 55th St, Chicago, IL 60615",8,"Sandwich Shop","https://www.jimmyjohns.com/"],
            ["Cafe 53", "1369 E 53rd St, Chicago, IL 60615",4,"Coffee Shop","http://www.cafe-53.com/"],
            ["Boston Market", "1424-28 E 53rd, Chicago, IL 60615",6,"Restaurant","http://www.bostonmarket.com/"],
            ["Giordano's", "5311 S Blackstone Ave, Chicago, IL 60615",10,"Pizza Restaurant","https://giordanos.com/locations/hyde-park/"],
            ["Nile Restaurant", "1162 E 55th St, Chicago, IL 60615",9,"Middle Eastern Restaurant","http://nilerestaurantofhydepark.com/"]]
restaurants.each do |restaurant|
    data = Restaurant.new
    data.name = restaurant[0]
    data.address = restaurant[1]
    data.table_num = restaurant[2]
    data.description = restaurant[3]
	data.web_link = restaurant[4]
    data.save
end

Reservation.delete_all
Review.delete_all
User.delete_all

users = [["Mengchen Liu", "000000",0,"mengchenl@uchicago.edu","+18729043525",true],
            ["mantra", "000000",10,"mantraliu@sina.cn","+18729043525",false],
            ["xiaowuya", "000000",50,"mantraliu1215@gmail.com","+18729043525",false],
            ["Carrie", "000000",30,"mengchen_l@yahoo.com","+18729043525",true],
            ["Alice", "000000",0,"xxx@gmail.com","+18729043525",false],
			["admin", "000000",0,"xxx@gmail.com","+18729043525",true],
            ["Yun", "000000",10,"xxx@gmail.com","+18729043525",false],
            ["Bob", "000000",20,"xxx@gmail.com","+18729043525",false],
            ["Vivi", "000000",0,"xxx@gmail.com","+18729043525",false]]
users.each do |user|
    data = User.new
    data.name = user[0]
    data.password = user[1]
    data.point = user[2]+10
    data.email = user[3]
	data.phone_number = user[4]
	data.is_admin = user[5]
    data.save
	2.times do
	r = Restaurant.sample
	Reservation.create restaurant_id: r.id, user_id: data.id, time: DateTime.new(2017,6,8.5), size: rand(1...5) 
	end
	1.times do
	r = Restaurant.sample
	Reservation.create restaurant_id: r.id, user_id: data.id, time: DateTime.new(2017,5,8.5), size: rand(1...5) 
	Review.create restaurant_id: r.id, user_id: data.id, content: "Great!", score: rand(1...5)
	end
	1.times do
	r = Restaurant.sample
	Reservation.create restaurant_id: r.id, user_id: data.id, time: DateTime.new(2017,4,8.5), size: rand(1...5) 
	end
end



	
