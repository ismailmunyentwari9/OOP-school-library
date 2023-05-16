require_relative 'person'
require_relative 'base'
require_relative 'nameable'
require_relative 'capitalize'
require_relative 'trimmer'

person = Person.new(22)
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
capitalized_trimmed_person.correct_name
