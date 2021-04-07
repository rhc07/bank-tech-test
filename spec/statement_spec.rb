require './lib/statement.rb'

describe "Statement" do
    let (:statement) { Statement.new }
    let (:transaction) { Transactions.new }
    let (:date) { Time.now.strftime("%d/%m/%Y") }


    context "testing Rspec" do
        it "allows me to view Hello World" do
            expect(statement.test).to eq("Hello World!")
        end 
    end


    describe "#print" do
        it "displays the expected bank statement" do
            transaction.deposit(2000, date, 0)
            transaction.withdraw(500, date, 2000)
            expect(statement.print).to include(
                "date || credit || debit || balance
                #{date} || 2000.00 || || 0.00
                #{date} || || 500.00 || 2000.00"
            )
        end
    end
end