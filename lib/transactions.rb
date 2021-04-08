# frozen_string_literal: true

# This logs transactions of the bank account
class Transactions
  attr_reader :history

  def initialize
    @history = []
  end

  def add_deposit(amount, date, balance)
    @history << [date, amount, nil, balance]
  end

  def add_withdraw(amount, date, balance)
    @history << [date, nil, amount, balance]
  end
end
