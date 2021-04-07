require './lib/statement.rb'

describe "Statement" do
    let (:statement) { Statement.new }


    context "testing Rspec" do
        it "allows me to view Hello World" do
            expect(statement.test).to eq("Hello World!")
        end 
    end
end
