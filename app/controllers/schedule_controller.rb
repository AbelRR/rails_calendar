class ScheduleController < ApplicationController
    class SectionBlock
        def initialize()
            @students = []
            @section_data = {}
        end
        def students
            @students
        end
        def section_data
            @section_data
        end
        def add_student(student)
            @students << student
        end
        def add_section_data(section)
            @section_data = section
        end
    end
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
            section_name = "#{section.id}_#{section.name}"
            
            students = []
            section.students.each do |student|
                students << student
            end

            week_days[section_day][section_name] = {}
            week_days[section_day][section_name]['section'] = section
            week_days[section_day][section_name]['students'] = students
        end

        
        render json: week_days
    end
end