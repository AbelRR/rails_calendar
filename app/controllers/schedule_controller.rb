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
    
        days = {
            "sunday" => {},
            "monday" => {},
            "tuesday" => {},
            "wednesday" => {},
            "thursday" => {},
            "friday" => {},
            "saturday" => {},
        }

        week_days = Section.all.reduce(days) do |schedule, section|
            section_day = num_to_day_map[section.date.wday]
            schedule[section_day][section.name] = SectionSerializer.new(section)
            schedule
        end

        render json: week_days
    end
end