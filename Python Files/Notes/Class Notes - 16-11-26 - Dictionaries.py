# ==============================================================================
# CLASS NOTES: PYTHON DICTIONARIES (DEFINITIVE, IN-DEPTH REFERENCE GUIDE)
# Date: 16-11-2026
# ==============================================================================

# A Dictionary (`dict`) in Python is an ORDERED, MUTABLE collection of
# KEY-VALUE PAIRS enclosed in curly braces `{key: value}`.
#
# In Data Engineering, dictionaries are the single most critical data structure:
# 1. JSON Payloads & NoSQL Records: API payloads, MongoDB documents, and Kafka
#    JSON messages map directly 1-to-1 to Python dictionaries.
# 2. Config & Metadata Management: Pipeline connection params, schema definitions,
#    DAG arguments, and environment settings.
# 3. Lookups & Dimension Joins: Building in-memory hash tables for O(1) dimension
#    table lookups (e.g. mapping `customer_id -> customer_metadata`).
# 4. Aggregations & Frequency Counts: Grouping data, computing metrics, and
#    building histograms without third-party libraries.


# ==============================================================================
# 1. DICTIONARY CREATION & PROPERTIES
# ==============================================================================
# Dictionaries can be created using `{}` with key-value pairs or the `dict()` constructor.

# A. Empty Dictionary:
empty_dict_1 = {}
empty_dict_2 = dict()

# B. Standard Dictionary:
student = {
    "name": "Arun",
    "role": "Data Engineer",
    "age": 25,
    "skills": ["Python", "SQL", "Spark"],
    "is_active": True
}

# C. Creating with dict() constructor:
config_1 = dict(host="localhost", port=3306, db="analytics") # Keyword arguments (keys must be valid identifiers)
config_2 = dict([("env", "prod"), ("retries", 3)])           # From sequence of key-value tuples

# D. fromkeys(iterable, default_value):
# Initializes a dictionary where all keys from an iterable share a default value:
metrics = dict.fromkeys(["cpu_load", "memory_usage", "disk_io"], 0.0)
print("--- 1. CREATION & PROPERTIES ---")
print("Standard student dict:", student)
print("dict.fromkeys():", metrics)

# ------------------------------------------------------------------------------
# 💡 CRITICAL RULES FOR DICTIONARY KEYS & VALUES:
# ------------------------------------------------------------------------------
# 1. KEYS MUST BE HASHABLE & IMMUTABLE:
#    - Allowed Keys: int, float, str, tuple (of immutables), bool, frozenset.
#    - NOT Allowed Keys: list, dict, set (raises TypeError: unhashable type!).
#      `bad_dict = {[1, 2]: "error"}` -> ❌ TypeError!
# 2. KEYS ARE UNIQUE:
#    - If duplicate keys are defined, the LAST one overwrites previous ones:
#      `dup_demo = {"a": 1, "a": 2}` -> produces `{"a": 2}`.
# 3. VALUES CAN BE ANYTHING:
#    - Values can be of ANY type (mutable, immutable, nested dicts, lists, functions)
#      and CAN have duplicates.
# 4. INSERTION ORDER PRESERVED:
#    - Since Python 3.7+, dictionaries are guaranteed to maintain insertion order!


# ==============================================================================
# 2. ACCESSING ELEMENTS: bracket [] vs. .get()
# ==============================================================================
# TOP TIER INTERVIEW TOPIC: Know the precise behavioral difference!

user_profile = {"id": 101, "name": "Wasim", "city": "Bengaluru"}

print("\n--- 2. ACCESSING ELEMENTS ---")

# A. Bracket syntax `dict[key]`:
# - Retrieves the value for the key.
# - ⚠️ RAISES KeyError if the key is NOT found in the dictionary!
print("Bracket access user_profile['name']:", user_profile["name"])
# print(user_profile["salary"]) # ❌ KeyError: 'salary'

