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
end
