require_relative '../teacher'
require_relative '../person'

describe Teacher do
  context 'with a list of names and ages' do
    let(:teacher) { Teacher.new('specialization', 56, name: 'Uche') }

    it 'expects age of teacher to be 56' do
      expect(teacher.age).to eq 56
    end

    it 'expects name of teacher to be Uche' do
      expect(teacher.name).to eq 'Uche'
    end

    it 'expects the teacher to be able to use services' do
      expect(teacher.can_use_services?).to eq true
    end
  end
end
