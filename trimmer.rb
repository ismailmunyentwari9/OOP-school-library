require_relative 'base'
class TrimmerDecorator < BaseDecorator
  def correct_name
    name = @nameable.correct_name
    if name.length > 10
      name[0, 9]
    else
      name
    end
  end
end
