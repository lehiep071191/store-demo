# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
		fullname: 'lehiep',
		email: 'admin@lehiep.com',
		password: '123456',
		password_confirmation: '123456',
		address: 'Thanh Oai - Ha Noi',
		phone: '0355965021',	
		admin: true
);

20.times do |n|
	name = Faker::Name.name
	email = "user_#{n+1}@lehiep.com"
	password = 123456
	address = "Ha Noi"
	phone = "097394831#{n+1}"
	User.create(
		fullname: name,
		email: email,
		password: password,
		password_confirmation: password,
		address: address,
		phone: phone
	);

end
