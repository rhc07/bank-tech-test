require './lib/transactions.rb'

describe "Transactions" do
    let (:transaction) { Transactions.new }

    context "testing rspec" do
        it "allows me to view Hello World!" do
            expect(transaction.test).to eq("Hello World!")
        end
    end


    describe "#history" do
        it "is empty on intialization" do
            expect(transaction.history).to eq []
        end
    end


end
