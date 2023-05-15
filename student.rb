require_relative 'person'

class Student < Person
  def initialize(classroom)
    super(age, parent_permission: true, name: 'Unknown')
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
