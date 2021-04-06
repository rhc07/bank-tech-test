class Transactions

    attr_reader :history

    def initialize
        @history = []
    end

    def deposit(amount, date = Time.now.strftime("%d/%m/%Y"))
        @history << {date: date, credit: amount}
    end
    

#Feedback from my code review said I should never delete my test method    
    def test
        "Hello World!"
    end


end