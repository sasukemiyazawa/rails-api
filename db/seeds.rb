# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Sasuke = Toko.create(name:"Sasuke", comment:"Hello!", Heart:5);
Sasuko = Toko.create(name:"Sasuko", comment:"Hi!", Heart:3);

Sasuke.image.attach(io: File.open(Rails.root.join('public/sasuke.png')), filename: 'sasuke.png')
Sasuko.image.attach(io: File.open(Rails.root.join('public/sasuko.png')), filename: 'sasuko.png')
