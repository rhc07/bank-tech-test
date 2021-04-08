require './lib/bank_account'

describe 'FeatureTests' do
  let(:account) { BankAccount.new }
  let(:date) { '21/07/2021' }

  context 'before executing any methods' do
    it 'Initializes a new users balance at 0' do
      expect(account.balance).to eq(0)  
    end
    it 'Checks the bank statement is empty' do
      expect(account.print_statement).to eq []
    end
  end

  context 'Using the account methods' do
    before do
        account.deposit(1000, date)
    end

    it 'Allows a user to deposit some funds into transaction history with a random date' do
      expect(account.transaction.history). to eq([{date: date, credit: 1000, debit: nil, balance: 1000}])
    end
  end
end
