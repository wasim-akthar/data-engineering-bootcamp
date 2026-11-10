# ==============================================================================
# CLASS NOTES: PYTHON LISTS (DEFINITIVE, IN-DEPTH REFERENCE GUIDE)
# Date: 10-11-2026
# ==============================================================================

# A List in Python is an ORDERED, MUTABLE (changeable), and HETEROGENEOUS
# collection of elements enclosed in square brackets `[ ]`.
#
# In Data Engineering, lists form the backbone of in-memory data processing:
# collecting database query rows, holding batch chunks, buffering records
# before bulk-loading into databases/lakes, and building data transformation
# pipelines before passing data to Pandas DataFrames or PySpark RDDs.


# ==============================================================================
# 1. LIST CREATION & PROPERTIES
# ==============================================================================
# Lists can be created using square brackets `[]` or the `list()` constructor.

# A. Empty Lists:
empty_list_1 = []
empty_list_2 = list()

# B. Homogeneous Lists:
numbers = [10, 20, 30, 40, 50]
names = ["Wasim", "Arun", "Priya"]

# C. Heterogeneous Lists (mixed data types):
# Python lists can hold ANY combination of data types simultaneously:
mixed = [101, "Data Engineer", True, 95.5, None, [1, 2, 3]]

# D. Creating Lists using list() constructor:
from_string = list("PYTHON")                # ['P', 'Y', 'T', 'H', 'O', 'N']
from_tuple = list((1, 2, 3))                # [1, 2, 3]
from_range = list(range(1, 6))              # [1, 2, 3, 4, 5]

# E. Nested Lists (Matrices / Multi-Dimensional Data):
matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

print("--- 1. LIST CREATION & CHARACTERISTICS ---")
print("Mixed list:", mixed)
print("From string:", from_string)
print("Matrix row 1:", matrix[0])

# ------------------------------------------------------------------------------
# 💡 KEY PROPERTIES OF PYTHON LISTS:
# ------------------------------------------------------------------------------
# 1. Ordered: Elements maintain their exact insertion order.
# 2. Mutable: Elements can be added, updated, replaced, or removed in-place.
# 3. Dynamic Resizing: Python lists automatically grow and shrink in memory as needed.
# 4. Allows Duplicates: Multiple identical elements are permitted: `[1, 1, 2, 2]`.
# 5. Over-allocation (Internal mechanics): CPython dynamically resizes lists with
#    geometric over-allocation (e.g., 0, 4, 8, 16, 25, 35...) to achieve amortized
#    O(1) append time complexity.


# ==============================================================================
# 2. INDEXING & ACCESSING ELEMENTS
# ==============================================================================
# Lists support 0-based indexing from the left and -1-based indexing from the right.
#
# List:         ["Kafka", "Spark", "Airflow", "Snowflake", "Databricks"]
# Positive:        0         1         2           3            4
# Negative:       -5        -4        -3          -2           -1

tools = ["Kafka", "Spark", "Airflow", "Snowflake", "Databricks"]

print("\n--- 2. INDEXING ---")
print("First element (tools[0]):", tools[0])           # 'Kafka'
print("Last element (tools[-1]):", tools[-1])         # 'Databricks'
print("Third element (tools[2]):", tools[2])           # 'Airflow'
print("Total elements len(tools):", len(tools))        # 5

# Nested indexing:
nested_demo = [10, [20, 30, [40, 50]], 60]
print("Deep nested access (nested_demo[1][2][0]):", nested_demo[1][2][0]) # 40

# Accessing an index outside range raises IndexError:
# print(tools[10]) # ❌ IndexError: list index out of range


# ==============================================================================
# 3. LIST SLICING (SUB-LIST EXTRACTION)
# ==============================================================================
# Slicing syntax: list[start : stop : step]
# - start: inclusive (default 0)
# - stop: exclusive (default len(list))
# - step: stride/direction (default 1)
# - Slicing NEVER raises IndexError on out-of-range indices!

data = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90]

