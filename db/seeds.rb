# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
contact = Contact.new(first_name: "John", last_name: "Smith", email: "john@example.com", phone_number: "1234567890")
contact.save
contact = Contact.new(first_name: "Jane", last_name: "Doe", email: "jane@example.com", phone_number: "1234567890")
contact.save
contact = Contact.new(first_name: "People", last_name: "Person", email: "people@example.com", phone_number: "1234567890")
contact.save
