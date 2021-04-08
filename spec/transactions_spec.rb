# frozen_string_literal: true

require './lib/transactions'

describe 'Transactions' do
  let(:transaction) { Transactions.new }
  let(:date) { "12/10/2021" }

  describe '#history' do
    it 'is empty on intialization' do
      expect(transaction.history).to eq []
    end
  end

  describe '#deposit' do
    it 'logs a deposit transaction with a random date' do
      transaction.add_deposit(3000, date, 1000)
      expect(transaction.history).to include([date, 3000, nil, 1000])
    end
  end

  describe '#withdraw' do
    it 'logs a withdrawal transaction with a random date' do
      transaction.add_deposit(3000, date, 1000)
      transaction.add_withdraw(1000, date, 4000)
      expect(transaction.history).to include([date, nil, 1000, 4000])
    end
  end
end
