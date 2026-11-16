"""
=====================================================
 PYTHON ASSIGNMENT - SCENARIO BASED (50 Questions)
=====================================================
 Topics : Variables, Data Types, Operators, Control
          Statements, Strings, Lists

 Name        : Wasim Akthar
 Date        : 12/11/2026

 How to use:
   - Write your code below each question (replace the 'pass' line).
   - Sample data given in a section (e.g. name, email, prices, orders)
     is already created for you. Use it directly.
   - To test one question at a time, comment out the others
     using Ctrl + /
=====================================================
"""


# =====================================================
# SECTION 1 - VARIABLES
# Scenario: Employee Data
# =====================================================

print("SECTION 1 - VARIABLES")

# Q1.1. Store employee ID, employee name and salary in variables.
print("Q1.1. Store employee ID, employee name and salary in variables.")

employee_id = 101
employee_name = "Wasim Akthar"
employee_salary = 90000

print('Employee ID:', employee_id)
print('Employee Name:', employee_name)
print('Employee Salary:', employee_salary)

# Q1.2. Store a company name in a variable and print it.
print("\nQ1.2. Store a company name in a variable and print it.")

company_name = "Wasim Corp"
print('Company Name:', company_name)

# Q1.3. Store the number of employees in a variable.
print("\nQ1.3. Store the number of employees in a variable.")

number_of_employees = 50
print('Number of Employees:', number_of_employees)

# Q1.4. Create two variables to store source and destination file names.
print("\nQ1.4. Create two variables to store source and destination file names.")

source_file = "input.txt"
destination_file = "output.txt"

print("Source File:", source_file)
print("Destination File:", destination_file)

# Q1.5. Calculate the total salary of two employees.
print("\nQ1.5. Calculate the total salary of two employees.")

total_salary = employee_salary * 2
print('Total Salary:', total_salary)

# =====================================================
# SECTION 2 - DATA TYPES
# Scenario: Amazon Product Data
# =====================================================

print("\nSECTION 2 - DATA TYPES")

# Q2.1. Store product ID as an integer.
print("\nQ2.1. Store product ID as an integer.")

product_id = 12345
print('Product ID:', product_id)
    
# Q2.2. Store product name as a string.
print("\nQ2.2. Store product name as a string.")

product_name = "Laptop"
print('Product Name:', product_name)

# Q2.3. Store product price as a float.
print("\nQ2.3. Store product price as a float.")

product_price = 1500.0
print("Product Price:", product_price)

# Q2.4. Store product availability as a Boolean.
print("\nQ2.4. Store product availability as a Boolean.")

product_available = True
print("Product Available:", product_available)

# Q2.5. Find the data type of each variable.
print("\nQ2.5. Find the data type of each variable.")

print('Data Type of Product ID:', type(product_id))
print('Data Type of Product Name:', type(product_name))
print('Data Type of Product Price:', type(product_price))
print('Data Type of Product Availability:', type(product_available))

# Q2.6. Convert the price "1500" into an integer.
print("\nQ2.6. Convert the price '1500' into an integer.")

price_as_int = int("1500")
print('Price as Integer:', price_as_int)

# =====================================================
# SECTION 3 - OPERATORS
# Scenario: Uber Trip Data
# =====================================================

print("\nSECTION 3 - OPERATORS")

# Q3.1. Calculate the total fare using distance x price per kilometre.
print("\nQ3.1. Calculate the total fare using distance x price per kilometre.")

distance = 10  # in kilometres
price_per_km = 15  # in Rupees

print('Distance:', distance, 'km')
print('Price per kilometre:', price_per_km, 'Rs/km')

total_fare = distance * price_per_km
print('Total Fare:', total_fare)


# Q3.2. Calculate 10% discount on a trip.
print("\nQ3.2. Calculate 10% discount on a trip.")

discount = total_fare * 0.10
print('Discount:', discount)


# Q3.3. Calculate the final fare after discount.
print("\nQ3.3. Calculate the final fare after discount.")

final_fare = total_fare - discount
print('Final Fare:', final_fare)


# Q3.4. Check whether the trip fare is greater than Rs. 500.
print("\nQ3.4. Check whether the trip fare is greater than Rs. 500.")

if final_fare > 500:
    print('Trip fare is greater than Rs. 500.')
else:
    print('Trip fare is not greater than Rs. 500.')


