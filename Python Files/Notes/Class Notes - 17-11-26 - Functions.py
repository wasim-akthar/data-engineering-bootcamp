# ==============================================================================
# CLASS NOTES: PYTHON FUNCTIONS (DEFINITIVE, IN-DEPTH REFERENCE GUIDE)
# Date: 17-11-2026
# ==============================================================================

# A Function in Python is a named, reusable block of organized code designed
# to execute a specific computation or task.
#
# In Data Engineering, functions form the modular architecture of data pipelines:
# 1. ETL/ELT Step Modularization: Decoupling extraction, validation, cleaning,
#    transformation, and warehouse loading into testable atomic units.
# 2. PySpark & Pandas UDFs: Writing User-Defined Functions for distributed row transformations.
# 3. DRY Principle ("Don't Repeat Yourself"): Reusing cleansing routines (e.g. date parsing,
#    currency formatting, regex extraction) across multiple tables and pipeline runs.
# 4. Pipeline Orchestration & Higher-Order Flow: Passing transformation logic as
#    arguments into orchestrators (Airflow PythonOperators, mapping engines).


# ==============================================================================
# 1. FUNCTION DEFINITION, SYNTAX & RETURN VALUES
# ==============================================================================
# Functions are defined using the `def` keyword, followed by the function name,
# parenthesized parameters `()`, a colon `:`, and an indented code block.
#
# Syntax:
#   def function_name(parameters):
#       """Optional Docstring describing behavior"""
#       statement(s)
#       return value

print("--- 1. BASIC FUNCTION & RETURN VALUES ---")

# A. Function with return value:
def calculate_net_salary(gross_salary, tax_rate=0.10):
    """Calculates net salary after deducting tax."""
    tax = gross_salary * tax_rate
    return gross_salary - tax

net_pay = calculate_net_salary(100000, 0.15)
print(f"Net Salary: ${net_pay:,.2f}")

# B. Functions Without a Return Statement Return `None` (CRITICAL INTERVIEW FACT):
# In Python, if a function does not encounter an explicit `return` statement,
# or encounters a bare `return`, it implicitly returns `None`!
def log_pipeline_status(status_message):
    print(f"  [PIPELINE LOG]: {status_message}")

result_of_log = log_pipeline_status("Bronze layer ingest completed.")
print("Return value of function without return:", result_of_log) # None

# C. Returning Multiple Values (Tuple Packing):
# Python functions can return multiple values separated by commas.
# Python packs them into a single TUPLE, which can be unpacked immediately:
def get_dataset_summary(records):
    total_count = len(records)
    total_sum = sum(records)
    average = total_sum / total_count if total_count else 0
    return total_count, total_sum, average # Returns (total_count, total_sum, average)

data_batch = [10, 20, 30, 40, 50]
count, total, avg = get_dataset_summary(data_batch) # Unpacking
print(f"Batch Summary -> Count: {count}, Sum: {total}, Avg: {avg}")


# ==============================================================================
# 2. PARAMETERS vs. ARGUMENTS & ARGUMENT PASSING TYPES
# ==============================================================================
# Terminology:
# - Parameter: The variable name listed inside the function header `def func(x, y):`.
# - Argument: The actual value sent to the function when calling `func(10, 20)`.

print("\n--- 2. ARGUMENT TYPES ---")

def create_db_connection(host, port, database, timeout=30):
    return f"Connected to {database} at {host}:{port} (timeout={timeout}s)"

# A. Positional Arguments:
# Mapped strictly in the order they are passed:
print("Positional:", create_db_connection("localhost", 5432, "analytics"))

# B. Keyword Arguments (Named arguments):
# Passed by explicitly specifying parameter names. Order does NOT matter!
print("Keyword:", create_db_connection(database="warehouse", port=3306, host="10.0.0.1"))

# RULE: Positional arguments MUST appear BEFORE keyword arguments:
# create_db_connection(host="localhost", 5432, "analytics") # ❌ SyntaxError!

# C. Default Parameters:
# Default values are used if the argument is omitted by the caller (e.g. timeout=30 above).
# RULE: Parameters without defaults MUST appear before parameters with defaults!
# def bad_func(timeout=30, host): # ❌ SyntaxError: non-default argument follows default argument


# ==============================================================================
# 3. THE DANGEROUS DEFAULT VALUE TRAP (TOP-TIER INTERVIEW QUESTION!)
# ==============================================================================
# Python evaluates default parameter expressions ONCE when the function is
# DEFINED (at compile/load time), NOT each time the function is called!
#
# If you use a MUTABLE object (like a `list` or `dict`) as a default parameter,
# that same object is shared and modified across every call that omits the argument!

