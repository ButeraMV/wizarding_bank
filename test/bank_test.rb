require 'minitest/autorun'
require './lib/bank'
require './lib/person'

class BankTest < Minitest::Test
  def test_bank_can_be_created
    assert Bank.new('JP Morgan Chase')
  end

  def test_bank_has_name
    bank = Bank.new("JP Morgan Chase")
    assert_equal "JP Morgan Chase", bank.bank_name
  end

  def test_person_can_open_bank_account
    bank = Bank.new("JP Morgan Chase")
    person = Person.new('Minerva', 500)
    bank.open_account(person)

    assert_equal ({"JP Morgan Chase"=>0}), person.bank_accounts
  end
end