# frozen_string_literal: true

require './lib/bank_account'

describe 'BankAccount' do
  let(:account) { BankAccount.new }
  let(:date) { Time.now.strftime('%d/%m/%Y')}
  let(:transaction) { double }

  before do
    account.deposit(2000)
  end

  # let and/or create a stub that allows transaction.history to be received by account.new <-- this will create dependency injection

  describe '#deposit' do
    it 'deposits a sum of money into my account' do
      allow(transaction).to receive(:current_balance).and_return(2000)

      expect(account.balance).to eq(2000)
    end
    it 'records the date of deposit transaction' do
      allow(transaction).to receive(:history).and_return({date: date, credit: "2000.00", debit: nil, balance: "2000.00"})
      
      expect(account.transaction.history).to include({date: date, credit: "2000.00", debit: nil, balance: "2000.00"})
    end
    it 'throws an error if user inputs wrong data' do
      expect { account.deposit('thousand')}.to raise_error('Please enter a valid number')
    end  
  end

  describe '#withdraw' do
    before do
      account.withdraw(500)
    end

    it 'withdraws a sum of money from my account' do
      expect(account.balance).to eq(1500)
    end
    it 'throws an error if there are insuffucient funds in account' do
      expect { account.withdraw(3000) }.to raise_error('Insuffucient funds in account')
    end
    it 'throws an error if user inputs wrong data' do
      expect { account.withdraw('thousand') }.to raise_error('Please enter a valid number')
    end 
  end

  describe '#print' do
    it 'responds to print' do
      expect(account).to respond_to(:print_statement)
    end
  end
end
