"""
=====================================================
 PYTHON PRACTICE QUESTIONNAIRE (50 Questions)
=====================================================
 Topics : Variables, Data Types, Type Conversion, I/O,
          Operators, Conditional (Control) Statements

 How to use:
   - Write your code below each question (replace the 'pass' line).
   - Run the file to check output. To test one question at a time,
     comment out the others using Ctrl + /
=====================================================
"""


# =====================================================
# PART 1 - VARIABLES
# =====================================================

# Q1. Create a variable to store your name and print it.
my_name = 'Wasim Akthar'
print('My Name is :',my_name)


# Q2. Store your age in a variable and display it.
my_age = 25
print('My Age is :', my_age)


# Q3. Store your college name, department and year of study in
#     separate variables and print them.
my_college, my_dept, my_yos = 'MGR', 'CSE', '2023'
print(
  "\nMy College is :", my_college,
  "\nMy Dept is :", my_dept,
  "\nMy Year of Passing is :", my_yos 
)

# Q4. Create two variables a = 10 and b = 20. Print both values.

a = 10
b = 20
print('Value of a:', a)
print('Value of b:', b)


# Q5. Store your favourite color and favourite food in variables
#     and display them.

favourite_color = 'Blue'
favourite_food = 'Pizza'

print('My Favourite Color is:', favourite_color)
print('My Favourite Food is:', favourite_food)


# =====================================================
# PART 2 - DATA TYPES
# =====================================================

# Q6. Create variables with integer, float, string and boolean values.
#     Print their values and data types using type().

integer_var = 10
float_var = 10.5
string_var = "Hello, World!"
boolean_var = True

print("Integer Variable:", integer_var, "Type:", type(integer_var))
print("Float Variable:", float_var, "Type:", type(float_var))
print("String Variable:", string_var, "Type:", type(string_var))
print("Boolean Variable:", boolean_var, "Type:", type(boolean_var))


# Q7. Store the following details in separate variables:
#       - Student name
#       - Age
#       - Percentage
#       - Is passed (True/False)
#     Print the values and their data types.

student_name = "Wasim Akthar"
age = 25
percentage = 85.5
is_passed = True

print("Student Name:", student_name, "Type:", type(student_name))
print("Age:", age, "Type:", type(age))
print("Percentage:", percentage, "Type:", type(percentage))
print("Is Passed:", is_passed, "Type:", type(is_passed))


# Q8. Create a variable with value 100, then change its value to
#     "Python". Print its value and data type.

var = 100
print("Initial Value:", var, "Type:", type(var))
var = "Python"
print("Modified Value:", var, "Type:", type(var))


# =====================================================
# PART 3 - TYPE CONVERSION
# =====================================================

# Q9. Get two numbers from the user and add them.
#     Convert the input values into integers.

num1 = int(input("Enter the first number: "))
num2 = int(input("Enter the second number: "))
sum = num1 + num2
print("The sum is:", sum)


# Q10. Get the user's age as input and convert it into an integer.
#      Print the age after 5 years.

age = int(input("Enter your age: "))
print("Age after 5 years:", age + 5)


# Q11. Get the price of a product as input and convert it into float.
#      Print the price.

price = float(input("Enter the price of the product: "))
print("The price is:", price)


# Q12. Get two numbers as input and perform addition, subtraction and
#      multiplication after converting them into integers.

num1 = int(input("Enter the first number: "))
num2 = int(input("Enter the second number: "))
print("Addition:", num1 + num2)
print("Subtraction:", num1 - num2)
print("Multiplication:", num1 * num2)


# =====================================================
# PART 4 - OPERATORS
# =====================================================

# Q13. Get two numbers from the user and perform:
#        - Addition
#        - Subtraction
#        - Multiplication
#        - Division
#        - Modulus

num_1 = float(input("Enter the first number: "))
num_2 = float(input("Enter the second number: "))
print("Addition:", num_1 + num_2)
print("Subtraction:", num_1 - num_2)
print("Multiplication:", num_1 * num_2)
print("Division:", num_1 / num_2)
print("Modulus:", num_1 % num_2)

# Q14. A student scored 80 marks in English and 90 marks in Maths.
#      Calculate the total and average.
english_marks = 80
maths_marks = 90
total = english_marks + maths_marks
average = total / 2
print("Total:", total)
print("Average:", average)


