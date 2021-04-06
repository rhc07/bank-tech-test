class Bank_Account

    attr_reader :balance, :log

    def initialize
        @balance = 0
        @log = []
    end

    def deposit(amount, date = Time.now.strftime("%d/%m/%Y"))
        credit(amount)
        @log << {date: date, credit: amount}
    end 

    def withdraw(amount, date = Time.now.strftime("%d/%m/%Y"))
        fail "Insuffucient funds in account" if insuffucient_funds?(amount)
        debit(amount)
        @log << {date: date, debit: amount}
    end

#Feedback from my code review said I should never delete my test method
    def test
        "Hello World!"
    end

    private 

    def insuffucient_funds?(amount)
        @balance < amount 
    end

    def credit(amount)
        @balance += amount
    end

    def debit(amount)
        @balance -= amount
    end    

end