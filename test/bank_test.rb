require 'minitest/autorun'
require './lib/bank'
require './lib/person'

class BankTest < Minitest::Test
  def test_bank_can_be_created
    assert Bank.new('JP Morgan Chase')
  end

  def test_bank_has_name
    bank = Bank.new('JP Morgan Chase')
    assert_equal 'JP Morgan Chase', bank.bank_name
  end

  def test_person_can_open_bank_account
    bank = Bank.new('JP Morgan Chase')
    person = Person.new('Minerva', 500)
    bank.open_account(person)

    assert_equal ({'JP Morgan Chase' => 0}), person.bank_accounts
  end

  def test_bank_can_accept_deposits
    bank = Bank.new('Chase')
    person = Person.new('Minerva', 750)
    bank.open_account(person)
    bank.deposit(person, 250)

    assert_equal ({'Chase' => 250}), person.bank_accounts
    assert_equal 500, person.cash
  end

  def test_deposit_fails_not_enough_cash
    bank = Bank.new('Chase')
    person = Person.new('Minerva', 250)
    bank.open_account(person)
    bank.deposit(person, 500)

    assert_equal ({'Chase' => 0}), person.bank_accounts
    assert_equal 250, person.cash
  end

  def test_withdrawals
    bank = Bank.new('Chase')
    person = Person.new('Minerva', 750)
    bank.open_account(person)
    bank.deposit(person, 500)
    bank.withdrawal(person, 250)

    assert_equal ({'Chase' => 250}), person.bank_accounts
    assert_equal 500, person.cash
  end

  def test_for_insufficient_funds
    bank = Bank.new('Chase')
    person = Person.new('Minerva', 750)
    bank.open_account(person)
    bank.deposit(person, 500)
    bank.withdrawal(person, 750)

    assert_equal ({'Chase' => 500}), person.bank_accounts
    assert_equal 250, person.cash
  end

  def test_bank_cant_transfer_without_existing
    bank = Bank.new('Chase')
    bank2 = Bank.new('Wells Fargo')
    person = Person.new('Minerva', 750)
    bank.open_account(person)
    bank.deposit(person, 500)
    bank.transfer(person, bank2, 250)

    assert_equal ({'Chase' => 250}), person.bank_accounts
  end

  def test_bank_can_transfer_with_existing
    bank = Bank.new('Chase')
    bank2 = Bank.new('Wells Fargo')
    person = Person.new('Minerva', 750)
    bank.open_account(person)
    bank2.open_account(person)
    bank.deposit(person, 500)
    bank.transfer(person, bank2, 250)

    assert_equal ({'Chase' => 250, 'Wells Fargo' => 250}), person.bank_accounts
  end

  def test_total_cash
    bank = Bank.new('Chase')
    person = Person.new('Minerva', 750)
    person2 = Person.new('Luna', 500)
    bank.open_account(person)
    bank.open_account(person2)
    bank.deposit(person, 500)
    bank.deposit(person2, 250)
    result = bank.total_cash

    assert_equal 750, result
  end
end