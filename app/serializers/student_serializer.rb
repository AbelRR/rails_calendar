class StudentSerializer < ActiveModel::Serializer
  attributes :id, :full_name 
  has_many :sections, through: :section_students

  def full_name
    object.first_name+ ' ' +object.last_name
  end

end
  