# Q3.5. Check whether the driver completed more than 5 trips.
print("\nQ3.5. Check whether the driver completed more than 5 trips.")

trips_completed = 7
print('Trips Completed:', trips_completed)
if trips_completed > 5:
    print('Driver completed more than 5 trips.')
else:
    print('Driver did not complete more than 5 trips.')

# Q3.6. Check whether the trip distance is equal to 10 km.
print("\nQ3.6. Check whether the trip distance is equal to 10 km.")

trip_distance = 10
print('Trip Distance:', trip_distance, 'km')
if trip_distance == 10:
    print('Trip distance is equal to 10 km.')
else:
    print('Trip distance is not equal to 10 km.')


# =====================================================
# SECTION 4 - CONTROL STATEMENTS
# Scenario: Bank Transactions
# =====================================================

print("\nSECTION 4 - CONTROL STATEMENTS")

# Q4.1. Check whether the account balance is greater than Rs. 5,000.
print("\nQ4.1. Check whether the account balance is greater than Rs. 5,000.")

account_balance = 10000
print('Account Balance:', account_balance)
if account_balance > 5000:
    print('Account balance is greater than Rs. 5,000.')
else:
    print('Account balance is not greater than Rs. 5,000.')

# Q4.2. Check whether a transaction amount is positive or negative.
print("\nQ4.2. Check whether a transaction amount is positive or negative.")

transaction_amount = -1000
print('Transaction Amount:', transaction_amount)
if transaction_amount > 0:
    print('Transaction amount is positive.')
elif transaction_amount < 0:
    print('Transaction amount is negative.')
else:
    print('Transaction amount is zero.')


# Q4.3. Check whether a transaction is successful or failed.
print("\nQ4.3. Check whether a transaction is successful or failed.")

transaction_status = 'Success'
print('Transaction Status:', transaction_status)
if transaction_status == 'Success':
    print('Transaction is successful.')
else:
    print('Transaction has failed.')


# Q4.4. Print numbers from 1 to 10 using a for loop.
print("\nQ4.4. Print numbers from 1 to 10 using a for loop.")

for number in range(1, 11):
    print(number)

# Q4.5. Calculate the sum of 5 transaction amounts.
print("\nQ4.5. Calculate the sum of 5 transaction amounts.")

transaction_amounts = [1000, -500, 2000, -1000, 1500]
print('Transaction Amounts:', transaction_amounts)
total_sum = sum(transaction_amounts)
print('Total Sum:', total_sum)

# Q4.6. Print only even transaction IDs from 1 to 20.
print("\nQ4.6. Print only even transaction IDs from 1 to 20.")

for transaction_id in range(2, 21, 2):
    print(transaction_id)


# Q4.7. Stop processing when the transaction amount is greater
#       than Rs. 50,000.
print("\nQ4.7. Stop processing when the transaction amount is greater than Rs. 50,000.")

transaction_amounts = [10000, 20000, 30000, 60000, 40000]
print('Transaction Amounts:', transaction_amounts)
for amount in transaction_amounts:
    if amount > 50000:
        print('Transaction amount exceeds Rs. 50,000. Stopping processing.')
        break
    print('Processing transaction amount:', amount)


# =====================================================
# SECTION 5 - STRINGS AND STRING METHODS
# Scenario: Customer Data Cleaning
# =====================================================

print("\nSECTION 5 - STRINGS AND STRING METHODS")

name = "  arun kumar  "
email = "ARUN@GMAIL.COM"
city = "chennai"

print("Customer Name:", name,
      "\nCustomer Email:", email,
      "\nCustomer City:", city)

# Q5.1. Remove unwanted spaces from the name.
print("\nQ5.1. Remove unwanted spaces from the name.")

name = name.strip()

print('Cleaned Customer Name:', name)

# Q5.2. Convert the name into uppercase.
print("\nQ5.2. Convert the name into uppercase.")

name = name.upper()

print('Uppercase Customer Name:', name)

# Q5.3. Convert the email into lowercase.
print("\nQ5.3. Convert the email into lowercase.")

email = email.lower()

print('Lowercase Customer Email:', email)

# Q5.4. Convert the city into title case.
print("\nQ5.4. Convert the city into title case.")

city = city.title()

print('Title Case Customer City:', city)

# Q5.5. Find the length of the customer name.
print("\nQ5.5. Find the length of the customer name.")

name_length = len(name)
print('Length of customer name:', name_length)


