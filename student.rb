require_relative 'person'

class Student < Person
  def initialize(classroom, age, parent_permission: true, name: 'Unknown')
    super(age, parent_permission: parent_permission, name: name)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
