class Assignment < ActiveRecord::Base
  belongs_to :course
  has_many :student_assignments
  belongs_to :teacher

  validates_presence_of :name, :body, :due_date
end
