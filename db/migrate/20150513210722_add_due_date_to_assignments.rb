class AddDueDateToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :due_date, :datetime
  end
end
