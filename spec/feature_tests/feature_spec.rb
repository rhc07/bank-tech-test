# frozen_string_literal: true

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
      expect(account.transaction.history).to eq([{ date: date, credit: 1000, debit: nil, balance: 1000 }])
    end
    it 'Allows a user to deposit some funds into transaction history with a random date' do
      account.withdraw(500, date)
      expect(account.transaction.history).to eq(
        [{ date: date, credit: 1000, debit: nil, balance: 1000 },
         { date: date, credit: nil, debit: 500, balance: 500 }]
      )
    end
  end

  context 'User wants to print a bank statement in the right format' do
    let(:printed_statement) 
    {
      "date || credit || debit || balance\n" \
      "08/04/2021 || 1000 ||  || 1000\n" \
      "08/04/2021 ||  || 500 || 500\n" \
      "08/04/2021 || 500 ||  || 1000\n" \
      "08/04/2021 ||  || 700 || 300\n" \
    }

    it 'Bank statement reflects the users transactions' do
      account.deposit(1000)
      account.withdraw(500)
      account.deposit(500)
      account.withdraw(700)
      expect { account.print_statement }.to output(printed_statement).to_stdout
    end
  end
end
