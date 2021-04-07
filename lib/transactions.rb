# frozen_string_literal: true

# this logs transactions of the bank account
class Transactions
  attr_reader :history

  def initialize
    @history = []
  end

  def deposit(amount, date, balance)
    @history << [date, amount, '', balance]
  end

  def withdraw(amount, date, balance)
    @history << [date, '', amount, balance]
  end

  # Feedback from my code review said I should never delete my test method
  def test
    'Hello World!'
  end
end
