class ScheduleController < ApplicationController
    
    def weekly_schedule
        # returns data (in json format) for the weekly calendar at the school

        num_to_day_map = {
            0 => "sunday",
            1 => "monday",
            2 => "tuesday",
            3 => "wednesday",
            4 => "thursday",
            5 => "friday",
            6 => "saturday",
        }
        week_days = {
            "sunday" => [],
            "monday" => [],
            "tuesday" => [],
            "wednesday" => [],
            "thursday" => [],
            "friday" => [],
            "saturday" => [],
        }

        # iterate through sections
        Section.all.each do |section| 
            section_day = num_to_day_map[section.date.wday]

            week_day = week_days[section_day]
            
            students = section.students

            curr_section =  SectionSerializer.new(section)

            week_day.push(curr_section)
        end

        render json: week_days
    end
end