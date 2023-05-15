require_relative 'person'
class Teacher < Person
  def initialize(specialization)
    super(age, parent_permission: true, name: 'Unknown')
    @specialization = specialization
  end
end