print("\n--- 3. MUTABLE DEFAULT ARGUMENT TRAP ---")

# ❌ BAD PRACTICE (The Bug):
def append_event_bad(event, event_log=[]):
    event_log.append(event)
    return event_log

print("Bad call 1:", append_event_bad("EVENT_A")) # ['EVENT_A']
print("Bad call 2:", append_event_bad("EVENT_B")) # ['EVENT_A', 'EVENT_B'] <- Persisted from previous call!

# ✅ PYTHONIC & PRODUCTION-SAFE SOLUTION:
# Use `None` as the default sentinel value and initialize inside the function body:
def append_event_clean(event, event_log=None):
    if event_log is None:
        event_log = []
    event_log.append(event)
    return event_log

print("Clean call 1:", append_event_clean("EVENT_A")) # ['EVENT_A']
print("Clean call 2:", append_event_clean("EVENT_B")) # ['EVENT_B'] (Completely fresh!)


# ==============================================================================
# 4. VARIABLE-LENGTH ARGUMENTS: *args AND **kwargs
# ==============================================================================
# Allows writing flexible functions that accept an arbitrary number of inputs.

print("\n--- 4. *args AND **kwargs ---")

# ------------------------------------------------------------------------------
# A. *args (Non-Keyword Arbitrary Arguments):
# - Collects any number of positional arguments into a TUPLE.
# ------------------------------------------------------------------------------
def compute_pipeline_throughput(*metrics):
    print("  *args received as tuple:", metrics, "| Type:", type(metrics))
    return sum(metrics)

print("Sum throughput:", compute_pipeline_throughput(150, 300, 450, 100))

# ------------------------------------------------------------------------------
# B. **kwargs (Keyword Arbitrary Arguments):
# - Collects any number of keyword arguments into a DICTIONARY.
# ------------------------------------------------------------------------------
def build_spark_config(app_name, **configs):
    print(f"  Building config for Spark App: '{app_name}'")
    print("  **kwargs received as dict:", configs, "| Type:", type(configs))
    for key, val in configs.items():
        print(f"    --conf {key}={val}")

build_spark_config("ETL_Orders", executor_memory="8g", cores=4, dynamic_alloc=True)

# ------------------------------------------------------------------------------
# C. Combining Arguments in Correct Syntax Order (CRITICAL INTERVIEW ORDER):
# 1. Standard Positional Parameters
# 2. *args
# 3. Keyword-Only / Default Parameters
# 4. **kwargs
# ------------------------------------------------------------------------------
def master_pipeline_runner(pipeline_id, *stages, retry_count=3, **env_vars):
    print(f"Pipeline: {pipeline_id} | Retry Limit: {retry_count}")
    print(f"Stages to execute: {stages}")
    print(f"Environment parameters: {env_vars}")

master_pipeline_runner("PL_SALES", "Extract", "Transform", "Load", retry_count=5, ENV="PROD", CLUSTER="K8S")

# D. Argument Unpacking with * and **:
# Passing lists/tuples into functions using `*` (unpacks sequence into positional arguments),
# or dictionaries using `**` (unpacks key-values into keyword arguments):
coords = (12.9716, 77.5946)
def set_coordinates(lat, lon):
    return f"Latitude: {lat}, Longitude: {lon}"

print("Unpacking tuple with *:", set_coordinates(*coords))

db_settings = {"host": "db.corp.net", "port": 3306, "database": "sales_dw"}
print("Unpacking dict with **:", create_db_connection(**db_settings))


# ==============================================================================
# 5. KEYWORD-ONLY & POSITIONAL-ONLY PARAMETERS (Python 3.8+)
# ==============================================================================
# Python allows enforcing whether arguments MUST be passed by position or by keyword:
# - `/` : Parameters BEFORE `/` are POSITIONAL-ONLY.
# - `*` : Parameters AFTER `*` are KEYWORD-ONLY.

print("\n--- 5. POSITIONAL-ONLY & KEYWORD-ONLY ENFORCEMENT ---")

def secure_query(engine, query, /, *, timeout=30, isolation="READ_COMMITTED"):
    # engine and query MUST be positional!
    # timeout and isolation MUST be keyword!
    return f"Running query on {engine}: '{query}' (timeout={timeout}, iso={isolation})"

