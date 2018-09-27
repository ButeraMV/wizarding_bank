# Create a Person class to model a person. This person should have a name and a level of cash.
# person1 = Person.new("Minerva", 1000)
#
# Minerva has been created with 1000 galleons in cash.
#
# person2 = Person.new("Luna", 500)
#
# Luna has been created with 500 galleons in cash.
# The person class should store a person’s cash level, which banks they have an account with, and their balances at each bank.

class Person
  attr_reader :name,
              :cash

  def initialize(name, cash)
    @name = name
    @cash = cash
  end
end