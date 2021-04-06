class Bank_Account

    attr_reader :balance, :log

    def initialize
        @balance = 0
        @log = []
    end

    def deposit(amount, date = Time.now.strftime("%d/%m/%Y"))
        @balance += amount
        @log << {date: date, debit: amount}
    end 

    def withdraw(amount)
        fail "Insuffucient funds in account" if @balance < amount
        @balance -= amount
    end

#Feedback from my code review said I should never delete my test method
    def test
        "Hello World!"
    end

end