# Valid call:
result_query = secure_query("Postgres", "SELECT * FROM sales", timeout=60)
print(result_query)

# secure_query(engine="Postgres", query="SELECT 1") # ❌ TypeError: positional-only argument passed as keyword
# secure_query("Postgres", "SELECT 1", 60)          # ❌ TypeError: takes 2 positional arguments but 3 were given


# ==============================================================================
# 6. VARIABLE SCOPE & THE LEGB RULE (EXTREME INTERVIEW IMPORTANCE!)
# ==============================================================================
# Scope determines the visibility and lifetime of a variable.
# Python resolves names using the LEGB RULE:
#
# L -> Local      : Names defined inside the current function.
# E -> Enclosing  : Names in enclosing / outer functions (in nested functions / closures).
# G -> Global     : Names defined at the top level of the script/module.
# B -> Built-in   : Pre-defined Python names (len, max, sum, type, print).

print("\n--- 6. SCOPE & THE LEGB RULE ---")
x = "GLOBAL_X"  # Global Scope

def outer_scope():
    x = "ENCLOSING_X"  # Enclosing Scope
    
    def inner_scope():
        x = "LOCAL_X"  # Local Scope
        print("  Inside inner_scope():", x) # Finds Local first!
    
    inner_scope()
    print("  Inside outer_scope():", x)

outer_scope()
print("Top-level global scope:", x)

# ------------------------------------------------------------------------------
# Modifying Global and Nonlocal Variables: `global` and `nonlocal` Keywords
# ------------------------------------------------------------------------------
counter = 0

def increment_global():
    global counter  # Tells Python to bind to the module-level global variable!
    counter += 1

increment_global()
increment_global()
print("Global counter after increment_global():", counter) # 2

def outer_accumulator():
    batch_total = 0
    def add_records(n):
        nonlocal batch_total  # Binds to the nearest ENCLOSING function's variable!
        batch_total += n
        return batch_total
    return add_records

acc = outer_accumulator()
print("Accumulator call 1 (nonlocal):", acc(50))  # 50
print("Accumulator call 2 (nonlocal):", acc(100)) # 150


# ==============================================================================
# 7. PASS-BY-OBJECT-REFERENCE (CALL-BY-SHARING)
# ==============================================================================
# A core Python concept frequently quizzed in technical screens:
# "Is Python Pass-by-Value or Pass-by-Reference?"
#
# ANSWER: Python is PASS-BY-OBJECT-REFERENCE (Call-by-Sharing).
# - Variables are references to objects in memory.
# - When an argument is passed to a function, the function receives a COPY OF THE REFERENCE.
#
# Consequences:
# 1. If the object is IMMUTABLE (int, float, str, tuple):
#    Rebinding inside the function does NOT affect the caller's variable!
# 2. If the object is MUTABLE (list, dict, set):
#    Modifying the object IN-PLACE (e.g. .append(), []=) MODIFIES THE CALLER'S OBJECT!
#    Reassigning the variable (`arg = [1, 2]`) rebinds the local pointer and does NOT affect the caller.

print("\n--- 7. PASS-BY-OBJECT-REFERENCE DEMO ---")

def test_immutable(num):
    num += 10
    print("  Inside test_immutable:", num)

val = 5
test_immutable(val)
print("Outside test_immutable (unchanged):", val) # 5

def test_mutable(records_list):
    records_list.append("NEW_RECORD") # In-place modification!
    print("  Inside test_mutable:", records_list)

raw_records = ["REC_1", "REC_2"]
test_mutable(raw_records)
print("Outside test_mutable (MUTATED!):", raw_records) # ['REC_1', 'REC_2', 'NEW_RECORD']


# ==============================================================================
# 8. ANONYMOUS FUNCTIONS: LAMBDA EXPRESSIONS
# ==============================================================================
# A small, single-expression anonymous function defined without the `def` keyword.
#
# Syntax:
#   lambda arguments: expression
#
# Rules:
# - Can have any number of arguments, but ONLY ONE expression.
# - Automatically returns the evaluated expression (no `return` keyword allowed!).
# - Widely used as temporary callback functions in `sorted()`, `map()`, `filter()`,
#   Pandas `.apply(lambda x: ...)`, and PySpark RDDs.

print("\n--- 8. LAMBDA EXPRESSIONS ---")

# A. Basic Lambda:
square = lambda x: x ** 2
print("Lambda square(5):", square(5)) # 25

# B. Multi-argument Lambda:
multiply = lambda a, b: a * b
print("Lambda multiply(4, 5):", multiply(4, 5)) # 20

