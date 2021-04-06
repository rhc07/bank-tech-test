class Bank_Account

    attr_reader :balance

    def initialize
        @balance = 0
    end

    def deposit(amount)
        @balance += amount
    end 

    def withdraw(amount)
        if @balance < amount
            raise "Insuffucient funds in account"
        else
            @balance -= amount
        end
    end

#Feedback from my code review said I should never delete my test method
    def test
        "Hello World!"
    end

end