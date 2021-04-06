class Bank_Account

    attr_reader :balance, :transaction_history, :transaction

    def initialize
        @balance = 0
        @transaction_history = []
        @transaction = Transactions.new
    end

    def deposit(amount, date = Time.now.strftime("%d/%m/%Y"))
        credit(amount)
        @transaction_history << {date: date, credit: amount}
        transaction.deposit(amount, date, balance)
    end 

    def withdraw(amount, date = Time.now.strftime("%d/%m/%Y"))
        fail "Insuffucient funds in account" if insuffucient_funds?(amount)
        debit(amount)
        @transaction_history << {date: date, debit: amount}
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