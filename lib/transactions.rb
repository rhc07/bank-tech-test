# frozen_string_literal: true

# This logs transactions of the bank account
class Transactions
  attr_reader :history

  def initialize
    @history = []
  end

  def add_deposit(amount, date, balance)
    @history << { date: date, credit: amount, debit: nil, balance: balance }
  end

  def add_withdraw(amount, date, balance)
    @history << { date: date, credit: nil, debit: amount, balance: balance }
  end
end
