# ==============================================================================
# CLASS NOTES: PYTHON TUPLES (DEFINITIVE, IN-DEPTH REFERENCE GUIDE)
# Date: 12-11-2026
# ==============================================================================

# A Tuple in Python is an ORDERED, IMMUTABLE (unchangeable), and HETEROGENEOUS
# collection of elements enclosed in parentheses `( )`.
#
# In Data Engineering, tuples play a vital role:
# 1. Database Cursor Fetch Results: DB-API drivers (MySQL Connector, psycopg2)
#    return table rows as tuples (e.g., `(101, 'Wasim', 95000.0)`) to guarantee
#    data integrity so records cannot be mutated downstream.
# 2. Immutable Schemas & Coordinates: Safe storage for fixed dimensions, geo-coordinates,
#    RGB codes, network IP/Port pairs `('127.0.0.1', 8080)`.
# 3. Dictionary Keys & Set Elements: Because tuples are immutable and hashable,
#    they can serve as composite primary keys in dictionaries and unique records in sets.


# ==============================================================================
# 1. TUPLE CREATION & SYNTAX NUANCES
# ==============================================================================
# Parentheses `()` are optional in many contexts (tuple packing), but commas `,`
# are strictly required!

# A. Empty Tuple:
empty_tup_1 = ()
empty_tup_2 = tuple()

# B. Standard Homogeneous & Heterogeneous Tuples:
numbers = (10, 20, 30, 40, 50)
record = (101, "Wasim", "Data Engineer", 95000.50, True)

# C. THE SINGLE-ELEMENT TUPLE TRAP (EXTREME INTERVIEW IMPORTANCE!):
# Writing `(5)` evaluates to an INTEGER, NOT a tuple!
# A trailing comma `,` is MANDATORY to create a single-element tuple:
not_a_tuple = (5)            # Type: int
single_tuple = (5,)          # Type: tuple

print("--- 1. TUPLE CREATION ---")
print("not_a_tuple (5):", type(not_a_tuple))     # <class 'int'>
print("single_tuple (5,):", type(single_tuple))  # <class 'tuple'>

# D. Tuple Packing (Parentheses are optional!):
packed_coords = 12.9716, 77.5946, 920.0
print("Packed tuple without parentheses:", packed_coords, "| Type:", type(packed_coords))

# E. Converting Iterables to Tuples with tuple():
from_list = tuple([1, 2, 3])                     # (1, 2, 3)
from_str = tuple("SPARK")                        # ('S', 'P', 'A', 'R', 'K')
from_range = tuple(range(5))                     # (0, 1, 2, 3, 4)


# ==============================================================================
# 2. INDEXING & SLICING
# ==============================================================================
# Just like lists and strings, tuples support 0-based positive indexing,
# -1-based negative indexing, and slicing `tuple[start:stop:step]`.

pipeline = ("Extract", "Validate", "Transform", "Load", "Notify")

print("\n--- 2. INDEXING & SLICING ---")
print("First stage (pipeline[0]):", pipeline[0])         # 'Extract'
print("Last stage (pipeline[-1]):", pipeline[-1])       # 'Notify'
print("Slice [1:4]:", pipeline[1:4])                     # ('Validate', 'Transform', 'Load')
print("Reverse slice [::-1]:", pipeline[::-1])           # ('Notify', 'Load', 'Transform', 'Validate', 'Extract')

# Nested Tuple Indexing:
nested_tup = (10, ("MySQL", "Postgres"), (100, 200, (300, 400)))
print("Deep nested access (nested_tup[2][2][1]):", nested_tup[2][2][1]) # 400


# ==============================================================================
# 3. TUPLE IMMUTABILITY & THE "MUTABLE OBJECT INSIDE TUPLE" TRAP
# ==============================================================================
# A tuple cannot be altered after creation. You cannot append, insert, remove,
# or change items.

immutable_tup = (1, 2, 3)
# immutable_tup[0] = 99  # ❌ TypeError: 'tuple' object does not support item assignment
# del immutable_tup[0]   # ❌ TypeError: 'tuple' object doesn't support item deletion

