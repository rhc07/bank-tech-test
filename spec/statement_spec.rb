# frozen_string_literal: true

require './lib/statement'

describe 'Statement' do
  let(:statement) { Statement.new }
  let(:transaction) { double }
  let(:date) { BankAccount::DATE }

  let(:transaction_history) do
      [
        ["08/04/2021", 1000, nil, 1000], 
        ["08/04/2021", 2000, nil, 3000], 
        ["08/04/2021", 4000, nil, 7000], 
        ["08/04/2021", nil, 2000, 5000], 
        ["08/04/2021", nil, 2000, 3000]
    ]
  end


  describe '#print' do
    it 'displays the expected bank statement' do
      expect { statement.print(transaction_history) }.to output.to_stdout
    end
  end
end
