# frozen_string_literal: true

require './lib/bank_account'

describe 'FeatureTests' do
  let(:account) { BankAccount.new }
  let(:date) { Time.now.strftime('%d/%m/%Y') }

  context 'before executing any methods' do
    it 'Checks that the first bank transaction is empty with a balance of zero' do
      expect(account.print_statement).to eq [{ date: date, credit: nil, debit: nil, balance: 0 }]
    end
  end

  context 'Using the account methods' do
    before do
      account.deposit(1000)
    end

    it 'Allows a user to deposit some funds into transaction history' do
      expect(account.transaction.history).to eq(
        [{ date: date, credit: nil, debit: nil, balance: 0 },
        { date: date, credit: 1000, debit: nil, balance: 1000 }]
      )
    end
    it 'Allows a user to withdraw funds and puts it into the transaction history' do
      account.withdraw(500)
      expect(account.transaction.history).to eq(
        [{ date: date, credit: nil, debit: nil, balance: 0 },
         { date: date, credit: 1000, debit: nil, balance: 1000 },
         { date: date, credit: nil, debit: 500, balance: 500 }]
      )
    end
  end

  context 'User wants to print a bank statement in the right format' do
    let(:printed_statement) {
      "date || credit || debit || balance\n" \
      "#{date} ||  ||  || 0\n" \
      "#{date} || 1000 ||  || 1000\n" \
      "#{date} ||  || 500 || 500\n" \
      "#{date} || 500 ||  || 1000\n" \
      "#{date} ||  || 700 || 300\n" \
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
