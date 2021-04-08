# frozen_string_literal: true

# This is the main bank account class
class BankAccount
  DATE = Time.now.strftime('%d/%m/%Y')

  attr_reader :transaction, :statement, :balance

  def initialize(transaction = Transactions.new, statement = Statement.new)
    @transaction = transaction
    @statement = statement
    @balance = 0
  end

  def deposit(amount)
    raise 'Please enter a valid number' if incorrect_input?(amount)

    credit(amount)
    transaction.add_deposit(amount, DATE, balance)
  end

  def withdraw(amount)
    raise 'Insuffucient funds in account' if insuffucient_funds?(amount)

    debit(amount)
    transaction.add_withdraw(amount, DATE, balance)
  end

  def print_statement
    statement.print(transaction.history)
  end

  private

  def insuffucient_funds?(amount)
    @balance < amount
  end

  def incorrect_input?(amount)
    amount.to_i != amount
  end

  def credit(amount)
    @balance += amount
  end

  def debit(amount)
    @balance -= amount
  end
end
