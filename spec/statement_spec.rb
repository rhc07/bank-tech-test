require './lib/statement.rb'

describe "Statement" do
    let (:statement) { Statement.new }
    let (:transaction) { double }
    let (:account) { Bank_Account.new }
    let (:date) { Bank_Account::DATE }


    context "testing Rspec" do
        it "allows me to view Hello World" do
            expect(statement.test).to eq("Hello World!")
        end 
    end


    describe "#print" do
        it "displays the expected bank statement" do
            account.deposit(2000)
            account.withdraw(500)
            expect{statement.print(account.transaction.history)}.to output.to_stdout
        end
    end
end
