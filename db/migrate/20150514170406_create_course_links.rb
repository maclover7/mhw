class CreateCourseLinks < ActiveRecord::Migration
  def change
    create_table :course_links do |t|
      t.integer :course_id
      t.string :name
      t.string :url

      t.timestamps null: false
    end
  end
end
