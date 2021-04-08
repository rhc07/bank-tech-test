# frozen_string_literal: true

# This is the main bank account class
class BankAccount
  DATE = Time.now.strftime('%d/%m/%Y')

  attr_reader :balance, :transaction, :statement

  def initialize(transaction = Transactions.new, statement = Statement.new)
    @balance = 0
    @transaction = transaction
    @statement = statement
  end

  def deposit(amount, date = DATE)
    credit(amount)
    transaction.add_deposit(amount, date, balance)
  end

  def withdraw(amount, date = DATE)
    raise 'Insuffucient funds in account' if insuffucient_funds?(amount)

    debit(amount)
    transaction.add_withdraw(amount, date, balance)
  end

  def print_statement
    statement.print(transaction.history)
  end

  private

  def insuffucient_funds?(amount)
    @balance < amount
  end

  def credit(amount)
    @balance += amount
  end

  def debit(amount)
    @balance -= amount
  end
end