# B. get(key, default=None):
# - Retrieves the value if key exists.
# - ✅ Returns `default` (or `None`) if key does NOT exist without crashing!
print("get('name'):", user_profile.get("name"))
print("get('salary') [Absent key]:", user_profile.get("salary"))                     # None (Safe!)
print("get('salary', 50000) [Custom default]:", user_profile.get("salary", 50000))   # 50000


# ==============================================================================
# 3. ADDING & UPDATING ELEMENTS
# ==============================================================================
print("\n--- 3. ADDING & UPDATING ELEMENTS ---")
pipeline_conf = {"batch_size": 1000, "engine": "Spark"}

# A. Bracket assignment `dict[key] = value`:
# - If key does not exist -> ADDS new key-value pair.
# - If key already exists -> OVERWRITES existing value.
pipeline_conf["timeout"] = 30           # Adds new key
pipeline_conf["batch_size"] = 5000      # Updates existing key
print("After bracket updates:", pipeline_conf)

# B. update([other_dict / iterable of pairs / kwargs]):
# - Merges another dictionary or key-value sequence into the target dictionary in-place.
# - Overwrites overlapping keys; inserts new non-overlapping keys.
pipeline_conf.update({"format": "parquet", "compression": "snappy"})
print("After update():", pipeline_conf)

# C. Dictionary Merge Operator `|` and Update Operator `|=` (Python 3.9+):
defaults = {"mode": "append", "retries": 1}
custom = {"retries": 5, "cluster": "prod-k8s"}

# Merge operator `|` returns a BRAND NEW dictionary:
merged_conf = defaults | custom  # Overlapping key 'retries' takes right operand's value (5)
print("Merge operator (|):", merged_conf)

# In-place update operator `|=`:
defaults |= custom
print("In-place merge (|=):", defaults)

# D. setdefault(key, default=None):
# - If key IS present -> Returns its existing value (does NOT change anything).
# - If key is NOT present -> INSERTS key with `default` and returns `default`!
# Extremely useful for grouping items into lists!
word_index = {}
word_index.setdefault("data", []).append("doc1.txt")
word_index.setdefault("data", []).append("doc2.txt")
print("setdefault grouping:", word_index) # {'data': ['doc1.txt', 'doc2.txt']}


# ==============================================================================
# 4. REMOVING ELEMENTS: pop vs. popitem vs. del vs. clear
# ==============================================================================
# CRITICAL INTERVIEW TOPIC: Know which methods return values and error conditions!

print("\n--- 4. REMOVING ELEMENTS ---")
db_conn = {
    "host": "10.0.0.1",
    "port": 5432,
    "user": "postgres",
    "temp_token": "xyz123",
    "debug": True
}

# ------------------------------------------------------------------------------
# A. pop(key, [default]):
# - Removes the specified key and RETURNS its value.
# - ⚠️ Raises KeyError if key is absent AND no default is provided!
# - ✅ If default is provided, returns default safely when key is absent.
# ------------------------------------------------------------------------------
token = db_conn.pop("temp_token")
print(f"Popped 'temp_token': '{token}'")
missing = db_conn.pop("ssl_cert", "No SSL") # Safe pop with fallback
print(f"Popped absent key with fallback: '{missing}'")

# ------------------------------------------------------------------------------
# B. popitem():
# - Removes and returns the LAST inserted key-value pair as a (key, value) TUPLE!
#   (LIFO - Last-In, First-Out order since Python 3.7).
# - ⚠️ Raises KeyError if dictionary is empty!
# ------------------------------------------------------------------------------
last_item = db_conn.popitem()
print(f"popitem() returned: {last_item} | Remaining: {db_conn}")

# ------------------------------------------------------------------------------
# C. del statement:
# - Deletes a specific key-value pair or deletes the entire dictionary variable.
# - Does NOT return anything.
# - ⚠️ Raises KeyError if key is absent.
# ------------------------------------------------------------------------------
del db_conn["user"]
print("After del db_conn['user']:", db_conn)