print("\n--- 3. LIST SLICING ---")
print("data[2:6]    (Indices 2 to 5):", data[2:6])      # [20, 30, 40, 50]
print("data[:4]     (First 4 items):", data[:4])        # [0, 10, 20, 30]
print("data[6:]     (From index 6 to end):", data[6:])  # [60, 70, 80, 90]
print("data[::2]    (Every 2nd item):", data[::2])      # [0, 20, 40, 60, 80]
print("data[::-1]   (REVERSE LIST):", data[::-1])       # [90, 80, 70, 60, 50, 40, 30, 20, 10, 0]
print("data[-4:]    (Last 4 items):", data[-4:])        # [60, 70, 80, 90]

# Slicing creates a NEW SHALLOW COPY of the list:
data_copy = data[:]
print("Is data_copy identical value? (data_copy == data):", data_copy == data)   # True
print("Is data_copy same object? (data_copy is data):", data_copy is data)       # False


# ==============================================================================
# 4. LIST MUTABILITY: MODIFYING IN-PLACE
# ==============================================================================
# Unlike strings and tuples which are immutable, lists CAN be altered in-place!
# Modifying an element does NOT change the list's memory address (`id`).

languages = ["Python", "Java", "C++"]
print("\n--- 4. MUTABILITY DEMONSTRATION ---")
print("Before:", languages, "| id:", id(languages))

# A. Single item assignment:
languages[1] = "SQL"
print("After languages[1] = 'SQL':", languages, "| id:", id(languages)) # id is the SAME!

# B. Slice assignment (modify multiple items at once):
languages[1:3] = ["PySpark", "Scala"]
print("After slice replacement:", languages) # ['Python', 'PySpark', 'Scala']

# C. Expanding / inserting via slice assignment:
languages[1:1] = ["PostgreSQL"]
print("Inserted via slice [1:1]:", languages) # ['Python', 'PostgreSQL', 'PySpark', 'Scala']

# D. Deleting via slice assignment:
languages[1:3] = []
print("Deleted via empty slice []:", languages) # ['Python', 'Scala']


# ==============================================================================
# 5. ADDING ELEMENTS TO A LIST (append vs. extend vs. insert)
# ==============================================================================
# CRITICAL INTERVIEW TOPIC: Know the precise difference between these 3 methods!

print("\n--- 5. ADDING ELEMENTS ---")

# ------------------------------------------------------------------------------
# A. append(element) -> Adds ONE single item to the END of the list.
# Time Complexity: Amortized O(1)
# ------------------------------------------------------------------------------
arr1 = [1, 2, 3]
arr1.append(4)
print("append(4):", arr1)            # [1, 2, 3, 4]

# Warning: Appending a list appends it as a SINGLE nested sub-list:
arr1.append([5, 6])
print("append([5, 6]):", arr1)        # [1, 2, 3, 4, [5, 6]]

# ------------------------------------------------------------------------------
# B. extend(iterable) -> Unpacks and appends ALL items from iterable to the end.
# Time Complexity: O(K) where K is length of the incoming iterable
# ------------------------------------------------------------------------------
arr2 = [1, 2, 3]
arr2.extend([4, 5, 6])
print("\nextend([4, 5, 6]):", arr2)  # [1, 2, 3, 4, 5, 6]

# extend can take ANY iterable (strings, tuples, sets, ranges):
arr2.extend("AB")
print("extend('AB'):", arr2)          # [1, 2, 3, 4, 5, 6, 'A', 'B']

# ------------------------------------------------------------------------------
# C. insert(index, element) -> Inserts element at a SPECIFIC index.
# Time Complexity: O(N) because subsequent elements must shift right in memory!
# ------------------------------------------------------------------------------
arr3 = ["Apple", "Cherry"]
arr3.insert(1, "Banana")              # Insert "Banana" at index 1
print("\ninsert(1, 'Banana'):", arr3) # ['Apple', 'Banana', 'Cherry']


# ==============================================================================
# 6. REMOVING ELEMENTS FROM A LIST (remove vs. pop vs. del vs. clear)
# ==============================================================================
# CRITICAL INTERVIEW TOPIC: Know which method returns a value and which raises errors!

print("\n--- 6. REMOVING ELEMENTS ---")

# ------------------------------------------------------------------------------
# A. remove(value) -> Searches and removes the FIRST occurrence of the value.
# - Takes a VALUE as argument (NOT an index).
# - Returns: None.
# - Raises: ValueError if value is not present!
# Time Complexity: O(N) search + shift
# ------------------------------------------------------------------------------
fruits = ["apple", "banana", "cherry", "banana"]
fruits.remove("banana")  # Removes only the first "banana"
print("After remove('banana'):", fruits) # ['apple', 'cherry', 'banana']
# fruits.remove("mango") # ❌ ValueError: list.remove(x): x not in list

