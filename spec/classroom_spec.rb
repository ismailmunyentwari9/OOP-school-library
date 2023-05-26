require_relative '../classroom'

RSpec.describe Classroom do
  let(:classroom_label) { 'Math Class' }
  let(:student) { Student.new('John Doe') }

  subject(:classroom) { described_class.new(classroom_label) }
  let(:custom_students) { [] }

  before do
    allow(classroom).to receive(:students).and_return(custom_students)
  end

  describe '#initialize' do
    it 'sets the label correctly' do
      expect(classroom.label).to eq(classroom_label)
    end

    it 'initializes an empty students array' do
      expect(custom_students).to be_empty
    end
  end

  describe '#add_student' do
    it "adds a student to the classroom's students array" do
      classroom.add_student(student)
      expect(custom_students).to include(student)
    end

    it 'assigns the classroom to the student' do
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
