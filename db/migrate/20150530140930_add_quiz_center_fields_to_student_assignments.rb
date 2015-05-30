class AddQuizCenterFieldsToStudentAssignments < ActiveRecord::Migration
  def change
    add_column :student_assignments, :essay_response, :text
    add_column :student_assignments, :submitted_at, :datetime
  end
end
