class Bank
  attr_reader :bank_name

  def initialize(bank_name)
    @bank_name = bank_name
    puts "#{bank_name} has been created."
  end

  def open_account(person)
    person.bank_accounts[bank_name] = 0
    puts "An account has been opened for #{person.name} with #{bank_name}."
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

end