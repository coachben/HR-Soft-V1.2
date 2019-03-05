# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#r1 = Role.create({name: "employee", description: "Can read data"})
#r2 = Role.create({name: "supervisor", description: "Can read and create items. Can update and destroy own items"})
#r3 = Role.create({name: "admin", description: "Can perform any CRUD operation on any resource"})

user1 = User.create!  :email => 'realtorben2012@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret',:superadmin_role => true
user2 = User.create!  :email => 'info@btdkenya.com', :password => 'topsecret', :password_confirmation => 'topsecret',:supervisor_role => true
user3 = User.create!  :email => 'ben.o@mail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
