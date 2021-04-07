# frozen_string_literal: true

require './lib/transactions'

describe 'Transactions' do
  let(:transaction) { Transactions.new }
  let(:date) { BankAccount::DATE }

  context 'testing rspec' do
    it 'allows me to view Hello World!' do
      expect(transaction.test).to eq('Hello World!')
    end
  end

  describe '#history' do
    it 'is empty on intialization' do
      expect(transaction.history).to eq []
    end
  end

  describe '#deposit' do
    it 'logs a deposit transaction' do
      transaction.deposit(3000, date, 1000)
      expect(transaction.history).to include([date, 3000, '', 1000])
    end
  end

  describe '#withdraw' do
    it 'logs a withdrawal transaction' do
      transaction.deposit(3000, date, 1000)
      transaction.withdraw(1000, date, 4000)
      expect(transaction.history).to include([date, '', 1000, 4000])
    end
  end
end
