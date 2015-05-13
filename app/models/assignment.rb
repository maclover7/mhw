class Assignment < ActiveRecord::Base
  belongs_to :course
  belongs_to :teacher
  has_many :student_assignments

  validates_presence_of :name, :body, :due_date
end
