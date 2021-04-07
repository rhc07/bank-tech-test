class Statement

    def print(date = Time.now.strftime("%d/%m/%Y"))

        "date || credit || debit || balance
                #{date} || 2000.00 || || 0.00
                #{date} || || 500.00 || 2000.00"

    end


#Feedback from my code review said I should never delete my test method    
    def test
        "Hello World!"
    end

end