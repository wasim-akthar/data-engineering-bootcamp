# ==============================================================================
# CLASS NOTES: PYTHON SETS (DEFINITIVE, IN-DEPTH REFERENCE GUIDE)
# Date: 13-11-2026
# ==============================================================================

# A Set in Python is an UNORDERED, MUTABLE collection of UNIQUE and HASHABLE
# elements enclosed in curly braces `{ }`.
#
# In Data Engineering, Sets are indispensable for:
# 1. High-Performance Deduplication: Removing duplicate customer IDs, transaction
#    hashes, or IP logs in O(N) time without manual nested looping.
# 2. Relational & Mathematical Set Operations: In-memory Venn diagram analytics:
#    Union (merge sources), Intersection (find shared customers/common keys),
#    Difference (detect missing/churned records), and Symmetric Difference.
# 3. Blazing Fast Lookups: Testing `item in my_set` runs in O(1) constant average
#    time due to underlying Hash Tables (compared to O(N) linear time in lists!).


# ==============================================================================
# 1. SET CREATION & SYNTAX TRAPS
# ==============================================================================
# Sets can be created using curly braces `{}` with elements, or the `set()` constructor.

# A. Homogeneous & Heterogeneous Sets:
numbers_set = {10, 20, 30, 40, 50}
mixed_set = {101, "Data Engineer", 95.5, True}

# B. Automatic Deduplication:
raw_ids = {101, 102, 103, 101, 102, 104}
print("--- 1. SET CREATION & DEDUPLICATION ---")
print("raw_ids with duplicates:", raw_ids) # {101, 102, 103, 104} -> Duplicates purged!

# C. THE EMPTY SET TRAP (EXTREME INTERVIEW IMPORTANCE!):
# Writing `{}` creates an EMPTY DICTIONARY, NOT AN EMPTY SET!
# An empty set MUST be created using the `set()` constructor:
empty_dict = {}     # Type: dict
empty_set = set()   # Type: set

print("empty_dict {}:", type(empty_dict))  # <class 'dict'>
print("empty_set set():", type(empty_set)) # <class 'set'>

# D. Creating Sets from Other Collections with set():
from_list = set([1, 2, 2, 3, 4, 4, 5])     # {1, 2, 3, 4, 5}
from_string = set("MISSISSIPPI")           # {'M', 'I', 'S', 'P'}
from_range = set(range(5))                  # {0, 1, 2, 3, 4}
print("From string 'MISSISSIPPI':", from_string)

# E. True and 1 / False and 0 Collision in Sets:
# In Python, `bool` is a subclass of `int`. Since `True == 1` and `hash(True) == hash(1)`,
# a set treats them as DUPLICATES and retains only whichever appears first!
collision_demo = {1, True, 0, False, "Hello"}
print("Collision demo {1, True, 0, False, 'Hello'}:", collision_demo) # {0, 1, 'Hello'}


# ==============================================================================
# 2. KEY PROPERTIES & LIMITATIONS
# ==============================================================================
# 1. Unordered: No guaranteed sequence. Order can shift between Python sessions.
# 2. Unindexed: You CANNOT access elements via index or slicing!
#    `numbers_set[0]` -> ❌ TypeError: 'set' object is not subscriptable
# 3. Elements Must Be Hashable / Immutable:
#    - Allowed: int, float, str, tuple (of immutables), bool, frozenset.
#    - NOT Allowed: list, dict, set (mutable objects cannot be hashed!).
#    `invalid_set = {[1, 2], [3, 4]}` -> ❌ TypeError: unhashable type: 'list'


# ==============================================================================
# 3. ADDING & UPDATING ELEMENTS
# ==============================================================================
# Since sets are mutable, you can add new elements after creation.

print("\n--- 3. ADDING & UPDATING ELEMENTS ---")
data_tools = {"Python", "SQL"}

# A. add(element): Adds a single element to the set.
# If element already exists, nothing happens (no error raised).
data_tools.add("Spark")
data_tools.add("Python") # Duplicate ignored
print("After add('Spark'):", data_tools) # {'SQL', 'Python', 'Spark'}

# B. update(*iterables): Unpacks and adds MULTIPLE items from one or more iterables
# (lists, tuples, strings, or other sets). Equivalent to in-place union `|=`.
data_tools.update(["Airflow", "Kafka"], ("Snowflake", "dbt"))
print("After update():", data_tools)


