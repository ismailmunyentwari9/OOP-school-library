require_relative '../student'
require_relative '../person'

describe Student do
  context 'with an input of names and ages' do
    let(:student) { Student.new(23, name: 'Chebet', parent_permission: true) }

    it 'expects age of student to be 23' do
      expect(student.age).to eq 23
    end

    it 'expects name of student to be Chebet' do
      expect(student.name).to eq 'Chebet'
    end

    it 'expects the student to be part of a classroom' do
      expect(student.classroom).to be_nil
    end

    it 'confirms if the student can play hooky' do
        expect { student.play_hooky([]) }.to output("¯(ツ)/¯\n").to_stdout
    end
  end
end
