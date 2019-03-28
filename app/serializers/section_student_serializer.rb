class SectionStudentSerializer < ActiveModel::Serializer
  attributes :id, :section_id, :user_id
  belongs_to :student, foreign_key: "user_id"
  belongs_to :section
end
