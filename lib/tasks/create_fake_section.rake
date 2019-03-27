desc 'creates fake class section'
task :create_fake_sections => :environment do
  require 'faker'  
  15.times do
    Section.create!(
    	name: Faker::Educator.subject,	
    	date: Faker::Date.backward(100)
    )
  end
  puts "created 15 sections"
end