# ------------------------------------------------------------------------------
# 💡 THE FAMOUS INTERVIEW TRICK: A Mutable Object Inside an Immutable Tuple!
# ------------------------------------------------------------------------------
# If a tuple contains a mutable object (like a list), the list's reference is fixed,
# but the contents of that list CAN be modified in-place!

tup_with_list = (10, 20, ["Kafka", "Spark"])
print("\n--- 3. MUTABLE OBJECT INSIDE TUPLE ---")
print("Before modifying list inside tuple:", tup_with_list)

# Modifying the inner list in-place:
tup_with_list[2].append("Airflow")
tup_with_list[2][0] = "Flink"
print("After modifying list inside tuple:", tup_with_list)
# Result: (10, 20, ['Flink', 'Spark', 'Airflow']) -> Valid!

# Why? The tuple only stores the memory reference pointer to the list.
# The pointer never changed; only the mutable list object itself was modified!


# ==============================================================================
# 4. TUPLE UNPACKING (DESTRUCTURING) & EXTENDED UNPACKING
# ==============================================================================
# Unpacking extracts tuple items directly into independent variables.
# The number of variables on the left MUST match the number of elements on the right.

print("\n--- 4. TUPLE UNPACKING ---")

# A. Standard Unpacking:
point = (10, 20, 30)
x, y, z = point
print(f"Standard unpacking: x={x}, y={y}, z={z}")

# B. Classic Swapping Trick (Uses tuple packing & unpacking under the hood!):
a, b = 100, 200
a, b = b, a   # RHS (b, a) packs into a tuple (200, 100); LHS unpacks into a and b!
print(f"Swapped variables: a={a}, b={b}")

# C. Extended Unpacking with Asterisk / Star Operator `*` (Python 3+):
# Collects multiple remaining elements into a list:
log_entry = ("2026-11-12", "ERROR", "DatabaseConnectionTimeout", "Host=10.0.0.1", "Port=3306", "Retry=3")
log_date, log_level, *log_details = log_entry
print(f"Date: {log_date} | Level: {log_level}")
print(f"Collected Details (*log_details): {log_details}") # List of remaining items

# First, middle, and last extraction:
first_val, *middle_vals, last_val = (1, 2, 3, 4, 5, 6)
print(f"First: {first_val} | Middle list: {middle_vals} | Last: {last_val}")


# ==============================================================================
# 5. TUPLE METHODS: count() AND index()
# ==============================================================================
# Because tuples are immutable, they have ONLY TWO built-in methods!
# No append, extend, insert, pop, remove, sort, or clear.

sample_tup = (10, 20, 30, 20, 40, 20, 50)
print("\n--- 5. TUPLE METHODS ---")

# A. count(value): Number of occurrences
print("count(20):", sample_tup.count(20))       # 3
print("count(99):", sample_tup.count(99))       # 0 (Safe: returns 0 if absent)

# B. index(value, [start, end]): First index of value
print("index(30):", sample_tup.index(30))       # 2
print("index(20, 2):", sample_tup.index(20, 2)) # 3 (Starts searching from index 2)
# sample_tup.index(99) # ❌ Raises ValueError: tuple.index(x): x not in tuple


# ==============================================================================
# 6. TUPLE vs. LIST (THE BIG INTERVIEW SHOWDOWN)
# ==============================================================================
# Why use Tuples over Lists?
# 1. Performance / Speed: Tuples evaluate faster than lists (stored in a single contiguous block).
# 2. Memory Consumption: Tuples consume significantly less RAM than lists!
# 3. Data Integrity ("Write-Once, Read-Many"): Prevents accidental mutation in data pipelines.
# 4. Hashability & Dictionary Keys: Tuples can be dict keys; lists CANNOT.

import sys
list_demo = [1, 2, 3, 4, 5]
tuple_demo = (1, 2, 3, 4, 5)

