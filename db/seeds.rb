# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



supermanager = User.create!(email: 'mahesh@mail.com', password: 'password', role: :manager, username: 'supermanager1')
manager = User.create!(email: 'gireesh@mail.com', password: 'password', role: :manager, username: 'manager', manager_id: supermanager.id)
User.create!(email: 'tazreen@mail.com', password: 'password', role: :manager, username: 'associate', manager_id: manager.id)
