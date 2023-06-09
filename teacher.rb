require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def inspect
    to_s
  end
end
