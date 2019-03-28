class ScheduleController < ApplicationController
    
    def weekly_schedule
        # returns data (in json format) for the weekly calendar at the school

        num_to_day_map = {
            0 => "Sunday",
            1 => "Monday",
            2 => "Tuesday",
            3 => "Wednesday",
            4 => "Thursday",
            5 => "Friday",
            6 => "Saturday",
        }
        week_days = {
            "Sunday" => {},
            "Monday" => {},
            "Tuesday" => {},
            "Wednesday" => {},
            "Thursday" => {},
            "Friday" => {},
            "Saturday" => {},
        }

        # iterate through sections
        Section.all.each do |section| 
            section_day = num_to_day_map[section.date.wday]
            section_name = "#{section.name} - #{section.id}"
            
            @students = section.students.map { |student| Student.new(student.as_json) }

            week_days[section_day][section_name] = {}
            week_days[section_day][section_name]['section'] = Section.new(section.as_json)
            week_days[section_day][section_name]['students'] = @students
        end

        
        # render json: week_days
        render json: week_days, each_serializer: SectionStudentSerializer
    end
end