# ------------------------------------------------------------------------------
# D. clear():
# - Empties the dictionary completely in-place leaving `{}`.
# ------------------------------------------------------------------------------
scratch = {"a": 1, "b": 2}
scratch.clear()
print("After clear():", scratch) # {}


# ==============================================================================
# 5. DICTIONARY VIEW OBJECTS: keys(), values(), items()
# ==============================================================================
# `.keys()`, `.values()`, and `.items()` return DYNAMIC VIEW OBJECTS.
# They do NOT create static lists; they reflect real-time changes to the dictionary!

print("\n--- 5. DICTIONARY VIEW OBJECTS ---")
dept_salaries = {"Engineering": 120000, "Analytics": 95000, "DevOps": 110000}

k_view = dept_salaries.keys()     # dict_keys(['Engineering', 'Analytics', 'DevOps'])
v_view = dept_salaries.values()   # dict_values([120000, 95000, 110000])
i_view = dept_salaries.items()    # dict_items([('Engineering', 120000), ...])

print("Keys view:", k_view)
print("Values view:", v_view)
print("Items view:", i_view)

# Dynamic reflection demo:
dept_salaries["QA"] = 80000
print("Keys view dynamically updated:", k_view) # 'QA' is automatically reflected!

# 💡 INTERVIEW TIP ON SET OPERATIONS WITH DICT KEYS:
# `dict.keys()` and `dict.items()` behave like SETS! You can perform set operations:
dict_1 = {"a": 1, "b": 2, "c": 3}
dict_2 = {"b": 20, "c": 3, "d": 40}

common_keys = dict_1.keys() & dict_2.keys()
print("Common keys using & operator on keys():", common_keys) # {'b', 'c'}

identical_pairs = dict_1.items() & dict_2.items()
print("Identical (key, val) pairs using & on items():", identical_pairs) # {('c', 3)}


# ==============================================================================
# 6. ITERATING OVER DICTIONARIES
# ==============================================================================
print("\n--- 6. ITERATION PATTERNS ---")
car = {"brand": "Tesla", "model": "Model 3", "year": 2024}

# Pattern 1: Iterating over Keys directly (default behavior):
print("1. Keys (default):")
for key in car:
    print(f"   {key} -> {car[key]}")

# Pattern 2: Iterating over Values:
print("\n2. Values only:")
for val in car.values():
    print(f"   Value: {val}")

# Pattern 3: Iterating over Key-Value pairs with unpacking (Most Pythonic!):
print("\n3. Key-Value pairs (.items()):")
for key, val in car.items():
    print(f"   {key}: {val}")


# ==============================================================================
# 7. COPYING DICTIONARIES: SHALLOW COPY vs. DEEP COPY
# ==============================================================================
# Assigning with `=` copies only the memory reference. Changes to one affect both!

print("\n--- 7. SHALLOW vs. DEEP COPY ---")

# A. Reference Assignment:
d1 = {"a": 1}
d2 = d1
d2["a"] = 99
print("Reference copy (both change):", d1) # {'a': 99}

# B. Shallow Copy (`dict.copy()` or `dict(orig)`):
# Creates a new outer dict, but nested mutable objects STILL share references!
orig_nested = {"user": "Arun", "roles": ["Admin", "Developer"]}
shallow_dict = orig_nested.copy()

shallow_dict["user"] = "Wasim"        # Outer key changed -> SAFE
shallow_dict["roles"].append("Ops")   # Nested list changed -> BOTH AFFECTED!

print("Shallow copy original:", orig_nested) # roles has 'Ops' in BOTH!
print("Shallow copy clone:", shallow_dict)

# C. Deep Copy (`copy.deepcopy()`):
# Recursively duplicates the dictionary and all nested structures:
import copy
orig_nested_2 = {"user": "Arun", "roles": ["Admin", "Developer"]}
deep_dict = copy.deepcopy(orig_nested_2)

deep_dict["roles"].append("Superuser")
print("Deep copy original (protected):", orig_nested_2) # ['Admin', 'Developer']
print("Deep copy clone:", deep_dict)                   # ['Admin', 'Developer', 'Superuser']


