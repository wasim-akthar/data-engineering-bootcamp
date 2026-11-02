# ==============================================================================
# CLASS NOTES: PYTHON CONTROL STATEMENTS (CONDITIONAL FLOW)
# Date: 30-10-2026
# ==============================================================================

# Control Statements determine the flow of execution in a Python program.
# By default, Python code executes sequentially (top to bottom). Control
# statements allow us to branch, skip, or conditionally execute blocks of code
# based on boolean expressions.


# ==============================================================================
# 1. PYTHON INDENTATION & CONDITIONAL SYNTAX RULES
# ==============================================================================
# Unlike C, C++, or Java that use curly braces { } to define blocks of code,
# Python uses INDENTATION (whitespace).
#
# Rules:
# - Standard indentation is 4 SPACES per level (PEP 8 standard). Never mix tabs and spaces!
# - Every conditional statement must end with a colon (:).
# - All statements inside a block must share the exact same indentation level.

print("--- 1. BASIC INDENTATION DEMO ---")
status_code = 200
if status_code == 200:
    print("Success: Request was processed successfully.")
    print("All statements indented at this level belong to this 'if' block.")
print("This line is unindented, so it executes unconditionally.\n")


# ==============================================================================
# 2. THE SIMPLE 'if' STATEMENT (SINGLE-WAY DECISION)
# ==============================================================================
# Executes a block of code ONLY IF the condition evaluates to True.
# If the condition is False, the block is skipped.
#
# Syntax:
#   if condition:
#       statement(s)

print("--- 2. SIMPLE IF STATEMENT ---")
age = 21
if age >= 18:
    print(f"Age {age}: Eligible to vote.")

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (SIMPLE IF):
# ------------------------------------------------------------------------------
# 1. Condition Evaluation:
#    - Any non-boolean expression in `if condition:` is converted via `bool(condition)`.
#    - Pythonic way: Use `if my_list:` instead of `if len(my_list) > 0:` because
#      empty collections evaluate to False (Falsy).


# ==============================================================================
# 3. THE 'if - else' STATEMENT (TWO-WAY DECISION)
# ==============================================================================
# Executes one block if the condition is True, and an alternative block if False.
# Exactly ONE of the two blocks will execute.
#
# Syntax:
#   if condition:
#       statement(s) when True
#   else:
#       statement(s) when False

print("\n--- 3. IF - ELSE STATEMENT ---")
number = 15
if number % 2 == 0:
    print(f"{number} is Even.")
else:
    print(f"{number} is Odd.")

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (IF - ELSE):
# ------------------------------------------------------------------------------
# 1. The 'else' clause has NO condition:
#    - Writing `else (x > 5):` is a SyntaxError!
# 2. Mutual Exclusivity:
#    - An `if-else` pair guarantees that one and only one branch executes.


# ==============================================================================
# 4. THE 'if - elif - else' LADDER (MULTI-WAY DECISION)
# ==============================================================================
# Used when you have multiple mutually exclusive conditions to test sequentially.
# Python evaluates conditions from top to bottom:
# - As soon as ONE condition evaluates to True, its block runs, and the rest are SKIPPED.
# - The final 'else' is optional and acts as a default fallback if none match.

print("\n--- 4. IF - ELIF - ELSE LADDER ---")
score = 85

if score >= 90:
    grade = "A+"
elif score >= 80:
    grade = "A"
elif score >= 70:
    grade = "B"
elif score >= 60:
    grade = "C"
else:
    grade = "Fail"

print(f"Score: {score} -> Grade: {grade}")

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (ELIF LADDER):
# ------------------------------------------------------------------------------
# 1. Order of Conditions Matters (Critical Interview Trap!):
#    - Conditions must be ordered logically (most restrictive first).
#    - If you write `if score >= 60:` first, scores of 95 will stop there and get 'C'!
# 2. Multiple 'if' vs. 'if-elif':
#    - A sequence of independent `if` statements tests EVERY condition, even after a match.
#    - An `if-elif` ladder exits immediately after the FIRST matching condition (much faster!).


# ==============================================================================
# 5. NESTED CONDITIONAL STATEMENTS
# ==============================================================================
# An 'if', 'elif', or 'else' block placed inside another conditional block.
# Used for hierarchical / multi-layered decision making.

print("\n--- 5. NESTED IF STATEMENTS ---")
account_active = True
balance = 5000
withdrawal_amount = 2000

if account_active:
    if balance >= withdrawal_amount:
        balance -= withdrawal_amount
        print(f"Withdrawal of Rs.{withdrawal_amount} successful! New balance: Rs.{balance}")
    else:
        print("Transaction failed: Insufficient funds.")
else:
    print("Transaction failed: Account is suspended.")

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (NESTED IF):
# ------------------------------------------------------------------------------
# 1. Flattening Nested Conditions (Clean Code Principle):
#    - Deeply nested `if` statements ("arrow anti-pattern") reduce readability.
#    - Prefer combining with logical `and`:
#      `if account_active and balance >= withdrawal_amount:`
#    - Or use guard clauses (early returns) in functions.


