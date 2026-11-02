# ==============================================================================
# CLASS NOTES: PYTHON LOOPING STATEMENTS (ITERATIONS)
# Date: 02-11-2026
# ==============================================================================

# Looping statements allow repetitive execution of a block of code either:
# 1. A definite number of times over a sequence/collection -> `for` loop
# 2. As long as a specified condition remains True -> `while` loop
#
# Loops are fundamental in Data Engineering for processing record streams,
# transforming row batches, reading files, and polling data pipelines.


# ==============================================================================
# 1. THE 'for' LOOP (COLLECTION & SEQUENCE ITERATION)
# ==============================================================================
# In Python, the `for` loop is an "iterator-based" loop. It traverses through
# the items of any iterable (strings, lists, tuples, sets, dictionaries, ranges).
#
# Syntax:
#   for variable in iterable:
#       statement(s)

print("--- 1. FOR LOOP OVER COLLECTIONS ---")

# A. Iterating through a List:
fruits = ["Apple", "Banana", "Cherry"]
print("Iterating over List:")
for fruit in fruits:
    print(f"  - Fruit: {fruit}")

# B. Iterating through a String:
word = "DATA"
print("\nIterating over String characters:")
for char in word:
    print(f"  - Char: {char}")

# C. Iterating through a Dictionary:
student = {"name": "Arun", "role": "Data Engineer", "batch": 2026}

print("\nIterating over Dictionary Keys:")
for key in student:
    print(f"  - Key: {key}")

print("\nIterating over Dictionary Key-Value Pairs:")
for key, value in student.items():
    print(f"  - {key}: {value}")


# ==============================================================================
# 2. THE range() FUNCTION
# ==============================================================================
# The built-in range() function generates an immutable sequence of numbers.
# It is memory-efficient because it generates values on demand (lazy sequence),
# rather than storing all numbers in memory at once.
#
# Syntax variations:
#   range(stop)              -> Starts at 0, increments by 1, ends at stop - 1
#   range(start, stop)       -> Starts at start, ends at stop - 1
#   range(start, stop, step) -> Starts at start, jumps by step, ends before stop

print("\n--- 2. THE range() FUNCTION ---")

# A. range(stop): 0 to 4
print("range(5):", list(range(5)))

# B. range(start, stop): 1 to 5
print("range(1, 6):", list(range(1, 6)))

# C. range(start, stop, step) - Even numbers:
print("range(2, 11, 2):", list(range(2, 11, 2)))

# D. Reverse range (Negative step):
print("Counting down (5 down to 1):")
for i in range(5, 0, -1):
    print(f"  Countdown: {i}")

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (range):
# ------------------------------------------------------------------------------
# 1. Python 2 vs. Python 3:
#    - Python 2 had `range()` (created full list in memory) and `xrange()` (lazy sequence).
#    - Python 3 `range()` is an immutable sequence type that operates in O(1) memory!
# 2. Upper Bound Exclusion:
#    - `range(start, stop)` ALWAYS excludes `stop`. It runs up to `stop - 1`.


# ==============================================================================
# 3. THE 'while' LOOP (CONDITION-CONTROLLED ITERATION)
# ==============================================================================
# Executes a block of code repeatedly AS LONG AS a given condition evaluates to True.
# Useful when the total number of iterations is NOT known beforehand.
#
# Crucial Components of a while loop:
# 1. Initialization: Variable initialized before entering loop.
# 2. Condition: Evaluated before each iteration.
# 3. Update/Increment: Modifies variable inside loop (prevents infinite loop!).
#
# Syntax:
#   initialization
#   while condition:
#       statement(s)
#       update/step

print("\n--- 3. WHILE LOOP ---")
counter = 1
while counter <= 5:
    print(f"  Counter value: {counter}")
    counter += 1  # Crucial update step!

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (while LOOP):
# ------------------------------------------------------------------------------
# 1. Infinite Loops & Safe Exits:
#    - Forgetting the increment/update step creates an infinite loop (`while True:`).
#    - Infinite loops are useful in data engineering for daemons or event listeners,
#      paired with a conditional `break`.
# 2. Zero Iteration Possibility:
#    - If the initial condition is False from the start, the `while` block NEVER runs.


# ==============================================================================
# 4. LOOP CONTROL STATEMENTS: break, continue, pass
# ==============================================================================
# Control statements alter the standard flow of iterations within a loop.

print("\n--- 4. LOOP CONTROL STATEMENTS ---")

# A. break: Terminate the loop immediately
print("A. Testing 'break' (stop when num == 3):")
for num in range(1, 6):
    if num == 3:
        print("    -> Hit break! Exiting loop.")
        break
    print(f"    Processing: {num}")

# B. continue: Skip current iteration and jump to next
print("\nB. Testing 'continue' (skip even numbers):")
for num in range(1, 6):
    if num % 2 == 0:
        continue  # Skips print statement below for even numbers
    print(f"    Odd number: {num}")

