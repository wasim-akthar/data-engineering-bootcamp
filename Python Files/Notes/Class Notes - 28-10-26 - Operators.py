# ==============================================================================
# CLASS NOTES: PYTHON OPERATORS
# Date: 28-10-2026
# ==============================================================================

# Operators are special symbols in Python used to perform computations and
# logical operations on values and variables (called operands).


# ==============================================================================
# 1. ARITHMETIC OPERATORS
# ==============================================================================
# Used to perform standard mathematical operations on numeric data types.

a = 15
b = 4

print("--- 1. ARITHMETIC OPERATORS ---")
print("Addition (a + b):", a + b)           # 19
print("Subtraction (a - b):", a - b)        # 11
print("Multiplication (a * b):", a * b)     # 60
print("Division (a / b):", a / b)           # 3.75 (Always returns a float!)
print("Floor Division (a // b):", a // b)   # 3 (Discards decimal; rounds down)
print("Modulus (a % b):", a % b)            # 3 (Remainder of division)
print("Exponentiation (a ** b):", a ** b)   # 15^4 = 50625

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (ARITHMETIC):
# ------------------------------------------------------------------------------
# 1. Division (/ vs //):
#    - Single slash (/) ALWAYS produces a float (e.g., 4 / 2 -> 2.0).
#    - Double slash (//) performs floor division, rounding down towards negative
#      infinity (e.g., 7 // 2 -> 3, but -7 // 2 -> -4, NOT -3!).
# 2. Modulus with Negatives:
#    - Formula: a % b = a - (b * (a // b))
#    - Example: -7 % 2 = -7 - (2 * (-4)) = 1 (Python modulus always matches the sign of divisor b).
# 3. String & List Operators (Operator Overloading):
#    - `+` concatenates strings/lists: "Data" + " " + "Eng" -> "Data Eng"
#    - `*` replicates strings/lists: "abc" * 3 -> "abcabcabc", [0] * 5 -> [0, 0, 0, 0, 0]
# 4. ZeroDivisionError:
#    - Dividing by 0 (with /, //, or %) raises a ZeroDivisionError at runtime.


# ==============================================================================
# 2. COMPARISON (RELATIONAL) OPERATORS
# ==============================================================================
# Used to compare two values. They always return a Boolean: True or False.

x = 10
y = 20

print("\n--- 2. COMPARISON OPERATORS ---")
print("Equal to (x == y):", x == y)                 # False
print("Not equal to (x != y):", x != y)             # True
print("Greater than (x > y):", x > y)               # False
print("Less than (x < y):", x < y)                  # True
print("Greater than or equal to (x >= 10):", x >= 10) # True
print("Less than or equal to (y <= 20):", y <= 20)    # True

# Chained Comparisons (Python-specific feature):
n = 15
print("Chained comparison (10 < n < 20):", 10 < n < 20)  # True (equivalent to: 10 < n and n < 20)

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (COMPARISON):
# ------------------------------------------------------------------------------
# 1. Assignment (=) vs. Equality (==):
#    - `=` assigns a value to a variable.
#    - `==` checks if two values are equal in value/content.
# 2. Chained Comparisons:
#    - Python uniquely allows chaining: `1 < x < 5 < y`.
#    - Every condition is evaluated lazily from left to right.
# 3. String Comparison:
#    - Strings are compared lexicographically (alphabetical order using ASCII/Unicode values).
#    - Example: "apple" < "banana" is True; "apple" < "Apple" is False because 'a' (97) > 'A' (65).


# ==============================================================================
# 3. LOGICAL OPERATORS
# ==============================================================================
# Used to combine conditional statements: and, or, not.

p = True
q = False

print("\n--- 3. LOGICAL OPERATORS ---")
print("Logical AND (p and q):", p and q)    # False (True only if BOTH operands are True)
print("Logical OR (p or q):", p or q)       # True  (True if AT LEAST ONE operand is True)
print("Logical NOT (not p):", not p)        # False (Inverts the boolean value)

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (LOGICAL & SHORT-CIRCUITING):
# ------------------------------------------------------------------------------
# 1. Short-Circuit Evaluation (Crucial Interview Topic!):
#    - In `A and B`: If A is False, B is NEVER evaluated (result is already False).
#    - In `A or B`: If A is True, B is NEVER evaluated (result is already True).
# 2. Logical Operators Return Operands, Not Just Booleans:
#    - Python's `and` and `or` return the actual value that determined the result!
#    - `x or y`: Returns x if x is truthy, otherwise returns y.
#      Example: "" or "default" -> "default"
#    - `x and y`: Returns x if x is falsy, otherwise returns y.
#      Example: "Hello" and "World" -> "World"
# 3. Precedence among Logical Operators:
#    - `not` > `and` > `or`
#    - Example: `True or False and False` evaluates to `True or (False and False)` -> `True`.


# ==============================================================================
# 4. ASSIGNMENT OPERATORS
# ==============================================================================
# Used to assign and modify values in variables.

count = 10
print("\n--- 4. ASSIGNMENT OPERATORS ---")
print("Initial count:", count)

count += 5   # Equivalent to: count = count + 5
print("After count += 5:", count)    # 15

count -= 3   # Equivalent to: count = count - 3
print("After count -= 3:", count)    # 12

count *= 2   # Equivalent to: count = count * 2
print("After count *= 2:", count)    # 24

count /= 4   # Equivalent to: count = count / 4
print("After count /= 4:", count)    # 6.0 (becomes float due to /)

count //= 2  # Equivalent to: count = count // 2
print("After count //= 2:", count)   # 3.0

count %= 2   # Equivalent to: count = count % 2
print("After count %= 2:", count)    # 1.0

count **= 3  # Equivalent to: count = count ** 3
print("After count **= 3:", count)   # 1.0

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (ASSIGNMENT):
# ------------------------------------------------------------------------------
# 1. No Increment (++) or Decrement (--) Operators in Python:
#    - Python does NOT support `x++` or `++x` or `x--`.
#    - `++x` in Python is interpreted as `+(+x)` (unary plus), leaving x unchanged!
#    - Always use `x += 1` or `x -= 1`.
# 2. Walrus Operator `:=` (Python 3.8+):
#    - Known as the assignment expression operator.
#    - Assigns a value to a variable as part of an expression.
#    - Example: `if (n := len(data)) > 0: print(f"Processing {n} records")`


# ==============================================================================
# 5. MEMBERSHIP OPERATORS
# ==============================================================================
# Used to test whether a value or variable is present in a sequence/collection
# (string, list, tuple, set, dict).

course = "Data Engineering Bootcamp"
skills = ["Python", "SQL", "Spark", "Airflow"]
student_info = {"name": "Arun", "role": "Data Engineer"}

print("\n--- 5. MEMBERSHIP OPERATORS ---")
print("'Data' in course:", "Data" in course)               # True
print("'Java' not in skills:", "Java" not in skills)       # True
print("'Python' in skills:", "Python" in skills)           # True

# In Dictionaries, 'in' checks KEYS by default:
print("'name' in student_info:", "name" in student_info)   # True
print("'Arun' in student_info:", "Arun" in student_info)   # False (checks keys, not values)
print("'Arun' in student_info.values():", "Arun" in student_info.values()) # True

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (MEMBERSHIP & TIME COMPLEXITY):
# ------------------------------------------------------------------------------
# 1. Time Complexity (Big-O) in Interviews:
#    - In `list` / `tuple` / `str`: `item in sequence` takes O(n) linear time
#      (must scan item by item).
#    - In `set` / `dict`: `item in collection` takes O(1) constant time on average
#      (uses hash tables).
#    - DATA ENGINEERING TIP: For fast lookups across millions of IDs, convert
#      lists to sets!
# 2. Dictionary Search:
#    - `key in dict` searches dictionary keys, NOT values.


# ==============================================================================
# 6. IDENTITY OPERATORS
# ==============================================================================
# Used to compare memory locations of two objects: `is` and `is not`.
# They check if two variables refer to the EXACT SAME object in memory.

list1 = [1, 2, 3]
list2 = [1, 2, 3]
list3 = list1

print("\n--- 6. IDENTITY OPERATORS ---")
print("list1 == list2 (Value equality):", list1 == list2) # True (same contents)
print("list1 is list2 (Object identity):", list1 is list2) # False (different memory addresses)
print("list1 is list3 (Object identity):", list1 is list3) # True (points to same object)
print("list1 is not list2:", list1 is not list2)          # True

# Checking memory IDs:
print("id(list1):", id(list1))
print("id(list2):", id(list2))
print("id(list3):", id(list3))

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (IDENTITY vs EQUALITY):
# ------------------------------------------------------------------------------
# 1. `==` vs `is` (Classic Interview Question):
#    - `==` checks if the VALUES are equal (calls __eq__() method).
#    - `is` checks if both references point to the EXACT SAME MEMORY ADDRESS (`id(a) == id(b)`).
# 2. Checking None:
#    - Always use `is None` and `is not None` because `None` is a singleton in Python.
# 3. Small Integer Interning (-5 to 256):
#    - Python pre-allocates and caches small integers from -5 to 256.
#    - Example:
#      a = 256; b = 256; a is b  -> True (shared cached memory)
#      x = 1000; y = 1000; x is y -> False (new objects created)


# ==============================================================================
# 7. BITWISE OPERATORS
# ==============================================================================
# Used to perform operations directly on binary representations of integers.

# Binary of 5:  0101
# Binary of 3:  0011
num1 = 5
num2 = 3

print("\n--- 7. BITWISE OPERATORS ---")
print("Bitwise AND (5 & 3):", num1 & num2)   # 0101 & 0011 = 0001 (1)
print("Bitwise OR  (5 | 3):", num1 | num2)   # 0101 | 0011 = 0111 (7)
print("Bitwise XOR (5 ^ 3):", num1 ^ num2)   # 0101 ^ 0011 = 0110 (6)
print("Bitwise NOT (~5):", ~num1)            # Formula: ~x = -(x + 1) -> -6
print("Left Shift  (5 << 1):", num1 << 1)    # 0101 shifted left by 1 = 1010 (10) [Multiplies by 2]
print("Right Shift (5 >> 1):", num1 >> 1)    # 0101 shifted right by 1 = 0010 (2) [Divides by 2]

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (BITWISE):
# ------------------------------------------------------------------------------
# 1. Bitwise NOT Formula:
#    - `~x` always equals `-(x + 1)` because Python uses two's complement for negative numbers.
# 2. Fast Multiplication & Division by Powers of 2:
#    - `x << k` is equivalent to `x * (2 ** k)`
#    - `x >> k` is equivalent to `x // (2 ** k)`
# 3. XOR Tricks for Coding Interviews:
#    - `x ^ x = 0` (any number XORed with itself is 0)
#    - `x ^ 0 = x`
#    - Used in classic LeetCode problems (e.g., "Find the Single Number in an array").


# ==============================================================================
# 8. OPERATOR PRECEDENCE & ASSOCIATIVITY
# ==============================================================================
# Determines the order in which operators are evaluated when multiple operators
# appear in an expression.
#
# Precedence Order (From Highest to Lowest):
# 1. ()                       Parentheses (Grouping)
# 2. **                       Exponentiation (Evaluated Right-to-Left!)
# 3. +x, -x, ~x               Unary plus, minus, bitwise NOT
# 4. *, /, //, %              Multiplication, Division, Floor Division, Modulus
# 5. +, -                     Addition, Subtraction
# 6. <<, >>                   Bitwise shifts
# 7. &                        Bitwise AND
# 8. ^                        Bitwise XOR
# 9. |                        Bitwise OR
# 10. ==, !=, <, <=, >, >=, is, is not, in, not in  Comparisons & Identity/Membership
# 11. not                     Logical NOT
# 12. and                     Logical AND
# 13. or                      Logical OR
# 14. =, +=, -=, *=, ...      Assignment operators

print("\n--- 8. OPERATOR PRECEDENCE DEMO ---")
result_exp = 2 + 3 * 4 ** 2
# Evaluation steps:
# 1. Exponentiation first: 4 ** 2 = 16
# 2. Multiplication next: 3 * 16 = 48
# 3. Addition last: 2 + 48 = 50
print("Result of 2 + 3 * 4 ** 2:", result_exp)  # 50

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (PRECEDENCE):
# ------------------------------------------------------------------------------
# 1. Exponentiation Associativity:
#    - Most binary operators are evaluated Left-to-Right.
#    - Exponentiation (`**`) is evaluated RIGHT-TO-LEFT!
#      Example: `2 ** 3 ** 2` evaluates as `2 ** (3 ** 2)` = `2 ** 9` = `512`, NOT `(2 ** 3) ** 2` (64)!
# 2. Best Practice in Production Code:
#    - Never rely purely on operator precedence memory for complex expressions.
#    - Always use parentheses `()` to make code clear and self-documenting.