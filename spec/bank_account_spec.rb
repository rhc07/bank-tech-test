require './lib/bank_account.rb'

describe "Bank_Account" do
    let (:account) { Bank_Account.new }

    context "testing rspec" do
        it "allows me to view Hello World!" do
            expect(account.test).to eq("Hello World!")
        end
    end

    describe "#deposit" do
        it "deposits a sum of money into my account" do
            account.deposit(1000)
            expect(account.balance).to eq(1000)
        end
    end

    describe "#withdraw" do
        it "withdraws a sum of money from my account" do
            account.deposit(2000)
            account.withdraw(500)
            expect(account.balance).to eq(1500)
        end
    end
end