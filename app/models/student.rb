class Student < User
    has_many :section_students, foreign_key: :user_id
    has_many :sections, through: :section_students
end
