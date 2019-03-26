class ScheduleController < ApplicationController
    def weekly_schedule
        # TODO: 
        # return data (in json format) for the weekly calendar at the school
        # filter SectionStudents whose sections fall within a weeks range

        def event_in_range(timestamp)
            require 'time'
            three_days = 259200
            three_days_ago = Time.now.to_i - three_days
            three_days_from_now = Time.now.to_i + three_days
            range = three_days..three_days_from_now

            range === timestamp.to_i
        end

        all_sections = SectionStudent.all.map do |section_student|
            section_student.reload_section              
        end

        sections_in_week = all_sections.filter do |section|
            section_date = section.date
            event_in_range(section_date)
        end

        # range === Time.now
        # user = SectionStudent.find(1).reload_section
        render json: sections_in_week
    end
end