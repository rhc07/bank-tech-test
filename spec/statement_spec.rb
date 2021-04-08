# frozen_string_literal: true

require './lib/statement'

describe 'Statement' do
  let(:statement) { Statement.new }
  let(:transaction) { double }
  let(:date) { BankAccount::DATE }

  let(:transaction_history) do
      [
        {date: "08/04/2021", credit: 1000, debit: nil, balance: 1000}, 
        {date: "08/04/2021", credit: 2000, debit: nil, balance: 3000}, 
        {date: "08/04/2021", credit: 4000, debit: nil, balance: 7000}, 
        {date: "08/04/2021", credit: nil, debit: 2000, balance: 5000}, 
        {date: "08/04/2021", credit: nil, debit: 2000, balance: 3000}
    ]
  end


  describe '#print' do
    it 'displays the expected bank statement' do
      expect { statement.print(transaction_history) }.to output.to_stdout
    end
  end
end
