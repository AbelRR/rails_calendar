class AddUniqueMultiColumnIndexOnSectionStudent < ActiveRecord::Migration[5.2]
  def change
    add_index :section_students, [:user_id, :section_id], unique: true
  end
end
