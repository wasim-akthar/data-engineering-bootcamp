# ==============================================================================
# CLASS NOTES: VARIABLES, DATA TYPES, INPUT & OUTPUT FUNCTIONS IN PYTHON
# Date: 27-10-2026
# ==============================================================================


# ==============================================================================
# 1. WHAT IS A VARIABLE?
# ==============================================================================
# A variable is a named reference in memory used to store data values.
# In Python, variables are dynamically typed, meaning you don't need to specify
# the type during declaration; Python deduces it at runtime.
#
# Syntax:
#   variable_name = value
#
# Naming Rules & Conventions:
# - Must begin with a letter (a-z, A-Z) or an underscore (_).
# - Cannot begin with a number.
# - Can only contain alphanumeric characters and underscores (A-z, 0-9, and _).
# - Case-sensitive: 'total', 'Total', and 'TOTAL' are three distinct variables.
# - Cannot use Python reserved keywords (e.g., if, for, while, class, def, True, False, None).

# ------------------------------------------------------------------------------
# 💡 NOTES TO REMEMBER (VARIABLES):
# ------------------------------------------------------------------------------
# 1. Dynamic Typing: Python determines variable types at runtime, unlike statically
#    typed languages (e.g., Java, C++).
# 2. Variables are References (Pointers): In Python, variables do not hold the actual
#    values directly; they hold memory references (pointers) to objects.
# 3. Multiple Assignment:
#    - Assign different values: a, b, c = 1, 2, 3
#    - Assign same value to many: x = y = z = 0
# 4. Swapping Variables (Classic Interview Question):
#    - Python allows swapping without a temporary variable:
#      a, b = b, a
# 5. PEP 8 Naming Conventions:
#    - Variables & Functions: snake_case (e.g., user_age, total_amount)
#    - Constants: UPPER_CASE_SNAKE (e.g., PI, MAX_CONNECTIONS)
#    - Classes: PascalCase (e.g., DataPipeline, UserAccount)


# ==============================================================================
# 2. PYTHON DATA TYPES & EXAMPLES
# ==============================================================================
# Python has several built-in data types. We can check the type of any variable
# using the built-in type() function and its unique memory address using id().

# 1. int (Integer): Whole numbers (positive, negative, or zero) without decimals.
age = 21
print("age:", age, "| Type:", type(age))

# 2. float (Floating-point): Numbers containing decimal points or exponential forms.
price = 99.50
print("price:", price, "| Type:", type(price))

# 3. str (String): Sequence of characters enclosed in single ('...') or double ("...") quotes.
name = "Arun"
print("name:", name, "| Type:", type(name))

# 4. bool (Boolean): Represents one of two truth values: True or False.
is_active = True
print("is_active:", is_active, "| Type:", type(is_active))

# 5. list: Ordered, mutable (modifiable) sequence of items enclosed in square brackets [ ].
marks = [80, 90, 75]
print("marks:", marks, "| Type:", type(marks))

# 6. tuple: Ordered, immutable (read-only) sequence of items enclosed in parentheses ( ).
point = (10, 20)
print("point:", point, "| Type:", type(point))

# 7. set: Unordered collection of unique items (no duplicates) enclosed in curly braces { }.
numbers = {1, 2, 3}
print("numbers:", numbers, "| Type:", type(numbers))

# 8. dict (Dictionary): Unordered key-value pairs enclosed in curly braces {key: value}.
student = {"name": "Arun"}
print("student:", student, "| Type:", type(student))

# 9. NoneType: Special type representing the absence of a value or null.
result = None
print("result:", result, "| Type:", type(result))

# ------------------------------------------------------------------------------
# 💡 NOTES TO REMEMBER (DATA TYPES):
# ------------------------------------------------------------------------------
# 1. Mutability vs. Immutability (TOP Interview Topic):
#    - Mutable (Can be modified in-place): list, dict, set.
#    - Immutable (Cannot be changed after creation): int, float, str, tuple, bool, frozenset.
# 2. List vs. Tuple:
#    - Lists are mutable ([ ]); Tuples are immutable (( )).
#    - Tuples are faster, consume less memory, and can be used as dictionary keys
#      because they are hashable.
# 3. Set Characteristics:
#    - Sets automatically eliminate duplicate elements.
#    - Unindexed: You CANNOT access elements via index like numbers[0].
#    - Average lookup/search time in sets and dictionaries is O(1) due to hashing.
# 4. Dictionary Keys Constraint:
#    - Dictionary keys MUST be immutable/hashable (e.g., strings, numbers, tuples).
#    - Lists and dictionaries CANNOT be dictionary keys.
# 5. Falsy Values in Python:
#    - The following evaluate to False in boolean checks:
#      None, False, 0, 0.0, "" (empty str), [] (empty list), () (empty tuple), {} (empty dict), set()
# 6. Checking for None:
#    - Always check using identity: `if result is None:` (NOT `if result == None:`).