# ==============================================================================
# 4. REMOVING ELEMENTS: remove vs. discard vs. pop vs. clear
# ==============================================================================
# CRITICAL INTERVIEW TOPIC: Know the precise behavioral difference between
# `.remove()` and `.discard()`!

print("\n--- 4. REMOVING ELEMENTS ---")
cloud_providers = {"AWS", "Azure", "GCP", "Snowflake", "Databricks"}

# ------------------------------------------------------------------------------
# A. remove(element):
# - Removes the element from the set.
# - ⚠️ RAISES KeyError if the element does NOT exist!
# ------------------------------------------------------------------------------
cloud_providers.remove("Snowflake")
print("After remove('Snowflake'):", cloud_providers)
# cloud_providers.remove("Oracle") # ❌ Raises KeyError: 'Oracle'

# ------------------------------------------------------------------------------
# B. discard(element):
# - Removes the element from the set if present.
# - ✅ DOES NOT RAISE AN ERROR if the element does NOT exist! (Production safe!)
# ------------------------------------------------------------------------------
cloud_providers.discard("Oracle") # Safe: does nothing, no error
print("After discard('Oracle') [Safe]:", cloud_providers)

# ------------------------------------------------------------------------------
# C. pop():
# - Removes and RETURNS an ARBITRARY (random) element.
# - Sets are unordered, so you cannot predict which element is popped!
# - ⚠️ RAISES KeyError if set is empty.
# ------------------------------------------------------------------------------
popped_item = cloud_providers.pop()
print(f"Popped arbitrary item: '{popped_item}' | Remaining: {cloud_providers}")

# ------------------------------------------------------------------------------
# D. clear():
# - Removes ALL elements, leaving an empty set `set()`.
# ------------------------------------------------------------------------------
temp_set = {1, 2, 3}
temp_set.clear()
print("After clear():", temp_set) # set()


# ==============================================================================
# 5. MATHEMATICAL & RELATIONAL SET OPERATIONS (THE CORE OF DATA ENGINEERING)
# ==============================================================================
# Python provides both OPERATOR syntax (which requires set operands)
# and METHOD syntax (which accepts ANY iterable as argument).

# Dataset A: Engineering skills
team_A = {"Python", "SQL", "Spark", "Airflow"}
# Dataset B: Analytics skills
team_B = {"SQL", "Tableau", "PowerBI", "Python"}

print("\n--- 5. MATHEMATICAL SET OPERATIONS ---")
print("Team A:", team_A)
print("Team B:", team_B)

# ------------------------------------------------------------------------------
# 1. UNION (A ∪ B): All elements present in A, B, or both.
# Operator: A | B
# Method:   A.union(B)
# ------------------------------------------------------------------------------
all_skills = team_A | team_B
print("\n1. UNION (|):", all_skills) # {'Airflow', 'Tableau', 'Spark', 'SQL', 'Python', 'PowerBI'}

# ------------------------------------------------------------------------------
# 2. INTERSECTION (A ∩ B): Only elements present in BOTH A and B.
# Operator: A & B
# Method:   A.intersection(B)
# Use Case: Finding common active customers across two campaigns.
# ------------------------------------------------------------------------------
common_skills = team_A & team_B
print("2. INTERSECTION (&):", common_skills) # {'Python', 'SQL'}

# ------------------------------------------------------------------------------
# 3. DIFFERENCE (A - B): Elements in A that are NOT in B.
# Operator: A - B
# Method:   A.difference(B)
# Use Case: Finding churned users or detecting missing rows in data reconciliation.
# ------------------------------------------------------------------------------
only_in_A = team_A - team_B
print("3. DIFFERENCE (Team A - Team B):", only_in_A) # {'Airflow', 'Spark'}
only_in_B = team_B - team_A
print("   DIFFERENCE (Team B - Team A):", only_in_B) # {'PowerBI', 'Tableau'}

# ------------------------------------------------------------------------------
# 4. SYMMETRIC DIFFERENCE (A △ B): Elements in A OR B, but NOT IN BOTH.
# Formula: (A - B) ∪ (B - A)  or  (A ∪ B) - (A ∩ B)
# Operator: A ^ B
# Method:   A.symmetric_difference(B)
# ------------------------------------------------------------------------------
exclusive_skills = team_A ^ team_B
print("4. SYMMETRIC DIFFERENCE (^):", exclusive_skills) # {'Airflow', 'PowerBI', 'Spark', 'Tableau'}


