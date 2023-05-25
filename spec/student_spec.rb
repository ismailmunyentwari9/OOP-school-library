require_relative './student'
require_relative './persons

describe Student do
  context 'with an input of names and ages' do
    student = Student.new(23, 'Chebet', parent_permission = true)

    it 'expects age of student to be 23' do
      expect(student.age).to eql 23
    end
    it 'expects name of student to be Chebet' do
      expect(student.name).to eq 'Chebet'
    end

    it 'expect the student be part of a classroom' do
      expect(student.classroom).to eq true
    end
    it 'confirms if the student can play hookey' do
      # expect(student.play_hooky).to output('¯(ツ)/¯').to_stdout
      expect { student.play_hooky }.to output("¯(ツ)/¯\n").to_stdout
    end
  end
end