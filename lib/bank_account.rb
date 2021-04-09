# frozen_string_literal: true

# This is the main bank account class
class BankAccount

  attr_reader :transaction, :statement

  def initialize(transaction = Transactions.new, statement = Statement.new)
    @transaction = transaction
    @statement = statement
  end

  def deposit(amount)
    raise 'Please enter a valid number' if incorrect_input?(amount)

    transaction.add_deposit(amount)
  end

  def withdraw(amount)
    raise 'Please enter a valid number' if incorrect_input?(amount)
    
    transaction.add_withdraw(amount)
  end

  def print_statement
    statement.print(transaction.history)
  end

  def balance
    transaction.current_balance
  end

  private

  def incorrect_input?(amount)
    amount.to_i != amount
  end
end
