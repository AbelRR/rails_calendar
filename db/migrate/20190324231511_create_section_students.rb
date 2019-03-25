class CreateSectionStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :section_students do |t|
      t.references :user, foreign_key: true
      t.references :section, foreign_key: true

      t.timestamps
    end
  end
end
