class AddQuizCenterFieldsToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :quiz_center_category, :string
    add_column :assignments, :essay_prompt, :text
    add_column :assignments, :active, :boolean
  end
end
