desc 'creates section_students'
task :create_section_students => :environment do
    SectionStudent.destroy_all
    Section.destroy_all
    Student.destroy_all
    Rake::Task[:create_fake_sections].invoke
    Rake::Task[:create_fake_students].invoke
    
    Section.pluck(:id).each do |id|       
      students = Student.pluck(:id)
      num_of_students_in_section = rand(1..(students.length / 2))
      visited_nums = []
      
      num_of_students_in_section.times do 
        rand_student_id = rand(0...students.length)

        while visited_nums.include? rand_student_id
          rand_student_id = rand(0...students.length)
        end

        visited_nums << rand_student_id

        SectionStudent.create!(
          user_id: students[rand_student_id],
          section_id: id
        )
      end
    end


  puts "Added students to classes"
end
