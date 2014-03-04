import seoss.Customer
import seoss.CustomerTransaction

class BootStrap {

    def init = { servletContext ->
		
		registerDefaultCustomers()
		
		recordDefaultTransactions()
    }
	
	private void registerDefaultCustomers(){
		def Customer customer = new Customer(firstName:"John", lastName:"Flow").save();
					customer = new Customer(firstName:"Raj", lastName:"Jamnis").save();
					customer = new Customer(firstName:"Andrew", lastName:"Chung").save();
					customer = new Customer(firstName:"Mike", lastName:"Smith").save();
	}
	
	private void recordDefaultTransactions(){
		
		
		//Its better to get the required customer once
		def customer1 = Customer.findByFirstNameAndLastName("John", "Flow");
		def customer2 = Customer.findByFirstNameAndLastName("Raj", "Jamnis");
		def customer3 = Customer.findByFirstNameAndLastName("Andrew", "Chung");
		def customer4 = Customer.findByFirstNameAndLastName("Mike", "Smith");
		
		//10 Successful Transactions in total
								//5 Successful Transactions linked with customer 1
		def CustomerTransaction customerTransaction = new CustomerTransaction(paid:true, amount:22.33, currency:"gbp", refunded:false, customer:customer1).save();
								customerTransaction = new CustomerTransaction(paid:true, amount:100.00, currency:"gbp", refunded:false, customer:customer1).save();
								customerTransaction = new CustomerTransaction(paid:true, amount:233.87, currency:"gbp", refunded:false, customer:customer1).save();
								customerTransaction = new CustomerTransaction(paid:true, amount:45.67, currency:"gbp", refunded:false, customer:customer1).save();
								customerTransaction = new CustomerTransaction(paid:true, amount:191.77, currency:"gbp", refunded:false, customer:customer1).save();
		
								//3 Successful Transactions linked with customer 2
								customerTransaction = new CustomerTransaction(paid:true, amount:191.77, currency:"gbp", refunded:false, customer:customer2).save();
								customerTransaction = new CustomerTransaction(paid:true, amount:87.99, currency:"gbp", refunded:false, customer:customer2).save();
								customerTransaction = new CustomerTransaction(paid:true, amount:69.99, currency:"gbp", refunded:false, customer:customer2).save();
								
								//1 Successful Transaction1 linked with customer 3
								customerTransaction = new CustomerTransaction(paid:true, amount:191.77, currency:"gbp", refunded:false, customer:customer3).save();
								
								//1 Successful Transaction1 linked with customer 4
								customerTransaction = new CustomerTransaction(paid:true, amount:191.99, currency:"gbp", refunded:false, customer:customer4).save();
	
								//5 Unsuccessful Transactions
								customerTransaction = new CustomerTransaction(paid:false, amount:22.33, currency:"gbp", refunded:false, customer:customer3).save();
								customerTransaction = new CustomerTransaction(paid:false, amount:100.00, currency:"gbp", refunded:false, customer:customer3).save();
								customerTransaction = new CustomerTransaction(paid:false, amount:233.87, currency:"gbp", refunded:false, customer:customer3).save();
								customerTransaction = new CustomerTransaction(paid:false, amount:45.67, currency:"gbp", refunded:false, customer:customer4).save();
								customerTransaction = new CustomerTransaction(paid:false, amount:191.77, currency:"gbp", refunded:false, customer:customer4).save();
								
								//6 Unsuccessful Transactions refunded
								customerTransaction = new CustomerTransaction(paid:false, amount:22.33, currency:"gbp", refunded:true, customer:customer1).save();
								customerTransaction = new CustomerTransaction(paid:false, amount:100.00, currency:"gbp", refunded:true, customer:customer1).save();
								customerTransaction = new CustomerTransaction(paid:false, amount:233.87, currency:"gbp", refunded:true, customer:customer1).save();
								customerTransaction = new CustomerTransaction(paid:false, amount:45.67, currency:"gbp", refunded:true, customer:customer1).save();
								customerTransaction = new CustomerTransaction(paid:false, amount:191.77, currency:"gbp", refunded:true, customer:customer2).save();
								customerTransaction = new CustomerTransaction(paid:false, amount:191.77, currency:"gbp", refunded:true, customer:customer2).save();
	}
	
    def destroy = {
		
    }
}
