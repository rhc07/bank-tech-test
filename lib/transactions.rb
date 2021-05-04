# frozen_string_literal: true

# This logs transactions of the bank account
class Transactions
  
  attr_reader :history

  def initialize
    @history = [{ date: self.date, credit: nil, debit: nil, balance: 0 }]
  end

  def add_deposit(amount)
    @history << { date: self.date, credit: '%.2f' % amount, debit: nil, balance: credit_balance(amount) }
  end

  def add_withdraw(amount)
    raise 'Insuffucient funds in account' if insuffucient_funds?(amount)

    @history << { date: self.date, credit: nil, debit: '%.2f' % amount, balance: debit_balance(amount) }
  end

  def current_balance
    (@history[-1][:balance].to_i)
  end

  private

  def date
    Time.now.strftime('%d/%m/%Y')
  end 

  def credit_balance(amount)
    sum = (@history[-1][:balance].to_i) + amount
    '%.2f' % sum
  end

  def debit_balance(amount)
    sum = (@history[-1][:balance].to_i) - amount
    '%.2f' % sum
  end

  def insuffucient_funds?(amount)
    (@history[-1][:balance].to_i) < amount
  end

end