# Q5.6. Replace Chennai with Bangalore.
print("\nQ5.6. Replace Chennai with Bangalore.")

city = city.replace('Chennai', 'Bangalore')

print('Updated Customer City:', city)

# Q5.7. Check whether the email ends with "com".
print("\nQ5.7. Check whether the email ends with 'com'.")

if email.endswith('com'):
    print('Email ends with "com".')
else:
    print('Email does not end with "com".')

# Q5.8. Split the customer name into words.
print("\nQ5.8. Split the customer name into words.")

name_words = name.split()
print('Customer name words:', name_words)


# =====================================================
# SECTION 6 - LISTS AND LIST METHODS
# Scenario: Product Data
# =====================================================

print("\nSECTION 6 - LISTS AND LIST METHODS")

prices = [1000, 2000, 3000, 4000, 5000]

print("Product Prices:", prices)

# Q6.1. Print all product prices.
print("\nQ6.1. Print all product prices.")

for price in prices:
    print(price)

# Q6.2. Print the first and last price.
print("\nQ6.2. Print the first and last price.")

print('First price:', prices[0])
print('Last price:', prices[-1])

# Q6.3. Add 6000 to the list.
print("\nQ6.3. Add 6000 to the list.")

prices.append(6000)

print("Appended Product Prices:", prices)

# Q6.4. Remove 3000 from the list.
print("\nQ6.4. Remove 3000 from the list.")

prices.remove(3000)

print("Updated Product Prices:", prices)

# Q6.5. Update the first price to 1500.
print("\nQ6.5. Update the first price to 1500.")

prices[0] = 1500

print("Updated Product Prices:", prices)

# Q6.6. Sort the prices in ascending order.
print("\nQ6.6. Sort the prices in ascending order.")

prices.sort()

print("Sorted Product Prices:", prices)

# Q6.7. Find the maximum price.
print("\nQ6.7. Find the maximum price.")

max_price = max(prices)

print('Maximum price:', max_price)

# Q6.8. Find the minimum price.
print("\nQ6.8. Find the minimum price.")

min_price = min(prices)

print('Minimum price:', min_price)

# Q6.9. Calculate the total price.
print("\nQ6.9. Calculate the total price.")

total_price = sum(prices)

print('Total price:', total_price)


# Q6.10. Count the number of products.
print("\nQ6.10. Count the number of products.")

product_count = len(prices)

print('Number of products:', product_count)

# =====================================================
# SECTION 7 - SMALL INTEGRATED SCENARIO
# Scenario: Daily Order Processing
# =====================================================

print("\nSECTION 7 - SMALL INTEGRATED SCENARIO")

orders = [1000, 2000, 500, 3000, 1500]

print("Daily Orders:", orders)

# Q7.1. Display all orders.
print("\nQ7.1. Display all orders.")

for order in orders:
    print(order)

# Q7.2. Find the total number of orders.
print("\nQ7.2. Find the total number of orders.")

order_count = len(orders)

print('Total number of orders:', order_count)

# Q7.3. Calculate the total order amount.
print("\nQ7.3. Calculate the total order amount.")

total_order_amount = sum(orders)

print('Total order amount:', total_order_amount)

# Q7.4. Find the highest order amount.
print("\nQ7.4. Find the highest order amount.")

highest_order_amount = max(orders)

print('Highest order amount:', highest_order_amount)

# Q7.5. Find the lowest order amount.
print("\nQ7.5. Find the lowest order amount.")

lowest_order_amount = min(orders)

print('Lowest order amount:', lowest_order_amount)

# Q7.6. Display orders greater than Rs. 1,000.
print("\nQ7.6. Display orders greater than Rs. 1,000:")

for order in orders:
    if order > 1000:
        print(order)


# Q7.7. Count how many orders are greater than Rs. 1,000.
print("\nQ7.7. Count how many orders are greater than Rs. 1,000.")

count = 0
for order in orders:
    if order > 1000:
        count += 1
print('Number of orders greater than Rs. 1,000:', count)


# Q7.8. Calculate a 10% discount for every order.
print("\nQ7.8. Calculate a 10% discount for every order.")
discounted_orders = []
for order in orders:
    print('Original order amount:', order)
    discounted_price = order - (order * 0.1)
    print('Discounted order amount:', discounted_price)
    discounted_orders.append(discounted_price)
print('Discounted orders:', discounted_orders)


# =====================================================
#                    END OF ASSIGNMENT
# =====================================================
