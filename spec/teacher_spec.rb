require_relative './teacher'
require_relative './person'

describe Teacher do
  context 'with a list of names and ages' do
    teacher = Teacher.new(56, 'Uche', 'specialization')

    it 'expects age of student to be 56' do
      expect(teacher.age).to eql 56
    end
    it 'expects name of student to be Uche' do
      expect(teacher.name).to eq 'Uche'
    end

    it 'expect the teacher to use services' do
      expect(teacher.can_use_services?).to eq true
    end
  end
end