# ------------------------------------------------------------------------------
# B. pop(index) -> Removes and RETURNS the element at specified index.
# - Default index is -1 (removes and returns the LAST element).
# - Raises: IndexError if list is empty or index is out of bounds!
# Time Complexity: pop() from end is O(1); pop(0) or pop(i) is O(N) due to left shifts!
# ------------------------------------------------------------------------------
pipeline_tasks = ["Extract", "Transform", "Load", "Notify"]
last_task = pipeline_tasks.pop()       # Default index=-1
print(f"Popped last item: '{last_task}' | Remaining: {pipeline_tasks}")

first_task = pipeline_tasks.pop(0)     # Pops from start
print(f"Popped index 0: '{first_task}' | Remaining: {pipeline_tasks}")

# ------------------------------------------------------------------------------
# C. del statement -> Python statement to delete by index, slice, or entire variable.
# - Does NOT return anything.
# ------------------------------------------------------------------------------
scores = [10, 20, 30, 40, 50, 60]
del scores[0]                          # Deletes item at index 0
print("After del scores[0]:", scores)  # [20, 30, 40, 50, 60]

del scores[1:3]                        # Deletes slice [30, 40]
print("After del scores[1:3]:", scores)# [20, 50, 60]

# ------------------------------------------------------------------------------
# D. clear() -> Removes ALL elements, leaving the list empty `[]`.
# - Does NOT delete the variable; just empties it in-place.
# - Time Complexity: O(N)
# ------------------------------------------------------------------------------
temp_buffer = [1, 2, 3, 4]
temp_buffer.clear()
print("After clear():", temp_buffer)   # []


# ==============================================================================
# 7. SEARCHING, COUNTING & INSPECTION METHODS
# ==============================================================================
print("\n--- 7. SEARCHING & COUNTING ---")
skills = ["SQL", "Python", "Spark", "Python", "Airflow", "Python"]

# A. count(value) -> Returns number of occurrences:
print("count('Python'):", skills.count("Python"))       # 3
print("count('Hadoop'):", skills.count("Hadoop"))       # 0 (Safe: returns 0 if absent)

# B. index(value, [start, end]) -> Returns first index of value:
print("index('Spark'):", skills.index("Spark"))         # 2
print("index('Python', 2):", skills.index("Python", 2)) # 3 (search starts from index 2)
# skills.index("Hadoop") # ❌ Raises ValueError: 'Hadoop' is not in list

# Safe search pattern using membership operator `in`:
target = "Kafka"
if target in skills:
    idx = skills.index(target)
else:
    print(f"'{target}' not found in skills list.")


# ==============================================================================
# 8. SORTING & REVERSING: sort() vs. sorted() AND reverse() vs. reversed()
# ==============================================================================
# TOP TIER INTERVIEW QUESTION:
# Difference between in-place methods (`.sort()`, `.reverse()`) and
# built-in functions (`sorted()`, `reversed()`).

print("\n--- 8. SORTING & REVERSING ---")

# ------------------------------------------------------------------------------
# A. list.sort(key=None, reverse=False) -> In-place sorting!
# - Modifies the original list directly.
# - Returns: None.
# - Algorithm: Timsort (Hybrid of Merge Sort & Insertion Sort, O(N log N) time).
# ------------------------------------------------------------------------------
nums_1 = [42, 12, 88, 3, 27]
nums_1.sort()
print("nums_1.sort() [Ascending]:", nums_1)           # [3, 12, 27, 42, 88]

nums_1.sort(reverse=True)
print("nums_1.sort(reverse=True) [Descending]:", nums_1) # [88, 42, 27, 12, 3]

# Custom sorting with `key` function (e.g., sort strings by length):
cities = ["Bengaluru", "Delhi", "Chennai", "Pune", "Mumbai"]
cities.sort(key=len)
print("Sorted by length (key=len):", cities)          # ['Pune', 'Delhi', 'Mumbai', 'Chennai', 'Bengaluru']

