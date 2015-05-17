class CourseFile < ActiveRecord::Base
  belongs_to :course

  validates_presence_of :name

  has_attached_file :file
  validates_attachment_content_type :file, :content_type => [/\Aimage/, "application/pdf"]
end
