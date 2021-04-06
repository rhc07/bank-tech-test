require './lib/bank_account.rb'

describe "Bank_Account" do
    let (:account) { Bank_Account.new }

    context "testing rspec" do
        it "allows me to view Hello World!" do
            expect(account.test).to eq("Hello World!")
        end
    end
end