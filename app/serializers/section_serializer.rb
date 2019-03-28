class SectionSerializer < ActiveModel::Serializer
  attributes :id, :name, :date
  has_many :section_students
  has_many :students, through: :section_students

  # make custom section serializer for scheduleController 
  # SectionName - id {
  #   section: {
  #     name: "Criminology",
  #     date: "2019-02-19T00:00:00.000Z" ==> Tuesdays @ 12am
  #   },
  #   students: [
  #     {
  #     STUDENT SERIALIZER
  #     }
  #   ]
  # }

end
