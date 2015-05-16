class AddAttachmentFileToCourseFiles < ActiveRecord::Migration
  def self.up
    change_table :course_files do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :course_files, :file
  end
end