# ==============================================================================
# 3. OUTPUT FUNCTION: print()
# ==============================================================================
# The print() function outputs data to the standard output (screen/console).

# A. Basic Output:
print("\n--- OUTPUT DEMONSTRATIONS ---")
print("Hello World!")

# B. Printing Multiple Values (separated by spaces by default):
first_name = "Wasim"
my_age = 25
print("Name:", first_name, "| Age:", my_age)

# C. The 'sep' Parameter:
# Specifies the separator string inserted between values (default is a space ' ').
print("2026", "10", "27", sep="-")           # Output: 2026-10-27
print("apple", "banana", "cherry", sep=", ")  # Output: apple, banana, cherry

# D. The 'end' Parameter:
# Specifies what is printed at the end (default is a newline character '\n').
print("Loading", end="...")
print("Done!")  # Prints on the same line: Loading...Done!

# E. Combining Strings & Numbers:
# 1. Type Casting with str():
#    Trying to do "Age: " + 25 causes a TypeError because str + int is invalid.
#    Convert the number using str() first:
print("My age is " + str(25))

# 2. Formatted Strings (f-strings) - Recommended:
print(f"My name is {first_name} and my age is {my_age}.")

# ------------------------------------------------------------------------------
# 💡 NOTES TO REMEMBER (OUTPUT & PRINT):
# ------------------------------------------------------------------------------
# 1. Return Value of print():
#    - print() displays output to stdout and always returns `None`.
# 2. The TypeError Pitfall:
#    - In Python, strong typing prevents implicit type coercion:
#      "Result: " + 10  --> Raises TypeError: can only concatenate str to str.
# 3. Evolution of String Formatting in Python:
#    - % operator: "%s is %d" % ("Wasim", 25) (Old C-style)
#    - str.format(): "{} is {}".format("Wasim", 25) (Python 2.7+)
#    - f-strings: f"{name} is {age}" (Introduced in Python 3.6, fastest & most readable).
# 4. Default Parameter Values:
#    - print(*objects, sep=' ', end='\n', file=sys.stdout, flush=False)


# ==============================================================================
# 4. INPUT FUNCTION: input()
# ==============================================================================
# The input() function allows a program to receive data entered by the user
# via the keyboard.
#
# IMPORTANT KEY RULE:
# The input() function ALWAYS returns the user's input as a String (str),
# even if the user types numbers!
#
# To perform mathematical calculations, you MUST convert (type cast) the input:
# - int(input(...))   -> for whole numbers
# - float(input(...)) -> for decimal numbers

print("\n--- INPUT DEMONSTRATIONS (Examples) ---")

# Example A: Reading String Input
# user_name = input("Enter your name: ")
# print(f"Hello, {user_name}! Data type: {type(user_name)}")

# Example B: Reading Integer Input (requires int() type casting)
# user_age = int(input("Enter your age: "))
# print(f"Next year you will be {user_age + 1} years old. Data type: {type(user_age)}")

# Example C: Reading Float Input (requires float() type casting)
# item_price = float(input("Enter item price: "))
# tax = item_price * 0.18
# print(f"Total with 18% tax: {item_price + tax:.2f}")

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (INPUT):
# ------------------------------------------------------------------------------
# 1. Always a String:
#    - input() always returns str. If you take two inputs without converting:
#      a = input()  # user enters 10
#      b = input()  # user enters 20
#      a + b        --> results in "1020" (string concatenation), NOT 30!
# 2. ValueError on Invalid Conversion:
#    - int("10.5") or int("abc") raises ValueError.
#    - To convert a float-like string: int(float("10.5")) -> 10.
# 3. Taking Multiple Inputs in One Line (Common in Coding Tests/Interviews):
#    - Reading two integers separated by space:
#      x, y = map(int, input().split())
#    - Reading a list of integers:
#      nums = list(map(int, input().split()))