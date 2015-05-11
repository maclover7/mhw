class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :course_id
      t.integer :student_id

      t.timestamps null: false
    end
    add_index :enrollments, :course_id
    add_index :enrollments, :student_id
  end
end
