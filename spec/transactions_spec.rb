# frozen_string_literal: true

require './lib/transactions'

describe 'Transactions' do
  let(:transaction) { Transactions.new }
  let(:date) { Time.now.strftime('%d/%m/%Y') }

  describe '#history' do
    it 'is empty on intialization' do
      expect(transaction.history).to eq [{ date: date, credit: nil, debit: nil, balance: 0 }]
    end
  end

  describe '#add_deposit' do
    before do
      transaction.add_deposit(3000)
    end

    it 'logs a deposit transaction' do
      expect(transaction.history).to include({date: date, credit: 3000, debit: nil, balance: 3000})
    end
  end

  describe '#add_withdraw' do
    before do 
      transaction.add_deposit(3000)
      transaction.add_withdraw(1000)
    end

    it 'logs a withdrawal transaction' do
      expect(transaction.history).to include({date: date, credit: nil, debit: 1000, balance: 2000})
    end
  end
end
