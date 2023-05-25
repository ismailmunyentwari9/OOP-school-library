require_relative '../teacher'

RSpec.describe Teacher do
  let(:specialization) { 'Mathematics' }
  let(:age) { 35 }
  let(:name) { 'John Doe' }
  let(:parent_permission) { true }

  subject(:teacher) { Teacher.new(specialization, age, name: name, parent_permission: parent_permission) }

  describe '#initialize' do
    it 'sets the specialization correctly' do
      expect(teacher.specialization).to eq(specialization)
    end

    it 'sets the age correctly' do
      expect(teacher.age).to eq(age)
    end

    it 'sets the name correctly' do
      expect(teacher.name).to eq(name)
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
