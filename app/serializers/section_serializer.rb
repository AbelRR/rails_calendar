class SectionSerializer < ActiveModel::Serializer
  attributes :id, :name, :date
  has_many :students, through: :section_students

end
