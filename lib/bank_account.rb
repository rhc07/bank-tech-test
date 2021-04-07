class Bank_Account

    attr_reader :balance, :transaction

    def initialize(transaction = Transactions.new)
        @balance = 0
        @transaction = transaction
    end

    def deposit(amount, date = Time.now.strftime("%d/%m/%Y"))
        credit(amount)
        transaction.deposit(amount, date, balance)
    end 

    def withdraw(amount, date = Time.now.strftime("%d/%m/%Y"))
        fail "Insuffucient funds in account" if insuffucient_funds?(amount)
        debit(amount)
        transaction.withdraw(amount, date, balance)
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