print("\n--- 6. MEMORY BENCHMARK: LIST vs. TUPLE ---")
print("Size of list (bytes):", sys.getsizeof(list_demo))    # Larger (e.g. 104 bytes due to over-allocation)
print("Size of tuple (bytes):", sys.getsizeof(tuple_demo))  # Smaller (e.g. 80 bytes fixed)

# Tuples as Dictionary Keys:
location_lookup = {
    (12.9716, 77.5946): "Bengaluru HQ",
    (13.0827, 80.2707): "Chennai Office",
    (19.0760, 72.8777): "Mumbai Branch"
}
coords = (12.9716, 77.5946)
print("Dictionary lookup by Tuple key:", location_lookup[coords])

# Attempting to use a list as a dictionary key raises TypeError:
# invalid_dict = {[12.97, 77.59]: "Bengaluru"} # ❌ TypeError: unhashable type: 'list'


# ==============================================================================
# 7. NAMEDTUPLES: collections.namedtuple (DATA ENGINEERING ESSENTIAL!)
# ==============================================================================
# Standard tuples require integer index access `row[1]`, which is error-prone.
# `namedtuple` creates lightweight, immutable, self-documenting record objects
# accessible by field names as well as positional index, with ZERO memory overhead!

from collections import namedtuple

# Define schema:
EmployeeRecord = namedtuple("EmployeeRecord", ["emp_id", "name", "role", "salary"])

# Instantiate records:
emp1 = EmployeeRecord(emp_id=101, name="Wasim", role="Data Engineer", salary=95000)

print("\n--- 7. NAMEDTUPLE ---")
print("Full record:", emp1)
print("Access by attribute name (emp1.role):", emp1.role)
print("Access by index (emp1[1]):", emp1[1])
# emp1.salary = 100000 # ❌ AttributeError: can't set attribute (Still immutable!)


# ==============================================================================
# 8. HOW TO "MODIFY" A TUPLE (WORKAROUNDS)
# ==============================================================================
# When you genuinely need to alter tuple data, convert to list and back:

print("\n--- 8. MODIFYING A TUPLE VIA TYPE CASTING ---")
raw_tup = ("MySQL", "Oracle", "MongoDB")
print("Original tuple:", raw_tup)

# Step 1: Convert to list
temp_list = list(raw_tup)
# Step 2: Modify list
temp_list.append("PostgreSQL")
temp_list[1] = "Snowflake"
# Step 3: Convert back to tuple
modified_tup = tuple(temp_list)
print("Modified tuple:", modified_tup)


# ==============================================================================
# 9. TUPLE OPERATORS & BUILT-INS
# ==============================================================================
print("\n--- 9. OPERATORS & BUILT-INS ---")
t1 = (1, 2, 3)
t2 = (4, 5, 6)

# Concatenation (+) -> Returns brand-new tuple:
print("Concatenation (+):", t1 + t2)          # (1, 2, 3, 4, 5, 6)

# Repetition (*):
print("Repetition (*):", ("NA",) * 3)         # ('NA', 'NA', 'NA')

# Membership (in / not in):
print("2 in t1:", 2 in t1)                    # True

# Aggregate built-ins:
scores = (88, 92, 79, 95, 84)
print("len():", len(scores))                  # 5
print("min():", min(scores))                  # 79
print("max():", max(scores))                  # 95
print("sum():", sum(scores))                  # 438
print("sorted():", sorted(scores))            # [79, 84, 88, 92, 95] (Returns a sorted LIST!)


# ==============================================================================
# 💡 TUPLE INTERVIEW SUMMARY CHEAT SHEET
# ==============================================================================
# 1. Single element tuple: `(5,)` requires a trailing comma. `(5)` is an integer.
# 2. Immutability: Elements cannot be reassigned; but mutable nested objects can be mutated.
# 3. Hashable: Tuples of immutable items are hashable and can serve as dictionary keys.
# 4. Performance: Tuples have smaller memory footprint and faster instantiation than lists.
# 5. Methods: Only `.count()` and `.index()`.
# 6. Database Context: Rows returned by DB cursor queries are tuples to protect immutability.
