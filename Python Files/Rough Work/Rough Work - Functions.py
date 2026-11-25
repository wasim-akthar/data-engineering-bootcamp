
import operator

# Basic function example

def greetings(name):
    """Print a greeting message for a given name."""
    print(f"Good Morning, {name}!")


greetings("wasim")

# Dictionary of arithmetic and comparison operators using the operator module
operators = {
    '+': operator.add,
    '-': operator.sub,
    '*': operator.mul,
    '/': operator.truediv,
    '**': operator.pow,
    '%': operator.mod,
    '//': operator.floordiv,
    '&': operator.and_,
    '|': operator.or_,
    '^': operator.xor,
    '<<': operator.lshift,
    '>>': operator.rshift,
    '~': operator.invert,
    '==': operator.eq,
    '!=': operator.ne,
    '>': operator.gt,
    '<': operator.lt,
    '>=': operator.ge,
    '<=': operator.le,
    'is': operator.is_,
    'is not': operator.is_not,
    'in': operator.contains,
}


def arithmetics(a, b, action='+'):
    """Apply the selected operator to two numbers."""
    return operators[action](a, b)


print(arithmetics(10, 5, '+'))
print(arithmetics(10, 5, '*'))


# Login function example

def login(user, password):
    """Display the provided username and password."""
    print(f"Your username is: {user}")
    print(f"Your password is: {password}")


login(input('Enter Your Username: '), input('Enter Your Password: '))


# Check whether a number is odd or even

def is_odd_or_even(number):
    """Return whether a number is even or odd."""
    return 'Even Number' if number % 2 == 0 else 'Odd Number'


print(is_odd_or_even(89))
print(is_odd_or_even(100))


# Swapping values using tuple unpacking

def interchange(a, b):
    """Swap two values and return the swapped result."""
    return b, a


print(interchange(10, 20))


# Swapping values using a temporary variable

def interchange_with_3rd(a, b):
    """Swap two values using a third variable."""
    temp = a
    a = b
    b = temp
    return a, b


print(interchange_with_3rd(10, 20))


# Convert centimeters to meters

def cm_to_m(cm):
    """Convert centimeters into meters and format the result."""
    return f'{(cm * 0.01):.1f} m'


print(cm_to_m(1987))

'''
User defined function types:
'''
# 1. Function with no arguments and no return value
def greet():
    print("Hello, World!")

# 2. Function with arguments and no return value
def greet_person(name):
    print(f"Hello, {name}!")

# 3. Function with no arguments and a return value
def get_greeting():
    return "Hello, World!"

# 4. Function with arguments and a return value
def add_numbers(a, b):
    return a + b

# 5. Function with default arguments
def greet_with_default(name="Guest"):
    print(f"Hello, {name}!")

amount = int(input("Enter amount: "))
def is_eligible():
    if amount >= 1000:
       discount_amount = amount * 0.1
       print("Eligible for discount")
       print("Discount amount :", discount_amount)
       print("Total discount amount: ", amount - discount_amount)
    else:
       print("Not Eligible")
is_eligible()

# arguments are inputs for functions
# return are results for functions

def greetings(name, city):
   print(f"Hello {name} from {city}")
greetings("Thomas", "Thoraipaakam")


def calc(balance, deposit):
  total = balance + deposit
  return balance, deposit, total

amount, deposit_amount, total_amount = calc(10000,3000)

print(
    "Amount: ", amount,
    "\nDeposit:",deposit_amount,
    "\nTotal Amount:", total_amount
    )

# PARAMETERS IN A FUNCTION
# Parameters are variables that are defined in the function definition. 
# They act as placeholders for the values that will be passed to the function when it is called. 
# Parameters allow functions to accept input and perform operations based on that input.

# Example of a function with parameters
def example_function(param1, param2):
    """This function takes two parameters and prints them."""
    print(f"Parameter 1: {param1}")
    print(f"Parameter 2: {param2}")

example_function("Hello", "World")  # Calling the function with arguments

# ARGS AND KWARGS
# *args allows a function to accept any number of positional arguments.
def example_function_with_args(*args):  
    """This function takes any number of positional arguments and prints them."""
    for arg in args:
        print(arg)

example_function_with_args("Hello", "World", "Python")  # Calling the function with multiple arguments

# **kwargs allows a function to accept any number of keyword arguments.
def example_function_with_kwargs(**kwargs):
    """This function takes any number of keyword arguments and prints them."""
    for key, value in kwargs.items():
        print(f"{key}: {value}")

example_function_with_kwargs(name="Alice", age=30, city="New York")  # Calling the function with keyword arguments

def example_with_args_and_kwargs(*a, **k):
    print("Keyword arguments:", k)
    print("Positional arguments:", a)
example_with_args_and_kwargs("Hello", "World")  


def swiggy_orders(*orders, **restaurant):
    print("Positional arguments:", orders)
    print("Keyword arguments:", restaurant)

swiggy_orders("Pizza", "Burger", "Pasta", "Coke",
              restaurant_name="Domino's", location="Nungambakkam", customer_name="John Wick") 

def order_processing(**orders):
    for order_id, order_details in orders.items():
        print(f"Order ID: {order_id}")
        print(f"Order Details: {order_details}")
        print("-----")
order_processing(
    order_1={"item": "Pizza", "quantity": 2},
    order_2={"item": "Burger", "quantity": 1},
    order_3={"item": "Pasta", "quantity": 3}
) 
# Calling the function with both positional and keyword arguments