# ------------------------------------------------------------------------------
# B. sorted(iterable, key=None, reverse=False) -> Built-in function!
# - Does NOT modify original list.
# - Returns: A BRAND NEW sorted list.
# - Can take ANY iterable (tuples, dictionaries, strings, sets).
# ------------------------------------------------------------------------------
original_nums = [50, 10, 40, 20]
new_sorted = sorted(original_nums)
print("original_nums unchanged:", original_nums)      # [50, 10, 40, 20]
print("sorted(original_nums):", new_sorted)           # [10, 20, 40, 50]

# ------------------------------------------------------------------------------
# C. list.reverse() -> In-place reversal!
# - Modifies original list. Returns None.
# ------------------------------------------------------------------------------
letters = ["a", "b", "c", "d"]
letters.reverse()
print("letters.reverse():", letters)                  # ['d', 'c', 'b', 'a']

# ------------------------------------------------------------------------------
# D. reversed(sequence) -> Returns a reverse iterator!
# - Does not modify original. Use list(reversed(...)) to get a list.
# ------------------------------------------------------------------------------
nums_seq = [1, 2, 3, 4]
print("list(reversed(nums_seq)):", list(reversed(nums_seq))) # [4, 3, 2, 1]


# ==============================================================================
# 9. COPYING LISTS: SHALLOW COPY vs. DEEP COPY (EXTREME INTERVIEW IMPORTANCE!)
# ==============================================================================
# Assigning a list with `=` does NOT copy the list; it merely creates a second
# reference pointing to the exact same memory address!

print("\n--- 9. SHALLOW COPY vs. DEEP COPY ---")

# A. Reference Assignment (Aliasing - NOT a copy):
list_a = [1, 2, 3]
list_b = list_a  # Both variables point to the same list!
list_b.append(4)
print("list_a after list_b.append(4):", list_a)        # [1, 2, 3, 4] (Both changed!)
print("list_a is list_b:", list_a is list_b)          # True (Same memory address)

# B. Shallow Copy: `list.copy()` or `list[:]` or `list(orig)`
# Creates a new outer list, but any nested objects inside STILL share references!
nested_orig = [[1, 2], [3, 4]]
shallow_cp = nested_orig.copy()

shallow_cp.append([5, 6])             # Outer modification
shallow_cp[0][0] = 999                # Nested modification!

print("\nShallow copy demonstration:")
print("nested_orig:", nested_orig)    # [[999, 2], [3, 4]]  <- Nested element changed in BOTH!
print("shallow_cp:", shallow_cp)      # [[999, 2], [3, 4], [5, 6]]

# C. Deep Copy: `copy.deepcopy()`
# Recursively clones the outer list AND all nested objects inside it completely.
import copy
nested_orig_2 = [[1, 2], [3, 4]]
deep_cp = copy.deepcopy(nested_orig_2)

deep_cp[0][0] = 8888
print("\nDeep copy demonstration:")
print("nested_orig_2 (unaffected):", nested_orig_2)   # [[1, 2], [3, 4]] (Completely protected!)
print("deep_cp:", deep_cp)                            # [[8888, 2], [3, 4]]


# ==============================================================================
# 10. LIST COMPREHENSIONS (PYTHONIC, FAST, ELEGANT)
# ==============================================================================
# A concise syntax to generate a new list from an existing iterable.
# Faster than standard `for` loops because loop bytecode execution occurs at C-speed.
#
# Syntax:
#   [expression for item in iterable if condition]

print("\n--- 10. LIST COMPREHENSIONS ---")

# A. Basic transformation:
nums = [1, 2, 3, 4, 5]
squares = [x ** 2 for x in nums]
print("Squares:", squares)                            # [1, 4, 9, 16, 25]

# B. Filtering with `if`:
even_squares = [x ** 2 for x in nums if x % 2 == 0]
print("Even squares:", even_squares)                  # [4, 16]

# C. Conditional transformation with `if - else` (Ternary inside comprehension):
# Syntax: [val_if_true if cond else val_if_false for item in iterable]
labels = ["Even" if x % 2 == 0 else "Odd" for x in nums]
print("Even/Odd labels:", labels)                     # ['Odd', 'Even', 'Odd', 'Even', 'Odd']

