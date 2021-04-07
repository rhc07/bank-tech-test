require './lib/bank_account.rb'

describe "Bank_Account" do
    let (:account) { Bank_Account.new }
    let (:date) { Time.now.strftime("%d/%m/%Y") }
    let (:transaction) { double }

    before do
        account.deposit(2000)
    end
    
    context "testing rspec" do
        it "allows me to view Hello World!" do
            expect(account.test).to eq("Hello World!")
        end
    end

    describe "#deposit" do
        it "deposits a sum of money into my account" do
            expect(account.balance).to eq(2000)
        end
        it "records the date of deposit transaction" do
            expect(account.transaction.history).to include({date: date, credit: 2000, balance: 2000})
        end
    end


    describe "#withdraw" do
        before do
            account.withdraw(500)
        end

        it "withdraws a sum of money from my account" do
            expect(account.balance).to eq(1500)
        end
        it "throws an error if there are insuffucient funds in account" do
            expect{account.withdraw(3000)}.to raise_error("Insuffucient funds in account")
        end
        it "records the date of withdrawal transaction" do
            expect(account.transaction.history).to include({date: date, debit: 500, balance: 1500})
        end    
    end
end