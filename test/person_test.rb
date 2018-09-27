require 'minitest/autorun'
require './lib/person'

class PersonTest < Minitest::Test
  def test_person_exists
    assert Person.new("Minerva", 1000)
  end

  def test_person_can_have_a_name
    person = Person.new("Minerva", 1000)

    assert_equal "Minerva", person.name
  end

  def test_person_can_have_cash
    person = Person.new("Minerva", 1000)

    assert_equal 1000, person.cash
  end
end