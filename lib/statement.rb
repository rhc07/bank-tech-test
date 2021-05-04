# frozen_string_literal: true

# This prints the bank statement
class Statement
  def print(transaction_history)
    puts title
    pretty_print(transaction_history)
    statement_body(transaction_history)
  end

  private

  def title
    'date || credit || debit || balance'
  end

  def statement_body(transaction_history)
    transaction_history.reverse.each do |history|
      puts "#{history[:date]} || #{history[:credit]} || #{history[:debit]} || #{history[:balance]}"
    end
  end


  def pretty_print(transaction_history)
    if transaction_history[0][:credit] == nil
      transaction_history.delete(transaction_history[0])
    end
  end
end
