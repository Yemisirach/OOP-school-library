# frozen_string_literal: true

require_relative 'person'
# This a Student class
class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '"¯\(ツ)/¯"'
  end
end


