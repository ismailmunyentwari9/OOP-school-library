class Nameable
  def initialize(name)
    @name = name
  end

  def correct_name
    raise NotImplementedError, "#{self.class} Has no Emplemented Method #{__method__}'"
  end
end
