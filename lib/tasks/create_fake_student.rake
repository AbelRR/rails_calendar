desc 'creates fake students'
task :create_fake_students => :environment do
  require 'faker'  
  20.times do
    Student.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
    )
  end
  puts "created 20 students"
end