# C. pass: Syntactic placeholder (does nothing)
print("\nC. Testing 'pass':")
for num in range(1, 4):
    if num == 2:
        pass  # TODO: Special handling for 2 planned later
    print(f"    Number: {num}")

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (LOOP CONTROL):
# ------------------------------------------------------------------------------
# 1. break vs. continue vs. pass (Classic Interview Question):
#    - `break`: Completely ABORTS the loop.
#    - `continue`: ABORTS ONLY THE CURRENT ITERATION and proceeds to the next.
#    - `pass`: NULL STATEMENT (no-op). Keeps syntactic integrity without doing anything.
# 2. Scope of break:
#    - `break` only terminates the INNERMOST enclosing loop, not all outer loops!


# ==============================================================================
# 5. THE 'else' CLAUSE WITH LOOPS (UNIQUE PYTHON FEATURE!)
# ==============================================================================
# Python uniquely allows an `else` block attached directly to `for` and `while` loops!
#
# RULE:
# The `else` block executes ONLY IF the loop finishes NORMALLY
# (i.e. reaches its natural end without encountering a `break` statement).
# If the loop is terminated by `break`, the `else` block is SKIPPED!

print("\n--- 5. LOOP WITH ELSE CLAUSE ---")

# Scenario 1: Searching for an item (Found -> breaks -> else skipped)
target = 15
numbers_list = [5, 10, 15, 20, 25]

print(f"Searching for {target}:")
for n in numbers_list:
    if n == target:
        print(f"  Found {target}! Exiting with break.")
        break
else:
    print(f"  {target} NOT found in list.")

# Scenario 2: Searching for an item (Not found -> natural finish -> else runs)
target = 99
print(f"\nSearching for {target}:")
for n in numbers_list:
    if n == target:
        print(f"  Found {target}!")
        break
else:
    print(f"  {target} NOT found in list. ('else' block executed successfully)")

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (LOOP ELSE):
# ------------------------------------------------------------------------------
# 1. "no-break" Concept:
#    - Think of loop `else` as `nobreak`! It signals that search completion succeeded
#      without early termination.
# 2. Elimination of Flag Variables:
#    - Without `for-else`, programmers had to create awkward boolean flags like `found = False`.
#      The `else` clause removes the need for flags.


# ==============================================================================
# 6. NESTED LOOPS
# ==============================================================================
# A loop inside another loop.
# For every single iteration of the outer loop, the inner loop completes all its iterations.
# Time complexity is typically O(N * M), or O(N^2) if dimensions match.

print("\n--- 6. NESTED LOOPS DEMO ---")

# Multiplication Table Snippet (2 x 3 grid):
for i in range(1, 4):
    for j in range(1, 4):
        print(f"  {i} x {j} = {i * j}", end=" | ")
    print()  # New line after inner loop finishes


# ==============================================================================
# 7. USEFUL PYTHON LOOP BUILT-INS: enumerate() & zip()
# ==============================================================================
# In Python, avoid indexing like `for i in range(len(my_list)):`.
# Use idiomatic built-ins instead!

print("\n--- 7. LOOP HELPER BUILT-INS ---")

# A. enumerate(iterable, start=0):
# Provides index and element simultaneously as a tuple (index, item).
technologies = ["Python", "SQL", "Apache Spark", "Airflow"]
print("A. Using enumerate():")
for index, tech in enumerate(technologies, start=1):
    print(f"  Step {index}: {tech}")

# B. zip(*iterables):
# Pairs elements from multiple iterables in parallel. Stops at shortest sequence.
names = ["Alice", "Bob", "Charlie"]
scores = [92, 85, 96]
print("\nB. Using zip() to pair sequences:")
for name, score in zip(names, scores):
    print(f"  Student: {name} | Score: {score}")

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (HELPERS):
# ------------------------------------------------------------------------------
# 1. itertools.zip_longest:
#    - `zip()` truncates to the shortest iterable. If you need to keep going and fill
#      missing values with `None`, use `itertools.zip_longest()`.
# 2. enumerate() Efficiency:
#    - `enumerate()` produces generator tuples on the fly without duplicating list memory.


# ==============================================================================
# 8. COMMON INTERVIEW QUESTIONS & CODING PATTERNS
# ==============================================================================
print("\n--- 8. COMMON INTERVIEW PATTERNS ---")

# Pattern A: Sum of First N Numbers
n = 10
total_sum = 0
for i in range(1, n + 1):
    total_sum += i
print(f"Sum of 1 to {n} using loop: {total_sum} (Formula check: {n * (n + 1) // 2})")

# Pattern B: Factorial Calculation
num = 5
factorial = 1
temp = num
while temp > 1:
    factorial *= temp
    temp -= 1
print(f"Factorial of {num}!: {factorial}")

# Pattern C: Reversing a Number using while loop
original_num = 12345
reversed_num = 0
n_copy = original_num
while n_copy > 0:
    last_digit = n_copy % 10
    reversed_num = (reversed_num * 10) + last_digit
    n_copy //= 10
print(f"Original: {original_num} -> Reversed: {reversed_num}")

# Pattern D: Prime Number Check using for-else
candidate = 29
is_prime = True
if candidate <= 1:
    is_prime = False
else:
    for divisor in range(2, int(candidate ** 0.5) + 1):
        if candidate % divisor == 0:
            is_prime = False
            break
print(f"Is {candidate} Prime?: {is_prime}")

