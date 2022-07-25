

# This a Person class
class Person
  attr_accessor :name, :age, :rentals
  attr_reader :id

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, name = 'Unknown')
    # rubocop:enable Style/OptionalBooleanParameter
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @rentals = []
  end

end
