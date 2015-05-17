class AddNameToCourseFiles < ActiveRecord::Migration
  def change
    add_column :course_files, :name, :string
  end
end
