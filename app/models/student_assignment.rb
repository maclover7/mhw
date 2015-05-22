class StudentAssignment < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :student

  def due_date
    self.assignment.due_date
  end

end
