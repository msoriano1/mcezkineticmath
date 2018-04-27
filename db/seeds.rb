# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# @student = Student.new(:email => 'student@example.com',
#                  :password => 'password',
#                  :password_confirmation => 'password')

@admin = Admin.new(:ausername => 'tmel',
                 :password => 'password',
                 :password_confirmation => 'password')
#Student.create!({email: 'student@test.com', password: 'password', password_confirmation: 'password', name: 'Steven'})
  #  puts "Student created!"
    
Teacher.create!({email: 'teacher@test.com', password: 'password', password_confirmation: 'password', name: 'Steven'})
    puts "Student created!"