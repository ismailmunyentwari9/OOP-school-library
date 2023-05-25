require_relative '../classroom'
require_relative '../students'

describe Classroom do
  context 'when an instance created and parameter passed' do
    classroom = Classroom.new 'ruby classroom'

    it 'expect classroom to be ruby classroom' do
      expect(classroom.label).to eq 'ruby classroom'
    end

    it 'expect the classroom to have students' do
      student = Student.new(45, 'Chebet', true)
      classroom.adding_students(student)
      expect(classroom.students).to eq [student]
    end
  end
end