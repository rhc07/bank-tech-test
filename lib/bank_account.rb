class Bank_Account

    attr_reader :balance

    def initialize
        @balance = 0
    end

    def test
        "Hello World!"
    end

    def deposit(amount)
        @balance += amount
    end

end