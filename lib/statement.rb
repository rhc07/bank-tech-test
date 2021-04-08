# frozen_string_literal: true

# This prints the bank statement
class Statement
  def print(transaction_history)
    puts title
    transaction_history.each do |history|
      puts "#{history[:date]} || #{history[:credit]} || #{history[:debit]} || #{history[:balance]}"
    end
  end

  private

  def title
    'date || credit || debit || balance'
  end
end
