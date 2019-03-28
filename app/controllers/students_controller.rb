class StudentsController < ApplicationController
    def get_students
        @students = Student.all
        student = Student.first

        # render json: Student.new(student.as_json), adapter: :json
        render json: @students, each_serializer: StudentSerializer
    end
end