# ==============================================================================
# 8. DICTIONARY COMPREHENSIONS
# ==============================================================================
# Elegant syntax to construct new dictionaries from iterables or transform existing dicts.
#
# Syntax:
#   {key_expression: value_expression for item in iterable if condition}

print("\n--- 8. DICTIONARY COMPREHENSIONS ---")

# A. Transforming numbers:
numbers = [1, 2, 3, 4, 5]
sq_dict = {x: x ** 2 for x in numbers}
print("Squares dict:", sq_dict) # {1: 1, 2: 4, 3: 9, 4: 16, 5: 25}

# B. Filtering items:
# Keep only employees earning > 100,000:
salaries = {"Wasim": 120000, "Arun": 95000, "Kiran": 115000, "Priya": 90000}
high_earners = {name: sal for name, sal in salaries.items() if sal >= 100000}
print("High earners:", high_earners) # {'Wasim': 120000, 'Kiran': 115000}

# C. Inverting / Swapping Keys and Values (Classic Interview Task!):
# Assumes values are unique and hashable:
roles = {"Wasim": "Lead", "Arun": "Associate", "Priya": "Manager"}
inverted_roles = {role: name for name, role in roles.items()}
print("Inverted dict:", inverted_roles) # {'Lead': 'Wasim', 'Associate': 'Arun', 'Manager': 'Priya'}

# D. Pairing two lists into a dictionary with zip():
keys_list = ["emp_id", "dept", "location"]
vals_list = [101, "Data Engineering", "Bengaluru"]
emp_mapped = {k: v for k, v in zip(keys_list, vals_list)}
print("Zipped dict:", emp_mapped)


# ==============================================================================
# 9. ADVANCED DICTIONARY UTILITIES: defaultdict & Counter (collections module)
# ==============================================================================
from collections import defaultdict, Counter

print("\n--- 9. ADVANCED COLLECTIONS MODULE ---")

# A. defaultdict(factory_function):
# Never raises KeyError! Automatically initializes absent keys with default type.
dept_employees = defaultdict(list)
dept_employees["Data"].append("Wasim")
dept_employees["Data"].append("Arun")
dept_employees["Cloud"].append("Priya")
print("defaultdict(list):", dict(dept_employees))

# B. Counter(iterable):
# Automatically calculates frequency counts of elements (word counts / record occurrences):
events = ["click", "view", "click", "purchase", "view", "click"]
event_counts = Counter(events)
print("Counter frequencies:", event_counts) # Counter({'click': 3, 'view': 2, 'purchase': 1})
print("Most common element:", event_counts.most_common(1)) # [('click', 3)]


# ==============================================================================
# 10. TIME COMPLEXITY (BIG-O) & HASH TABLE ARCHITECTURE
# ==============================================================================
# Python dictionaries are implemented using a dense HASH TABLE.
#
# Operation                | Average Case | Worst Case (Hash Collision) | Notes
# ------------------------ | ------------ | --------------------------- | ----------------------
# Access: dict[key]        | O(1)         | O(N)                        | Direct hash lookup
# Insert / Update          | O(1)         | O(N)                        | Hash calc + insert
# Delete: del dict[key]    | O(1)         | O(N)                        | Hash lookup + delete
# Search Key: key in dict  | O(1)         | O(N)                        | Checks hash of key
# Search Value: val in v   | O(N)         | O(N)                        | Must scan all values!
# Iteration: for k in dict | O(N)         | O(N)                        | Traverses entries
# Clear: dict.clear()      | O(1)         | O(1)                        | Resets hash table
#
# 💡 DATA PIPELINE EFFICIENCY TIP:
# Checking `key in dict` is O(1) instantaneous!
# BUT checking `val in dict.values()` is O(N) linear time (scans entire dictionary)!


# ==============================================================================
# 11. FREQUENT INTERVIEW CODING PROBLEMS & PATTERNS (DICTIONARIES)
# ==============================================================================
print("\n--- 11. FREQUENT INTERVIEW CODING PROBLEMS ---")