# D. Flattening a 2D Matrix (Nested Comprehension):
grid = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
flattened = [val for row in grid for val in row]
print("Flattened matrix:", flattened)                 # [1, 2, 3, 4, 5, 6, 7, 8, 9]

# E. Data Cleaning with Comprehensions:
raw_emails = ["  WASIM@GMAIL.COM ", "ARUN@YAHOO.COM\n", "  priya@HOTMAIL.COM  "]
clean_emails = [email.strip().lower() for email in raw_emails]
print("Cleaned emails:", clean_emails)


# ==============================================================================
# 11. LIST OPERATORS & USEFUL BUILT-IN FUNCTIONS
# ==============================================================================
print("\n--- 11. OPERATORS & BUILT-IN FUNCTIONS ---")

list_x = [1, 2, 3]
list_y = [4, 5, 6]

# A. Concatenation (+):
print("Concatenation (+):", list_x + list_y)          # [1, 2, 3, 4, 5, 6]

# B. Repetition (*):
print("Repetition (*):", [0] * 5)                     # [0, 0, 0, 0, 0]

# Warning with Repetition on Nested Lists:
# [[0] * 3] * 3 creates 3 references to the EXACT SAME sublist!
# Correct way to initialize an NxM matrix:
matrix_correct = [[0 for _ in range(3)] for _ in range(3)]
print("3x3 Zero Matrix:", matrix_correct)

# C. Membership Operators (in / not in):
print("2 in list_x:", 2 in list_x)                    # True
print("10 not in list_x:", 10 not in list_x)          # True

# D. Aggregate Built-In Functions:
vals = [14, 28, 5, 92, 47]
print("len():", len(vals))                            # 5
print("min():", min(vals))                            # 5
print("max():", max(vals))                            # 92
print("sum():", sum(vals))                            # 186
print("Average:", sum(vals) / len(vals))              # 37.2

# E. all() and any():
flags = [True, True, False]
print("any() (True if at least one True):", any(flags)) # True
print("all() (True only if all are True):", all(flags)) # False


# ==============================================================================
# 12. ITERATING OVER LISTS (IDIOMATIC PATTERNS)
# ==============================================================================
print("\n--- 12. ITERATION PATTERNS ---")

fruits_list = ["Apple", "Banana", "Mango"]

# Pattern 1: Direct item iteration (preferred):
print("1. Direct iteration:")
for fruit in fruits_list:
    print("  ", fruit)

# Pattern 2: With index using enumerate() (never use range(len())):
print("2. enumerate() with index:")
for idx, fruit in enumerate(fruits_list, start=1):
    print(f"   Rank {idx}: {fruit}")

# Pattern 3: Parallel iteration using zip():
prices = [120, 40, 80]
print("3. zip() parallel iteration:")
for fruit, price in zip(fruits_list, prices):
    print(f"   {fruit} costs Rs.{price}")


# ==============================================================================
# 13. TIME COMPLEXITY (BIG-O) CHEAT SHEET FOR LIST OPERATIONS
# ==============================================================================
# Operation                 | Big-O Time Complexity | Notes
# ------------------------- | --------------------- | ------------------------------
# Access by Index: arr[i]   | O(1)                  | Direct memory address pointer
# Update by Index: arr[i]=v | O(1)                  | Direct assignment
# Append: arr.append(v)     | Amortized O(1)        | Occasional dynamic resize O(N)
# Pop from end: arr.pop()   | O(1)                  | No element shifting needed
# Insert: arr.insert(i, v)  | O(N)                  | Must shift subsequent items
# Delete: del arr[i]        | O(N)                  | Must shift subsequent items
# Pop from front: arr.pop(0)| O(N)                  | Must shift all N items left!
# Search: v in arr          | O(N)                  | Linear scan item by item
# Remove: arr.remove(v)     | O(N)                  | Linear search + left shift
# Slicing: arr[a:b]         | O(K)                  | K = slice length (copies memory)
# Sort: arr.sort()          | O(N log N)            | Timsort algorithm
# Min / Max / Sum           | O(N)                  | Must inspect all elements


# ==============================================================================
# 14. FREQUENT INTERVIEW CODING PROBLEMS & PATTERNS (LISTS)
# ==============================================================================
print("\n--- 14. FREQUENT INTERVIEW CODING PROBLEMS ---")

