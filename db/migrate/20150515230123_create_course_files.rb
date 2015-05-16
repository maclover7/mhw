class CreateCourseFiles < ActiveRecord::Migration
  def change
    create_table :course_files do |t|
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
