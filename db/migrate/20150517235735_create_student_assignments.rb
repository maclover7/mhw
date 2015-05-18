class CreateStudentAssignments < ActiveRecord::Migration
  def change
    create_table :student_assignments do |t|
      t.integer :assignment_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
