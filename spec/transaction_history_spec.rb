require './lib/transaction_history.rb'

describe "Transaction_History" do
    let (:transaction) { Transaction_History.new }

    context "testing rspec" do
        it "allows me to view Hello World!" do
            expect(transaction.test).to eq("Hello World!")
        end
    end
end