# ==============================================================================
# 6. IN-PLACE SET MUTATION OPERATIONS
# ==============================================================================
# Methods that modify the original set in-place instead of creating a new set:
# - `A |= B`  or  `A.update(B)`                  : In-place Union
# - `A &= B`  or  `A.intersection_update(B)`    : In-place Intersection
# - `A -= B`  or  `A.difference_update(B)`      : In-place Difference
# - `A ^= B`  or  `A.symmetric_difference_update(B)` : In-place Symmetric Difference

pipeline_keys = {"id", "timestamp", "payload", "debug_temp"}
pipeline_keys.difference_update({"debug_temp"})
print("\n--- 6. IN-PLACE UPDATE ---")
print("After difference_update({'debug_temp'}):", pipeline_keys)


# ==============================================================================
# 7. SET RELATIONSHIP & COMPARISON TESTS (SUBSET, SUPERSET, DISJOINT)
# ==============================================================================
print("\n--- 7. SET COMPARISON TESTS ---")

dev_skills = {"Python", "SQL"}
senior_skills = {"Python", "SQL", "Spark", "Kafka", "Airflow"}
management_skills = {"Agile", "Scrum", "Jira"}

# A. issubset(): Is every element of A inside B?
# Operator: A <= B  (Proper subset: A < B)
print("dev_skills <= senior_skills (issubset):", dev_skills.issubset(senior_skills)) # True

# B. issuperset(): Does A contain every element of B?
# Operator: A >= B  (Proper superset: A > B)
print("senior_skills >= dev_skills (issuperset):", senior_skills.issuperset(dev_skills)) # True

# C. isdisjoint(): Do A and B have ZERO common elements? (Empty intersection)
print("dev_skills.isdisjoint(management_skills):", dev_skills.isdisjoint(management_skills)) # True
print("dev_skills.isdisjoint(senior_skills):", dev_skills.isdisjoint(senior_skills))         # False


# ==============================================================================
# 8. FROZENSET: THE IMMUTABLE SET
# ==============================================================================
# A `frozenset` is an IMMUTABLE version of a set.
# Once created, elements CANNOT be added, removed, or updated.
#
# WHY FROZENSET MATTERS IN DATA ENGINEERING:
# Because standard sets are mutable, they are unhashable and CANNOT be:
# - Used as Dictionary Keys
# - Stored as elements inside another Set
# A `frozenset` IS HASHABLE, so it CAN be a dictionary key or set element!

regular_set = {1, 2, 3}
frozen = frozenset([1, 2, 3, 4])

print("\n--- 8. FROZENSET ---")
print("frozenset:", frozen, "| Type:", type(frozen))
# frozen.add(5) # ❌ AttributeError: 'frozenset' object has no attribute 'add'

# Frozenset as a Dictionary Key:
cluster_permissions = {
    frozenset(["read", "write"]): "Standard Developer Role",
    frozenset(["read", "write", "admin"]): "Platform Admin Role"
}
user_perm = frozenset(["read", "write"])
print("Lookup by frozenset key:", cluster_permissions[user_perm])

# Nested Set using frozenset:
set_of_sets = {frozenset([1, 2]), frozenset([3, 4])}
print("Set containing frozensets:", set_of_sets)


# ==============================================================================
# 9. SET COMPREHENSIONS
# ==============================================================================
# Concise, declarative syntax to construct sets with automatic deduplication.
#
# Syntax:
#   {expression for item in iterable if condition}

print("\n--- 9. SET COMPREHENSIONS ---")

# A. Extract unique word lengths:
sentence = "data engineering pipelines process streaming data at scale"
unique_lengths = {len(w) for w in sentence.split()}
print("Unique word lengths:", unique_lengths)

# B. Extract unique domain names from emails:
emails = ["wasim@corp.com", "arun@gmail.com", "priya@corp.com", "kiran@yahoo.com", "admin@gmail.com"]
unique_domains = {email.split("@")[1] for email in emails}
print("Unique email domains:", unique_domains) # {'corp.com', 'gmail.com', 'yahoo.com'}


