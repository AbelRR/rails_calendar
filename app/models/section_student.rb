class SectionStudent < ApplicationRecord
  belongs_to :student, foreign_key: "user_id"
  belongs_to :section
end