# C. Sorting Complex Data Structures with Lambda Key:
# Sort a list of customer order records by transaction amount:
transactions = [
    {"txn_id": "T1", "amount": 450.0, "status": "COMPLETED"},
    {"txn_id": "T2", "amount": 120.5, "status": "PENDING"},
    {"txn_id": "T3", "amount": 890.0, "status": "COMPLETED"},
    {"txn_id": "T4", "amount": 230.0, "status": "FAILED"}
]

# Sort by amount ascending:
transactions.sort(key=lambda t: t["amount"])
print("Transactions sorted by amount:")
for t in transactions:
    print(f"  {t['txn_id']} -> ${t['amount']}")


# ==============================================================================
# 9. HIGHER-ORDER FUNCTIONAL TOOLS: map(), filter(), reduce()
# ==============================================================================
# A Higher-Order Function is a function that takes another function as an argument
# or returns a function.

print("\n--- 9. HIGHER-ORDER FUNCTIONS ---")

# ------------------------------------------------------------------------------
# A. map(function, iterable):
# Applies the function to every item in the iterable. Returns a lazy iterator.
# ------------------------------------------------------------------------------
raw_temperatures_c = [0, 20, 37, 100]
# Convert Celsius to Fahrenheit: (C * 9/5) + 32
temp_f = list(map(lambda c: (c * 9/5) + 32, raw_temperatures_c))
print("map() Celsius to Fahrenheit:", temp_f) # [32.0, 68.0, 98.6, 212.0]

# ------------------------------------------------------------------------------
# B. filter(predicate_function, iterable):
# Filters elements, keeping only those for which the function returns True.
# ------------------------------------------------------------------------------
salaries = [45000, 85000, 120000, 60000, 150000, 95000]
high_salaries = list(filter(lambda s: s >= 90000, salaries))
print("filter() salaries >= 90k:", high_salaries) # [120000, 150000, 95000]

# ------------------------------------------------------------------------------
# C. reduce(function, iterable):
# Repeatedly applies a function of two arguments to aggregate elements into a single value.
# Located in the `functools` module!
# ------------------------------------------------------------------------------
from functools import reduce
numbers = [1, 2, 3, 4, 5]
# Running product: ((((1*2)*3)*4)*5) = 120
product = reduce(lambda acc, item: acc * item, numbers)
print("reduce() cumulative product:", product) # 120


# ==============================================================================
# 10. RECURSION (FUNCTIONS THAT CALL THEMSELVES)
# ==============================================================================
# A recursive function solves a problem by breaking it down into smaller sub-problems.
# Two ESSENTIAL Components:
# 1. Base Case: The condition that terminates recursion (prevents infinite loop!).
# 2. Recursive Step: The function calling itself with a modified argument.

print("\n--- 10. RECURSION ---")

# Factorial using recursion:
def factorial_recursive(n):
    if n <= 1:           # Base Case
        return 1
    return n * factorial_recursive(n - 1) # Recursive Step

print("Factorial 5! recursive:", factorial_recursive(5)) # 120

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (RECURSION & STACK DEPTH):
# ------------------------------------------------------------------------------
# 1. Maximum Recursion Depth:
#    - CPython does NOT optimize tail-call recursion!
#    - Python protects against stack overflows with a recursion limit (default 1000).
#    - Exceeding it raises: `RecursionError: maximum recursion depth exceeded`.
#    - Check/set with: `sys.getrecursionlimit()` and `sys.setrecursionlimit()`.


# ==============================================================================
# 11. DECORATORS & CLOSURES (DATA PIPELINE LOGGING & TIMING)
# ==============================================================================
# A Closure is an inner function that remembers and accesses variables from its
# enclosing scope even after the outer function has finished executing!
#
# A Decorator is a function that takes another function as input, extends/modifies
# its behavior without modifying its source code, and returns the modified function.
# Uses the `@decorator_name` syntax.

print("\n--- 11. CLOSURES & DECORATORS ---")

# Pipeline Execution Timer Decorator:
import time
from functools import wraps

def time_pipeline_step(func):
    @wraps(func) # Preserves original function's name and docstring
    def wrapper(*args, **kwargs):
        start_time = time.time()
        print(f"  [START]: Executing '{func.__name__}'...")
        result = func(*args, **kwargs)
        elapsed = time.time() - start_time
        print(f"  [FINISH]: '{func.__name__}' executed in {elapsed:.4f} seconds.")
        return result
    return wrapper

