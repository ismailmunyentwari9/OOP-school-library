require_relative 'person'

class Student < Person
  attr_accessor :classroom

  class Student < Person
    def classroom=(classroom)
      @classroom = classroom
      classroom.students.push(self) unless classroom.students.includes?(self)
    end

    def play_hooky
      '¯(ツ)/¯'
    end
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
