desc 'creates fake class section'
task :create_fake_section => :environment do
  require 'faker'  
  10.times do
    Section.create!(
    	name: Faker::Educator.subject,	
    	date: Faker::Date.backward(21)
    )
  end
  puts "created 10 sections"
end
