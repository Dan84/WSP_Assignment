# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Paul Thomas (trainer)",
             email: "trainer@example.ie",
             password:              "password",
             password_confirmation: "password",
             trainer: true)

User.create!(name:  "Daniel Murphy",
             email: "daniel@example.ie",
             password:              "password",
             password_confirmation: "password")

User.create!(name:  "Cian French",
             email: "cian@example.ie",
             password:              "password",
             password_confirmation: "password")

User.create!(name:  "Angela Tobin",
             email: "angela@example.ie",
             password:              "password",
             password_confirmation: "password")

User.create!(name:  "Pamela Lambert (trainer)",
             email: "pamela@example.ie",
             password:              "password",
             password_confirmation: "password",
			 trainer: true)


ClassStyle.create style: 'Kickboxing'
ClassStyle.create style: 'Pilates'
ClassStyle.create style: 'Yoga'
ClassStyle.create style: 'Boxercise'
ClassStyle.create style: 'Circuit Training'
ClassLevel.create level: 'Beginner'
ClassLevel.create level: 'Intermediate'
ClassLevel.create level: 'Advanced'