# ==============================================================================
# 10. TIME COMPLEXITY (BIG-O) & HASH TABLE MECHANICS
# ==============================================================================
# Operation           | Average Time | Worst Case (Hash Collision) | Notes
# ------------------- | ------------ | --------------------------- | -----------------------
# Add: s.add(x)       | O(1)         | O(N)                        | Hash computation
# Remove: s.remove(x) | O(1)         | O(N)                        | Hash lookup & delete
# Discard: s.discard  | O(1)         | O(N)                        | Safe delete
# Search: x in s      | O(1)         | O(N)                        | Direct hash slot lookup
# Union: s | t        | O(len(s)+t)  | O(len(s)*t)                 | Merges all hashes
# Intersection: s & t | O(min(s, t)) | O(len(s)*t)                 | Iterates smaller set!
# Difference: s - t   | O(len(s))    | O(len(s)*t)                 | Checks each item in s
# Clear: s.clear()    | O(1)         | O(1)                        | Empties hash table

# 💡 DATA ENGINEERING INTERVIEW INSIGHT:
# If you need to search if an ID exists in 10,000,000 records:
# - In a list: `id in my_list` takes O(N) -> 10,000,000 comparisons (Very Slow!).
# - In a set:  `id in my_set`  takes O(1) -> 1 hash calculation (Instantaneous!).


# ==============================================================================
# 11. FREQUENT INTERVIEW CODING PROBLEMS & PATTERNS (SETS)
# ==============================================================================
print("\n--- 11. FREQUENT INTERVIEW CODING PROBLEMS ---")

# ------------------------------------------------------------------------------
# Pattern A: Check if a List Contains Any Duplicates
# Time Complexity: O(N)
# ------------------------------------------------------------------------------
def has_duplicates(arr):
    return len(arr) != len(set(arr))

print("has_duplicates([1, 2, 3, 4]):", has_duplicates([1, 2, 3, 4]))       # False
print("has_duplicates([1, 2, 3, 1]):", has_duplicates([1, 2, 3, 1]))       # True

# ------------------------------------------------------------------------------
# Pattern B: Find Common Elements Across Multiple Lists
# ------------------------------------------------------------------------------
l1 = [1, 2, 3, 4, 5]
l2 = [3, 4, 5, 6, 7]
l3 = [5, 6, 7, 8, 9]
common_all = set(l1) & set(l2) & set(l3)
print("Common elements across 3 lists:", common_all) # {5}

# ------------------------------------------------------------------------------
# Pattern C: Find Missing Number from 1 to N
# Given an array containing n-1 distinct numbers from 1 to n:
# ------------------------------------------------------------------------------
nums_series = [1, 2, 4, 5, 6]  # Missing 3
n = 6
missing_num = (set(range(1, n + 1)) - set(nums_series)).pop()
print(f"Missing number from 1 to {n}: {missing_num}") # 3

# ------------------------------------------------------------------------------
# Pattern D: First Repeating Character in a String (Using Hash Set)
# ------------------------------------------------------------------------------
def first_repeating_char(s):
    seen = set()
    for char in s:
        if char in seen:
            return char
        seen.add(char)
    return None

print("First repeating char in 'algorithmic':", first_repeating_char("algorithmic")) # 'i'

# ------------------------------------------------------------------------------
# Pattern E: Symmetric Difference / Discrepancy Detection (Data Quality Check)
# ------------------------------------------------------------------------------
source_records = {"TXN_101", "TXN_102", "TXN_103", "TXN_104"}
target_records = {"TXN_102", "TXN_103", "TXN_104", "TXN_105"}
discrepancies = source_records ^ target_records
print("Data pipeline discrepancies between source & target:", discrepancies) # {'TXN_101', 'TXN_105'}


# ==============================================================================
# 💡 SETS INTERVIEW SUMMARY CHEAT SHEET
# ==============================================================================
# 1. Empty Set: `set()` creates an empty set. `{}` creates an empty dictionary!
# 2. Duplicate Removal: Sets automatically eliminate duplicates.
# 3. Unindexed: Sets cannot be indexed (`s[0]` fails) or sliced.
# 4. Hashable Constraint: Only immutable objects can be set elements (no lists/dicts).
# 5. remove() vs discard(): `.remove(x)` raises KeyError if absent; `.discard(x)` is safe.
# 6. Lookups: `x in my_set` runs in O(1) average time due to hashing.
# 7. frozenset: Immutable set that is hashable and can be a dictionary key.
# 8. Set Math: `|` (Union), `&` (Intersection), `-` (Difference), `^` (Symmetric Diff).