# Q15. Get the price and quantity of a product from the user.
#      Calculate the total bill.
price = float(input("Enter the price of the product: "))
quantity = int(input("Enter the quantity: "))
total_bill = price * quantity
print("Total Bill:", total_bill)


# Q16. Get a person's age and check whether they are above 18
#      using a comparison operator.
age = int(input("Enter your age: "))
if age >= 18:
    print("Eligible to Vote")
else:
    print("Not Eligible to Vote")


# Q17. Get two numbers and check whether the first number is
#      greater than the second number.
num1 = int(input("Enter the first number: "))
num2 = int(input("Enter the second number: "))
if num1 > num2:
    print("The first number is greater.")
else:
    print("The second number is greater or equal.")


# Q18. Get a number and check whether it is divisible by 5
#      using the modulus operator.
num = int(input("Enter a number: "))
if num % 5 == 0:
    print("The number is divisible by 5.")
else:
    print("The number is not divisible by 5.")


# =====================================================
# PART 5 - CONDITIONAL STATEMENTS
# =====================================================

# ---------- Simple if ----------

# Q19. Get a person's age. If the age is 18 or above,
#      print "Eligible to Vote".
age = int(input("Enter your age: "))
if age >= 18:
    print("Eligible to Vote")


# Q20. Get a student's mark. If the mark is 35 or above,
#      print "Pass".
mark = int(input("Enter your mark: "))
if mark >= 35:
    print("Pass")


# ---------- if-else ----------

# Q21. Get a number from the user. Check whether it is even or odd.
num = int(input("Enter a number: "))
if num % 2 == 0:
    print("The number is even.")
else:
    print("The number is odd.")


# Q22. Get a number and check whether it is positive or negative.
num = int(input("Enter a number: "))
if num > 0:
    print("The number is positive.")
elif num < 0:
    print("The number is negative.")
else:
    print("The number is zero.")


# Q23. Get two numbers and print the largest number.
num1 = int(input("Enter the first number: "))
num2 = int(input("Enter the second number: "))
if num1 > num2:
    print("The first number is largest.")
elif num2 > num1:
    print("The second number is largest.")
else:
    print("Both numbers are equal.")


# Q24. Get a person's age. If age is 18 or above, print "Eligible";
#      otherwise print "Not Eligible".
age = int(input("Enter your age: "))
if age >= 18:
    print("Eligible")
else:
    print("Not Eligible")


# ---------- if-elif-else ----------

# Q25. Get student marks and display the grade.
#        Marks     Grade
#        90 - 100    A
#        75 - 89     B
#        50 - 74     C
#        35 - 49     D
#        Below 35    Fail
mark = int(input("Enter your mark: "))
if mark >= 90:
    print("Grade: A")
elif mark >= 75:
    print("Grade: B")
elif mark >= 50:
    print("Grade: C")
elif mark >= 35:
    print("Grade: D")
else:
    print("Fail")


# Q26. Get electricity units and display the category:
#        - Below 100      : Low Usage
#        - 100 to 200     : Medium Usage
#        - Above 200      : High Usage
units = int(input("Enter electricity units: "))
if units < 100:
    print("Category: Low Usage")
elif units <= 200:
    print("Category: Medium Usage")
else:
    print("Category: High Usage")


# Q27. Get a temperature value and display:
#        - Below 20       : Cold
#        - 20 to 30       : Normal
#        - Above 30       : Hot
temp = int(input("Enter temperature: "))
if temp < 20:
    print("Temperature: Cold")
elif temp <= 30:
    print("Temperature: Normal")
else:
    print("Temperature: Hot")


# ---------- Nested if ----------

# Q28. Ask the user to enter their username and password.
#      If the username is correct, then check the password.
#        - Both correct          : "Login Successful"
#        - Username correct only : "Incorrect Password"
#        - Otherwise             : "User Not Found"

username = input("Enter username: ")
password = input("Enter password: ")

if username == "admin":
    if password == "password":
        print("Login Successful")
    else:
        print("Incorrect Password")
else:
    print("User Not Found")


# Q29. Get a number. If it is positive, then check whether it is
#      even or odd. If it is not positive, print "Not a positive number".

pos_or_neg_num = int(input("Enter a number: "))
if pos_or_neg_num > 0:
    if pos_or_neg_num % 2 == 0:
        print("The number is positive and even.")
    else:
        print("The number is positive and odd.")
else:
    print("Not a positive number")


