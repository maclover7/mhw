class AddCompletedToStudentAssignments < ActiveRecord::Migration
  def change
    add_column :student_assignments, :completed, :boolean
  end
end
