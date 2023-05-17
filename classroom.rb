class Classroom
  attr_accessor :label, :student

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    students << student
  end
end