# Q30. Get a person's age and whether they have a voter ID (yes/no).
#      If age is 18 or above, then check the voter ID:
#        - yes : "Can Vote"
#        - no  : "Apply for Voter ID"
#      Otherwise print "Too young to vote".

age = int(input("Enter your age: "))
if age >= 18:
    voter_id = input("Do you have a voter ID? (yes/no): ").strip().lower()
    if voter_id == "yes":
        print("Can Vote")
    elif voter_id == "no":
        print("Apply for Voter ID")
    else:
        print("Invalid input for voter ID.")
else: 
    print("Too young to vote")


# Q31. Get three numbers and print the largest using nested if.
num1 = int(input("Enter number 1: "))
num2 = int(input("Enter number 2: "))
num3 = int(input("Enter number 3: "))

if num1 >= num2:
    if num1 >= num3:
        print(f"The largest number is {num1}.")
    else:
        print(f"The largest number is {num3}.")
else:
    if num2 >= num3:
        print(f"The largest number is {num2}.")
    else:
        print(f"The largest number is {num3}.")


# Q32. Get a student's attendance percentage and mark.
#      If attendance is 75 or above, then check the mark:
#        - mark >= 35 : "Pass"
#        - otherwise  : "Fail"
#      If attendance is below 75, print "Not allowed to write exam".

attendance = float(input("Enter attendance percentage: "))
mark = float(input("Enter mark: "))

if attendance >= 75:
    if mark >= 35:
        print("Pass")
    else:
        print("Fail")
else:
    print("Not allowed to write exam")


# Q33. Get a year and check whether it is a leap year.
#      (Divisible by 4 and not by 100, or divisible by 400.)

year = int(input("Enter a year: "))
if (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0):
    print(f"{year} is a leap year.")


# =====================================================
# PART 6 - LOGICAL & MEMBERSHIP OPERATORS
# =====================================================

# Q34. Get a person's age. Check whether the age is between
#      18 and 60 (both inclusive) using the 'and' operator.

age = int(input("Enter your age: "))
if age >= 18 and age <= 60:
    print("Age is between 18 and 60.")


# Q35. Get a number and check whether it is divisible by both 3 and 5.

num = int(input("Enter a number: "))
if num % 3 == 0 and num % 5 == 0:
    print("Number is divisible by both 3 and 5.")
else:
    print("Number is not divisible by both 3 and 5.")


# Q36. Get a character and check whether it is a vowel
#      (use the 'in' operator).

char = input("Enter a character: ").strip().lower()
if char in "aeiou":
    print("The character is a vowel.")
else:
    print("The character is not a vowel.")


# Q37. Get a day name. Print "Weekend" if it is Saturday or Sunday
#      (use the 'or' operator), otherwise print "Weekday".

day = input("Enter a day name: ").strip().lower()
if day == "saturday" or day == "sunday":
    print("Weekend")
else:
    print("Weekday")


# Q38. Get three side lengths and check whether they can form a
#      valid triangle (sum of any two sides must be greater than
#      the third side).

side1 = float(input("Enter side 1: "))
side2 = float(input("Enter side 2: "))
side3 = float(input("Enter side 3: "))
if (side1 + side2 > side3) and (side1 + side3 > side2) and (side2 + side3 > side1):
    print("The sides can form a valid triangle.")


# =====================================================
# PART 7 - INPUT / OUTPUT & FORMATTING
# =====================================================

# Q39. Print the numbers 1, 2, 3 on the same line separated by a
#      hyphen (-) using the sep parameter of print().

print(1, 2, 3, sep="-")


# Q40. Print "Hello" and "World" on the same line using the end
#      parameter of print().

print("Hello", end=" ")
print("World")


# Q41. Get the user's name and age, and display them in one line
#      using an f-string.
#      Example: Hi Arun, you are 19 years old.

name = input("Enter your name: ")
age = int(input("Enter your age: "))
print(f"Hi {name}, you are {age} years old.")


# Q42. Get two numbers and swap their values. Print the values
#      before and after swapping.

num1 = int(input("Enter first number: "))
num2 = int(input("Enter second number: "))
print(f"Before swapping: {num1}, {num2}")
num1, num2 = num2, num1
print(f"After swapping: {num1}, {num2}")


# Q43. Get principal, rate and time from the user.
#      Calculate and print the simple interest.
#      Formula: SI = (P * R * T) / 100

