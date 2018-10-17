class Bank
  attr_accessor :accounts
  attr_reader :bank_name
  def initialize(bank_name)
    @bank_name = bank_name
    @accounts = []
    puts "#{bank_name} has been created."
  end

  def open_account(person)
    person.bank_accounts[bank_name] = 0
    puts "An account has been opened for #{person.name} with #{bank_name}."
    @accounts << person
  end

  def deposit(person, amount)
    if person.cash >= amount
      person.cash = person.cash - amount.to_i
      person.bank_accounts[bank_name] = amount.to_i
      puts "#{amount} galleons have been deposited into #{person.name}'s #{bank_name} account. Balance: #{person.bank_accounts[bank_name]} Cash: #{person.cash}"
    else
      puts "#{person.name} does not have enough cash to perform this deposit."
    end
  end

  def withdrawal(person, amount)
    if person.bank_accounts[bank_name] >= amount
      person.bank_accounts[bank_name] -= amount.to_i
      person.cash += amount.to_i
      puts "#{person.name} has withdrawn #{amount} galleons. Balance: #{person.bank_accounts[bank_name]}"
    else
      puts "Insufficient funds."
    end
  end

  def transfer(person, bank, amount)
    if person.bank_accounts[bank_name] >= amount
      person.bank_accounts[bank_name] -= amount.to_i
      if person.bank_accounts[bank.bank_name] != nil
        person.bank_accounts[bank.bank_name] += amount.to_i
      else
        puts "#{person.name} does not have an account with #{bank.bank_name}"
      end
      puts "#{person.name} has transferred #{amount} galleons from #{bank_name} to #{bank.bank_name}."
    else
      puts "Insufficient funds."
    end
  end

  def total_cash
    total = 0
    @accounts.each do | person |
      total += person.bank_accounts[bank_name]
    end
    puts "Total Cash: #{total} galleons."
    total
  end
end