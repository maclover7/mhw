require "rails_helper"

describe CreateStudentAssignmentJob do

  describe '.enqueue' do
    it "enqueues a job" do
      assignment = FactoryGirl.create(:assignment)
      allow(Delayed::Job).to receive(:enqueue)

      CreateStudentAssignmentJob.enqueue(assignment.id)

      expect(Delayed::Job).to have_received(:enqueue).with(kind_of(CreateStudentAssignmentJob))
    end
  end

  describe '#perform' do
    it 'creates a student_assignment' do
      assignment = FactoryGirl.create(:assignment)

      CreateStudentAssignmentJob.new(assignment.id).perform
    end
  end
end