# Applying the decorator:
@time_pipeline_step
def load_dim_customers(row_count):
    """Simulates loading customer dimension records."""
    time.sleep(0.05) # Simulated latency
    return f"Loaded {row_count:,} records successfully."

status = load_dim_customers(50000)
print("Function Result:", status)


# ==============================================================================
# 12. GENERATOR FUNCTIONS: yield vs. return (BIG DATA STREAMING CORE!)
# ==============================================================================
# A Generator Function uses the `yield` keyword instead of `return`.
# When called, it does NOT execute immediately; it returns a Generator Object.
#
# WHY GENERATORS ARE REVOLUTIONARY FOR DATA ENGINEERS:
# - Normal functions load ALL records into memory at once (can cause Out-Of-Memory OOM errors!).
# - Generators yield ONE record at a time on-demand (lazy evaluation, O(1) memory footprint!).
# - Essential for streaming multi-gigabyte log files and database cursors.

print("\n--- 12. GENERATORS & LAZY EVALUATION (yield) ---")

def stream_csv_records(limit):
    for row_id in range(1, limit + 1):
        # yield pauses function execution and sends the value to the caller,
        # resuming from the exact same state on the next iteration!
        yield f"Row_Payload_{row_id}"

# Create generator object (0 memory allocated for all rows!):
stream = stream_csv_records(5)
print("Generator Object:", stream, "| Type:", type(stream))

print("Reading stream records one-by-one:")
print(" ", next(stream)) # Fetch 1st
print(" ", next(stream)) # Fetch 2nd
print("Streaming remaining via loop:")
for record in stream:
    print(" ", record)


# ==============================================================================
# 13. FREQUENT INTERVIEW CODING PROBLEMS & PATTERNS (FUNCTIONS)
# ==============================================================================
print("\n--- 13. FREQUENT INTERVIEW PROBLEMS ---")

# ------------------------------------------------------------------------------
# Pattern A: Check if a Number is Prime (Optimized Function)
# Time Complexity: O(sqrt(N))
# ------------------------------------------------------------------------------
def is_prime(n):
    if n <= 1:
        return False
    if n == 2:
        return True
    if n % 2 == 0:
        return False
    for i in range(3, int(n ** 0.5) + 1, 2):
        if n % i == 0:
            return False
    return True

print("is_prime(29):", is_prime(29)) # True
print("is_prime(100):", is_prime(100)) # False

# ------------------------------------------------------------------------------
# Pattern B: Flatten Deeply Nested Lists using Recursion
# ------------------------------------------------------------------------------
def flatten_nested_list(nested):
    flat = []
    for item in nested:
        if isinstance(item, list):
            flat.extend(flatten_nested_list(item))
        else:
            flat.append(item)
    return flat

deep_data = [1, [2, [3, 4], 5], [6, 7], 8]
print("Flattened nested list:", flatten_nested_list(deep_data)) # [1, 2, 3, 4, 5, 6, 7, 8]

# ------------------------------------------------------------------------------
# Pattern C: Fibonacci Sequence with Memoization (Dynamic Programming)
# Eliminates exponential O(2^N) recursion into linear O(N)!
# ------------------------------------------------------------------------------
def fib_memo(n, memo={}):
    if n in memo:
        return memo[n]
    if n <= 0:
        return 0
    if n == 1:
        return 1
    memo[n] = fib_memo(n - 1, memo) + fib_memo(n - 2, memo)
    return memo[n]

print("Fibonacci(10) with memoization:", fib_memo(10)) # 55


# ==============================================================================
# 💡 FUNCTIONS INTERVIEW SUMMARY CHEAT SHEET
# ==============================================================================
# 1. Implicit Return: Functions without an explicit `return` evaluate to `None`.
# 2. Multi-Return: `return a, b` automatically packs into and returns a `tuple`.
# 3. Mutable Default Arguments: Never use `def f(x=[])`. Use `def f(x=None)` instead!
# 4. Argument Syntax Order: Positional -> *args -> Keyword/Defaults -> **kwargs.
# 5. Scope Resolution: LEGB Rule (Local -> Enclosing -> Global -> Built-in).
# 6. Call Mechanism: Pass-by-object-reference (mutable in-place mutations affect caller).
# 7. Positional / Keyword Only: `/` enforces positional-only; `*` enforces keyword-only.
# 8. Generators (`yield`): Lazy evaluation streaming one record at a time with O(1) memory.
# 9. Decorators: Wrap and enhance function execution without altering underlying code.
