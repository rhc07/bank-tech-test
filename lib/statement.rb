# frozen_string_literal: true

# This prints the bank statement
class Statement
  def print(transaction_history)
    puts title
    transaction_history.each do |date, credit, debit, balance|
      puts "#{date} || #{credit} || #{debit} || #{balance}"
    end
  end

  private

  def title
    'date || credit || debit || balance'
  end
end
