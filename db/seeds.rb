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

#@admin = Admin.new(:ausername => 'tmel',
                # :password => 'password',
                # :password_confirmation => 'password')
#Student.create!({email: 'student@test.com', password: 'password', password_confirmation: 'password', name: 'Steven'})
  #  puts "Student created!"
    

# Teacher.create(pusername: 'testeacher', password: 'password', password_confirmation: 'password')

# teacher = Teacher.create! :pusername => 'testeacher', :password => 'password', :password_confirmation => 'password', :firstname => "Te", :lastname => "Teacher"

# teacher = Teacher.create! :pusername => 'testeacher2', :password => 'password', :password_confirmation => 'password', :firstname => "Pe", :lastname => "Peacher"

# student = Student.create! :susername => 'testudent', :password => 'password', :password_confirmation => 'password', :firstname => "Te", :lastname => "Student"

# student = Student.create! :susername => 'testudent2', :password => 'password', :password_confirmation => 'password', :firstname => "Ge", :lastname => "Gtudent"

admin = Admin.create! :ausername => 'admin1', :password => 'rootroot', :password_confirmation => 'rootroot'

yearlevel = Yearlevel.create! :number => 1, :description => 'Introduction to math concepts of numerals, ordinals, arithmetic, decimals, fractions and others.'

yearlevel = Yearlevel.create! :number => 2, :description => 'Reinforcement of the introductory lessons of the first grade, dealing with problem solving.'

yearlevel = Yearlevel.create! :number => 3, :description => 'Integration of the first and second grade topics in preparation for real world problem solving.'

yearlevel = Yearlevel.create! :number => 4, :description => 'Fraction, Decimal and Factorization topics covering probability.'

yearlevel = Yearlevel.create! :number => 5, :description => 'Simple optmization problems, covering basic arithmetic, fractions, decimal and factorization. '

yearlevel = Yearlevel.create! :number => 6, :description => 'Real world applications of mathematics in problem solving.'

yearlevel = Yearlevel.create! :number => 7, :description => 'Introducion to algebra, abstracted mathematics.'

yearlevel = Yearlevel.create! :number => 8, :description => 'Introduction to geometry, spatial mathematics.'

yearlevel = Yearlevel.create! :number => 9, :description => 'Introduction to trigonometry, triangular geometry.'

yearlevel = Yearlevel.create! :number => 10, :description => 'Introdction to Precalculus and real world applications of mathematics.'

yearlevel = Yearlevel.create! :number => 11, :description => 'Precalculus, preparatory course for calculus.'

yearlevel = Yearlevel.create! :number => 12, :description => 'Calculus, curvilinear mathematics.'

# topic = Topic.create! :name => 'Addition 1', :description => 'Add stuff', :yearlevel_id => 3, :id => 3