# ------------------------------------------------------------------------------
# Pattern A: Find Second Largest Number in a List (Without sorting!)
# Sorting takes O(N log N). Doing this in a single pass takes O(N) linear time!
# ------------------------------------------------------------------------------
num_array = [20, 45, 89, 89, 12, 67, 34]
first = second = float("-inf")

for n in num_array:
    if n > first:
        second = first
        first = n
    elif n > second and n != first:
        second = n

print(f"List: {num_array}")
print(f"Largest: {first} | Second Largest: {second}")

# ------------------------------------------------------------------------------
# Pattern B: Remove Duplicates while Preserving Insertion Order
# ------------------------------------------------------------------------------
raw_items = [10, 20, 10, 30, 20, 40, 50, 30]

# Approach 1: Using dict.fromkeys() (Most Pythonic, O(N)):
unique_pres_1 = list(dict.fromkeys(raw_items))
print("Deduplicated (dict.fromkeys):", unique_pres_1)

# Approach 2: Using set as visited tracker (O(N)):
seen = set()
unique_pres_2 = []
for item in raw_items:
    if item not in seen:
        seen.add(item)
        unique_pres_2.append(item)
print("Deduplicated (seen set):", unique_pres_2)

# ------------------------------------------------------------------------------
# Pattern C: Rotate a List to the Right by K Steps
# Input: [1, 2, 3, 4, 5], k = 2 -> Output: [4, 5, 1, 2, 3]
# ------------------------------------------------------------------------------
rotate_arr = [1, 2, 3, 4, 5]
k = 2
k = k % len(rotate_arr)  # Handle k > len(arr)
rotated = rotate_arr[-k:] + rotate_arr[:-k]
print(f"Rotate {rotate_arr} by {k} steps: {rotated}")

# ------------------------------------------------------------------------------
# Pattern D: Move All Zeros to the End (In-Place)
# Input: [0, 1, 0, 3, 12] -> Output: [1, 3, 12, 0, 0]
# ------------------------------------------------------------------------------
zero_arr = [0, 1, 0, 3, 12]
insert_pos = 0

for i in range(len(zero_arr)):
    if zero_arr[i] != 0:
        zero_arr[insert_pos], zero_arr[i] = zero_arr[i], zero_arr[insert_pos]
        insert_pos += 1

print("Move zeros to end (in-place):", zero_arr)

# ------------------------------------------------------------------------------
# Pattern E: Merge Two Sorted Lists into One Sorted List (Two-Pointer Technique)
# Fundamental concept behind Merge Sort and Data Pipeline Sort-Merge Joins!
# ------------------------------------------------------------------------------
list1 = [1, 3, 5, 7]
list2 = [2, 4, 6, 8, 10]
merged = []
i = j = 0

while i < len(list1) and j < len(list2):
    if list1[i] < list2[j]:
        merged.append(list1[i])
        i += 1
    else:
        merged.append(list2[j])
        j += 1

# Append remaining elements from whichever list is left:
merged.extend(list1[i:])
merged.extend(list2[j:])
print("Merged two sorted lists:", merged)


# ==============================================================================
# 💡 SUMMARY CHEAT SHEET FOR INTERVIEWS & PRODUCTION CODE
# ==============================================================================
# 1. Mutability:
#    - Lists are mutable. `a = b` creates an alias, NOT a copy.
#    - Use `b = a.copy()` for shallow copy, `copy.deepcopy(a)` for nested lists.
# 2. Append vs. Extend:
#    - `.append(x)` adds x as one single object.
#    - `.extend(iterable)` unpacks iterable and appends each element individually.
# 3. Queue Performance Warning:
#    - Using `list.pop(0)` or `list.insert(0, val)` takes O(N) time because all
#      subsequent elements must be shifted in memory.
#    - For fast queues/FIFOs, ALWAYS use `collections.deque` (Double-ended Queue),
#      which provides O(1) appends and pops from BOTH ends!
# 4. Search Efficiency:
#    - `x in list` takes O(N) linear time.
#    - If you are doing thousands of lookup queries, convert the list to a `set`
#      which takes O(1) average lookup time.
# 5. Sorting:
#    - `.sort()` alters the list in-place and returns None (O(N log N)).
#    - `sorted()` leaves original untouched and returns a new list.