# ------------------------------------------------------------------------------
# Pattern A: Word Frequency Counter (Classic MapReduce pattern without libraries)
# ------------------------------------------------------------------------------
log_text = "error timeout error fatal warning error timeout"
word_freq = {}
for word in log_text.split():
    word_freq[word] = word_freq.get(word, 0) + 1
print("Word frequency count:", word_freq)
# {'error': 3, 'timeout': 2, 'fatal': 1, 'warning': 1}

# ------------------------------------------------------------------------------
# Pattern B: Merge Multiple Dictionaries with Value Summation
# ------------------------------------------------------------------------------
store1_sales = {"apple": 50, "banana": 30, "orange": 20}
store2_sales = {"banana": 40, "orange": 15, "mango": 60}

total_sales = store1_sales.copy()
for fruit, qty in store2_sales.items():
    total_sales[fruit] = total_sales.get(fruit, 0) + qty
print("Merged sales with summation:", total_sales)
# {'apple': 50, 'banana': 70, 'orange': 35, 'mango': 60}

# ------------------------------------------------------------------------------
# Pattern C: Find Key with Maximum Value
# ------------------------------------------------------------------------------
salaries_demo = {"Wasim": 120000, "Arun": 95000, "Kiran": 135000, "Priya": 110000}
top_earner = max(salaries_demo, key=salaries_demo.get)
print(f"Top earner: {top_earner} (Salary: {salaries_demo[top_earner]})")

# ------------------------------------------------------------------------------
# Pattern D: Group Anagrams (Top LeetCode / Data Engineering Problem!)
# Given a list of words, group anagrams together.
# ------------------------------------------------------------------------------
words = ["eat", "tea", "tan", "ate", "nat", "bat"]
anagram_groups = defaultdict(list)

for w in words:
    # Sort characters of word as a tuple key (tuple is immutable & hashable!):
    key = tuple(sorted(w))
    anagram_groups[key].append(w)

print("Grouped Anagrams:", list(anagram_groups.values()))
# [['eat', 'tea', 'ate'], ['tan', 'nat'], ['bat']]

# ------------------------------------------------------------------------------
# Pattern E: Nested JSON / Dictionary Key Flattening
# Flattening nested dictionaries into dot-separated paths for data warehouse staging:
# ------------------------------------------------------------------------------
nested_json = {
    "user": {
        "id": 101,
        "name": "Wasim",
        "location": {"city": "Bengaluru", "country": "India"}
    },
    "status": "active"
}

def flatten_dict(d, parent_key="", sep="."):
    items = []
    for k, v in d.items():
        new_key = f"{parent_key}{sep}{k}" if parent_key else k
        if isinstance(v, dict):
            items.extend(flatten_dict(v, new_key, sep=sep).items())
        else:
            items.append((new_key, v))
    return dict(items)

flattened_record = flatten_dict(nested_json)
print("Flattened nested JSON for Data Lake staging:", flattened_record)
# {'user.id': 101, 'user.name': 'Wasim', 'user.location.city': 'Bengaluru', ...}


# ==============================================================================
# 💡 DICTIONARY INTERVIEW SUMMARY CHEAT SHEET
# ==============================================================================
# 1. Structure: `{key: value}` pairs.
# 2. Key Constraints: Must be hashable & immutable (int, str, tuple; never list/dict).
# 3. Keys are Unique: Overlapping keys keep the last assigned value.
# 4. Safe Retrieval: Use `.get(key, default)` to avoid crashing on `KeyError`.
# 5. Order: Preserves insertion order (guaranteed since Python 3.7+).
# 6. Set Operations on Keys: `d1.keys() & d2.keys()` computes common keys instantly.
# 7. Merge Operators (3.9+): `d1 | d2` (returns new dict) and `d1 |= d2` (in-place update).
# 8. Time Complexity: Hash table lookups, additions, and deletions run in O(1) average time.