# ==============================================================================
# 6. TERNARY OPERATOR / CONDITIONAL EXPRESSIONS
# ==============================================================================
# A concise, single-line way to evaluate a condition and return a value.
#
# Syntax:
#   value_if_true if condition else value_if_false

print("\n--- 6. TERNARY OPERATOR (CONDITIONAL EXPRESSION) ---")

# A. Basic Ternary Example:
a = 25
b = 40
max_num = a if a > b else b
print(f"Between {a} and {b}, Greater is: {max_num}")

# Inline formatting with f-strings (frequently used in data pipelines):
print(f"{'First' if a > b else 'Second'} number is greater.")

# B. Chained Ternary Operator (Greatest of 3 Numbers):
# Formula: a if (a > b and a > c) else (b if b > c else c)
num1, num2, num3 = 45, 92, 63
greatest = num1 if (num1 > num2 and num1 > num3) else (num2 if num2 > num3 else num3)
print(f"Greatest among ({num1}, {num2}, {num3}) is: {greatest}")

# C. Real-world Discount / Coupon Eligibility Check:
amount = 1200
has_coupon = True
status = "Eligible for Discount" if (amount > 1000 and has_coupon) else "Not Eligible"
print(f"Purchase Rs.{amount}: {status}")

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (TERNARY OPERATOR):
# ------------------------------------------------------------------------------
# 1. Expression vs. Statement:
#    - A standard `if-else` is a statement (does not return a value).
#    - A ternary expression (`x if cond else y`) produces a VALUE and can be
#      assigned to a variable or passed directly into functions.
# 2. 'else' is MANDATORY in Ternary:
#    - `x if cond` without `else` raises a SyntaxError in Python!
# 3. Readability Threshold:
#    - Simple ternary is clean and pythonic; deeply chained ternaries hurt readability
#      and should be replaced with `if-elif-else` in production pipelines.


# ==============================================================================
# 7. STRUCTURAL PATTERN MATCHING: match - case (Python 3.10+)
# ==============================================================================
# Modern alternative to long `if-elif-else` chains (similar to 'switch-case' in Java/C++).
# Uses the `match` statement and `case` patterns.
# The underscore `case _:` acts as the default wildcard fallback (like 'default' in C/Java).

print("\n--- 7. MATCH - CASE STATEMENT (Python 3.10+) ---")
http_status = 404

match http_status:
    case 200:
        response_msg = "OK - Success"
    case 301 | 302:
        response_msg = "Redirected"
    case 400:
        response_msg = "Bad Request"
    case 404:
        response_msg = "Not Found"
    case 500:
        response_msg = "Internal Server Error"
    case _:
        response_msg = "Unknown Status Code"

print(f"HTTP Status {http_status}: {response_msg}")

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (MATCH-CASE):
# ------------------------------------------------------------------------------
# 1. Introduced in Python 3.10:
#    - Before Python 3.10, Python had NO switch-case statement!
#    - Developers historically used dictionaries or `if-elif-else`.
# 2. No 'break' needed:
#    - Unlike C/Java where case blocks "fall through" unless `break` is present,
#      Python `match-case` automatically breaks after the matching case!
# 3. Multiple Patterns:
#    - Combine multiple values in one case using the pipe `|` operator (e.g., `case 301 | 302:`).


# ==============================================================================
# 8. CONTROL TRANSFER / JUMP STATEMENTS: pass, break, continue
# ==============================================================================
# Used to alter the control flow inside conditional blocks and loops.

print("\n--- 8. PASS STATEMENT ---")
# 'pass' is a null statement. Nothing happens when it executes.
# It is used as a placeholder where syntactically code is required, but you don't
# want to write logic yet (prevents IndentationError).

debug_mode = True
if debug_mode:
    pass  # TODO: Implement logging pipeline later
print("'pass' executed cleanly without raising any syntax error.")

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (CONTROL TRANSFER):
# ------------------------------------------------------------------------------
# 1. Difference between pass, break, and continue (Classic Interview Question):
#    - `pass`: Does NOTHING. A syntactic placeholder (no-op).
#    - `break`: TERMINATES the nearest enclosing loop completely.
#    - `continue`: SKIPS the rest of the current iteration and jumps to the next.
# 2. Pass in Abstract Classes / Stubs:
#    - `pass` is widely used when defining empty classes, interface methods, or stubs:
#      `def process_data(df): pass`


# ==============================================================================
# 9. FREQUENT INTERVIEW CODING PROBLEMS & PATTERNS
# ==============================================================================
print("\n--- 9. FREQUENT INTERVIEW PROBLEMS ---")

# Problem A: Leap Year Determination
# Rule: A year is a leap year if divisible by 4, EXCEPT century years,
# which must be divisible by 400.
year = 2024
is_leap = (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0)
print(f"Year {year} is Leap Year: {is_leap}")

# Problem B: Positive, Negative, or Zero Check
val = -7
if val > 0:
    val_type = "Positive"
elif val < 0:
    val_type = "Negative"
else:
    val_type = "Zero"
print(f"Number {val} is: {val_type}")

# Problem C: Truthy / Falsy in Conditional Execution
# In Python, you should NEVER write: `if len(records) == 0:`
# Write pythonically: `if not records:`
records = []
if not records:
    print("Dataset is empty. Skipping transformation pipeline.")

