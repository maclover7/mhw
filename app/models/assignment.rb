class Assignment < ActiveRecord::Base
  belongs_to :course
  belongs_to :teacher

  validates_presence_of :name, :body
end
