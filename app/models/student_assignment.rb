class StudentAssignment < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :student

  delegate :due_date, :name, :body, to: :assignment
end
