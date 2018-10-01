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
end