# bank-tech-test


## User Stories

```

As a user, 
So I can add to my bank account,
I would like to be able to deposit money.

As a user,
So I can access my bank account,
I would like to be able to to withdraw money.

As a user,
So I can view my transactions,
I would like to be able to print a bank statement.

```

## Sequence diagram


![Sequence_Diagram](images/Sequence_Diagram.svg)


```

alias User="User"
alias Bank_Account="Bank Account"
alias Bank_Statement="Bank Statement"


User->Bank_Account:"Deposit Money into account"
Bank_Account->Bank_Account:"Adds money to balance"
Bank_Account->Bank_Statement: "Updates/adds to transaction history"
User->Bank_Account:"Withdraws Money from account"
Bank_Account->Bank_Account:"Subtracts money from balance"
Bank_Account->Bank_Statement: "Updates/adds to transaction history"
User->Bank_Statement:"Prints a bank statement using transaction history hash or array"


```