# frozen_string_literal: true

# this prints the bank statement
class Statement
  def print(transaction_history)
    puts title
    transaction_history.each do |date, credit, debit, balance|
      puts "#{date} || #{credit} || #{debit} || #{balance}"
    end
  end

  # Feedback from my code review said I should never delete my test method
  def test
    'Hello World!'
  end

  private

  def title
    'date || credit || debit || balance'
  end
end