principal = float(input("Enter principal amount: "))
rate = float(input("Enter rate of interest: "))
time = float(input("Enter time (in years): "))
simple_interest = (principal * rate * time) / 100
print(f"Simple Interest: {simple_interest}")


# =====================================================
# PART 8 - MIXED PRACTICE PROGRAMS
# =====================================================

# Q44. Simple calculator: Get two numbers and an operator (+, -, *, /).
#      Perform the operation using if-elif-else.
#      Handle division by zero.

num1 = float(input("Enter first number: "))
num2 = float(input("Enter second number: "))
operator = input("Enter operator (+, -, *, /): ")

if operator == "+":
    result = num1 + num2
elif operator == "-":
    result = num1 - num2
elif operator == "*":
    result = num1 * num2
elif operator == "/":
    if num2 != 0:
        result = num1 / num2
    else:
        result = "Error: Division by zero is not allowed."
print(f"Result: {result}")

# Q45. Get weight (kg) and height (m). Calculate BMI and display:
#        - Below 18.5     : Underweight
#        - 18.5 to 24.9   : Normal
#        - 25 to 29.9     : Overweight
#        - 30 and above   : Obese
#      Formula: BMI = weight / (height * height)

weight = float(input("Enter weight (kg): "))
height = float(input("Enter height (m): "))
bmi = weight / (height * height)

if bmi < 18.5:
    print("Underweight")
elif 18.5 <= bmi < 25:
    print("Normal")
elif 25 <= bmi < 30:
    print("Overweight")
else:
    print("Obese")

# Q46. Cinema ticket price based on age:
#        - Below 5        : Free
#        - 5 to 12        : Rs. 100
#        - 13 to 59       : Rs. 200
#        - 60 and above   : Rs. 120

age = int(input("Enter your age: "))
if age < 5: 
    price = 0
elif 5 <= age <= 12:
    price = 100
elif 13 <= age <= 59:
    price = 200
else:
    price = 120
print(f"Ticket Price: Rs. {price}")

# Q47. Get the total bill amount. Give a discount:
#        - Above 5000     : 20% discount
#        - 2000 to 5000   : 10% discount
#        - Below 2000     : No discount
#      Print the discount amount and the final amount to pay.

total_bill = float(input("Enter total bill amount: "))
if total_bill > 5000:
    discount = total_bill * 0.20
elif 2000 <= total_bill <= 5000:
    discount = total_bill * 0.10
else:
    discount = 0

final_amount = total_bill - discount
print(f"Discount Amount: Rs. {discount}")
print(f"Final Amount to Pay: Rs. {final_amount}")

# Q48. ATM check: Get the account balance and withdrawal amount.
#        - If amount > balance      : "Insufficient Balance"
#        - If amount is not a
#          multiple of 100          : "Enter amount in multiples of 100"
#        - Otherwise                : Print the remaining balance

balance = float(input("Enter account balance: "))
withdrawal_amount = float(input("Enter withdrawal amount: "))

if withdrawal_amount > balance:
    print("Insufficient Balance")
elif withdrawal_amount % 100 != 0:
    print("Enter amount in multiples of 100")
else:
    remaining_balance = balance - withdrawal_amount
    print(f"Remaining Balance: Rs. {remaining_balance}")

# Q49. Get a number from 1 to 7 and print the day of the week
#      (1 - Monday ... 7 - Sunday). For any other number print
#      "Invalid Input".

day_number = int(input("Enter a number (1-7): "))
if day_number == 1:
    print("Monday")
elif day_number == 2:
    print("Tuesday")
elif day_number == 3:
    print("Wednesday")
elif day_number == 4:
    print("Thursday")
elif day_number == 5:
    print("Friday")
elif day_number == 6:
    print("Saturday")
elif day_number == 7:
    print("Sunday")
else:
    print("Invalid Input")

# Q50. Get a temperature in Celsius. Convert it to Fahrenheit
#      (F = C * 9/5 + 32), print the result and also display whether
#      the weather is Cold (below 20), Normal (20-30) or Hot (above 30).

celsius = float(input("Enter temperature in Celsius: "))
fahrenheit = celsius * 9/5 + 32
print(f"Temperature in Fahrenheit: {fahrenheit}")

if fahrenheit < 68:
    print("Weather is Cold")
elif 68 <= fahrenheit <= 86:
    print("Weather is Normal")
else:
    print("Weather is Hot")

# =====================================================
#                    END OF QUESTIONNAIRE
# =====================================================