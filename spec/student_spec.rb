require_relative '../student'

RSpec.describe Student do
  let(:age) { 16 }
  let(:name) { 'John Doe' }
  let(:parent_permission) { true }

  subject(:student) { Student.new(age, name: name, parent_permission: parent_permission) }

  describe '#initialize' do
    it 'sets the age correctly' do
      expect(student.age).to eq(age)
    end

    it 'sets the name correctly' do
      expect(student.name).to eq(name)
    end

    it 'sets the parent_permission correctly' do
      expect(student.parent_permission).to eq(parent_permission)
    end
  end

  describe '#classroom=' do
    let(:classroom) { double('Classroom', students: []) }

    it 'assigns the classroom to the student' do
      student.classroom = classroom
      expect(student.classroom).to eq(classroom)
    end

    it "adds the student to the classroom's students array" do
      student.classroom = classroom
      expect(classroom.students).to include(student)
    end

    it "does not add the student to the classroom's students array if already present" do
      classroom.students << student
      student.classroom = classroom
      expect(classroom.students.count(student)).to eq(1)
    end
  end

  describe '#play_hooky' do
    it 'returns the play hooky message' do
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
