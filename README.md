# Grails Programming Task

### In order to be considered for a Grails position, you must complete the following steps.
*Note: This task should take no longer than 1 hour to complete.*


### Prerequisites

- Please note that this will require some basic [Grails](http://grails.org/) and [Spock](http://code.google.com/p/spock/) knowledge. 

- You will need to have [Grails](http://grails.org/) installed to complete this task. 

## Task

- Fork this repository.
- Generate a default Grails application called *demo*
- Create a model suitable for holding a credit card charge. Example JSON data structure below: 

```
  {
    "id": 9923,
    "date_created": "2014-01-15 13:14:00",
    "paid": true,
    "amount": 4900,
    "currency": "gbp",
    "refunded": false,
    "customer_id" : 123
  }
```

    *Note: Amount is in GBP, represented as pence*

- Also create a customer object which only has a first and last name. 

*The charge object has a customer property, this property is the customer id from the customer model.*

##### Seed 4 customers into the system (so that they will also be created for anyone else running the application in development mode):

    Customer 1: 
      First Name: John
      Last Name: Flow

    Customer 2: 
      First Name: Raj
      Last Name: Jamnis

    Customer 3: 
      First Name: Andrew
      Last Name: Chung

    Customer 4: 
      First Name: Mike
      Last Name: Smith

  
##### Seed 15 transactions (charges) into the system (so that they will also be created for anyone else running the application in development mode):

    10 Should be successful transactions:
      - 5 Should be linked to Customer 1
      - 3 Should be linked to Customer 2
      - 1 Should be linked to Customer 3
      - 1 Should be linked to Customer 4
    
    5 Should be transactions that failed:
      - 3 Should be linked to Customer 3
      - 2 Should be linked to Customer 4

    6 should be refunded:
      - 4 should be linked to Customer 1
      - 2 should be linked to customer 2
    
##### Create a visual representation of different charges:

Create a scaffold controller for the transactions.

Add an extra view to the transactions controller (perhaps called *summary*) that shows all charges split into three lists with H1 headers.

- List 1 - 
  - Header: Failed Charges
  - In this list set the background color of the rows to #FF0000 and list the Customers name, the charge amount and the date that the charge failed for each failed charge. 

- List 2 - 
  - Header: Refunded Charges
  - In this list set the background color of the rows to #FF5400 and list the Customers name, the charge amount and the date that the charge was refunded for each refunded charge.

- List 3 -
  - Header: Successful Charges
  - In this list simply display all the charges that were succesful.

### Tests

Create the following tests (use [Spock](http://code.google.com/p/spock/) for bonus points but it isn't required):

  1.  Verify that there are three lists on the screen.
  2.  Verify that in the Successful charges list there are 10 line items. Verify that in the failed charges list there are 5 failed charges.

## Once Complete

1. Commit and Push your code to your new repository
2. Send us a pull request, we will review your code and get back to you


