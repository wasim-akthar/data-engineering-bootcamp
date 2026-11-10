# ==============================================================================
# CLASS NOTES: PYTHON STRINGS (DEFINITIVE, IN-DEPTH REFERENCE GUIDE)
# Date: 04-11-2026
# ==============================================================================

# A string (`str`) in Python is an IMMUTABLE sequence of Unicode characters.
# In Data Engineering, strings represent the vast majority of raw incoming data:
# file paths, log streams, CSV lines, JSON keys/payloads, database VARCHARs,
# API responses, and messy text requiring parsing, cleansing, and normalization.


# ==============================================================================
# 1. STRING CREATION & ESCAPE SEQUENCES
# ==============================================================================
# Strings can be enclosed in single quotes (' '), double quotes (" "), or
# triple quotes (''' ''' or """ """).

# A. Single and Double Quotes (functionally identical):
single_str = 'Data Engineering'
double_str = "Data Engineering"

# Quotes inside strings without escaping:
quote_inside_1 = "Python's popularity is rising."
quote_inside_2 = 'He said, "Data is the new oil."'

# B. Common Escape Sequences:
# \n : Newline
# \t : Tab space
# \\ : Literal backslash
# \' : Single quote
# \" : Double quote
escaped_text = "Line 1\nLine 2\tTabbed\t\"Quoted\""

# C. Triple Quotes (Multi-line strings, docstrings):
multiline_text = """Batch Job Summary:
Status: Success
Rows Processed: 1,500,000
Time Elapsed: 4.2s"""

# D. Raw Strings (r'...' or R'...'):
# Treats backslashes as literal characters without interpreting escape codes.
# ESSENTIAL for Windows file paths and Regular Expressions (`re` module)!
normal_path = "C:\new_folder\test.csv"     # ⚠️ \n is treated as a newline!
raw_path = r"C:\new_folder\test.csv"       # ✅ Preserves literal \n

# E. Byte Strings (b'...' or B'...'):
# Sequence of raw bytes (integers 0-255).
# Used when dealing with binary files, networking sockets, or Kafka byte payloads!
byte_data = b"Hello Data"
print("--- 1. STRING CREATION ---")
print("Raw Path:", raw_path)
print("Byte String:", byte_data, "| Type:", type(byte_data))


# ==============================================================================
# 2. STRING IMMUTABILITY & MEMORY BEHAVIOR (CRITICAL INTERVIEW TOPIC!)
# ==============================================================================
# Strings in Python are 100% IMMUTABLE.
# Once a string object is created in memory, its characters CANNOT be modified,
# replaced, or deleted in-place.
# Any method or operation that appears to "modify" a string actually creates
# and returns an entirely NEW string object in memory!

sample = "Spark"
print("\n--- 2. IMMUTABILITY & MEMORY ID ---")
print("Original string:", sample, "| Memory Address (id):", id(sample))

# Attempting in-place item assignment raises TypeError:
# sample[0] = 's'  # ❌ TypeError: 'str' object does not support item assignment

# Reassignment points the variable to an entirely new string object:
sample = sample + " Engine"
print("Modified string:", sample, "| Memory Address (id):", id(sample))  # id is different!

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (IMMUTABILITY & INTERNING):
# ------------------------------------------------------------------------------
# 1. Why are strings immutable in Python?
#    - Thread Safety: Immutable objects can be safely shared across threads without locks.
#    - Hashability: Because characters never change, their hash value is invariant.
#      This is why strings can safely serve as Dictionary Keys and Set Elements!
#    - Memory Optimization (String Interning): Python automatically caches and reuses
#      identical string literals (CPython `sys.intern`) to save memory.
# 2. String Concatenation In Loops (Major Performance Trap!):
#    - Doing `text += word` inside a loop of N strings takes O(N^2) quadratic time
#      because it creates a new copy of the growing string on EVERY single iteration!
#    - Pythonic & High-Performance alternative: Collect strings into a list and use
#      `"".join(list)` which takes O(N) linear time and allocates memory once.


# ==============================================================================
# 3. INDEXING (POSITIVE & NEGATIVE)
# ==============================================================================
# Python sequences support 0-based indexing from the left (positive),
# and -1-based indexing from the right (negative).
#
# String:       P   y   t   h   o   n
# Positive:     0   1   2   3   4   5
# Negative:    -6  -5  -4  -3  -2  -1

lang = "Python"
print("\n--- 3. INDEXING ---")
print("First character (lang[0]):", lang[0])          # 'P'
print("Last character (lang[-1]):", lang[-1])        # 'n'
print("Second to last (lang[-2]):", lang[-2])        # 'o'
print("Length of string len(lang):", len(lang))      # 6

# IndexError: Accessing an out-of-range index raises IndexError
# print(lang[10]) # ❌ IndexError: string index out of range


# ==============================================================================
# 4. STRING SLICING (SUBSTRING EXTRACTION)
# ==============================================================================
# Slicing extracts a substring using the formula:
#   string[start : stop : step]
#
# Rules:
# - start: Inclusive starting index (default is 0).
# - stop:  Exclusive stopping index (extracts up to stop - 1). Default is len(str).
# - step:  Step size / stride (default is 1). Negative step traverses right-to-left.
# - CRUCIAL: Unlike indexing, SLICING NEVER RAISES AN IndexError when indices are out of bounds!

text = "DataEngineering"
print("\n--- 4. STRING SLICING ---")
print("Full string:", text)
print("text[0:4]   (First 4 chars):", text[0:4])       # 'Data'
print("text[4:]    (From index 4 to end):", text[4:])   # 'Engineering'
print("text[:4]    (From start up to index 4):", text[:4]) # 'Data'
print("text[:]     (Shallow copy of whole string):", text[:])
print("text[::2]   (Every 2nd char):", text[::2])       # 'DtEgneig'
print("text[::-1]  (REVERSE STRING - Classic!):", text[::-1]) # 'gnireenignEataD'

# Slicing with negative indices:
print("text[-11:]  (Last 11 chars):", text[-11:])      # 'Engineering'
print("text[:-11]  (All except last 11):", text[:-11]) # 'Data'

# Slicing step with boundaries:
print("text[0:10:2]:", text[0:10:2])                   # 'DtEgi'

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (SLICING):
# ------------------------------------------------------------------------------
# 1. Reverse String:
#    - `s[::-1]` is the fastest and most Pythonic way to reverse a string (optimized C loop).
# 2. Out-of-bounds safety:
#    - `text[50:100]` safely returns empty string `""` without crashing.


# ==============================================================================
# 5. STRING OPERATORS
# ==============================================================================
print("\n--- 5. STRING OPERATORS ---")

# A. Concatenation (+):
greeting = "Hello" + " " + "World"
print("Concatenation (+):", greeting)

# B. Repetition (*):
divider = "-" * 30
print("Repetition (*):", divider)

# C. Membership (in / not in):
print("'Data' in 'Data Science':", "Data" in "Data Science")       # True
print("'SQL' not in 'Data Science':", "SQL" not in "Data Science") # True

# D. Comparison Operators (==, !=, <, >, <=, >=):
# Compared character by character lexicographically using Unicode ordinals ord(char):
print("'apple' < 'banana':", 'apple' < 'banana')   # True ('a'=97 < 'b'=98)
print("'Apple' < 'apple':", 'Apple' < 'apple')     # True ('A'=65 < 'a'=97)


# ==============================================================================
# 6. ESSENTIAL BUILT-IN STRING METHODS (COMPLETE CATEGORIES)
# ==============================================================================
# Remember: Strings are immutable, so all methods return a NEW string.

# ------------------------------------------------------------------------------
# A. Case Conversion Methods
# ------------------------------------------------------------------------------
raw_title = "python dATA enGineering"
print("\n--- 6A. CASE CONVERSION ---")
print("upper():", raw_title.upper())           # 'PYTHON DATA ENGINEERING'
print("lower():", raw_title.lower())           # 'python data engineering'
print("title():", raw_title.title())           # 'Python Data Engineering'
print("capitalize():", raw_title.capitalize()) # 'Python data engineering'
print("swapcase():", raw_title.swapcase())     # 'PYTHON Data ENgINEERING'
# casefold(): Aggressive lowercasing for caseless matching (handles non-English letters):
print("'ß'.casefold():", 'ß'.casefold())       # 'ss' (lower() keeps 'ß')

# ------------------------------------------------------------------------------
# B. Stripping / Trimming Whitespace & Characters (Data Cleansing Core)
# ------------------------------------------------------------------------------
messy_val = "   Wasim Akthar \n\t  "
print("\n--- 6B. TRIMMING & STRIPPING ---")
print(f"strip():  '{messy_val.strip()}'")   # Removes leading and trailing whitespace
print(f"lstrip(): '{messy_val.lstrip()}'")  # Removes leading only
print(f"rstrip(): '{messy_val.rstrip()}'")  # Removes trailing only

# Stripping specific custom characters (strips any matching leading/trailing characters):
custom_str = "...###Data Pipeline###..."
print("strip('.#'):", custom_str.strip(".#")) # 'Data Pipeline'

# Python 3.9+ Exact Prefix and Suffix Removal:
url = "https://www.company.com/api/v1/"
print("removeprefix():", url.removeprefix("https://")) # 'www.company.com/api/v1/'
print("removesuffix():", url.removesuffix("/"))        # 'https://www.company.com/api/v1'

# ------------------------------------------------------------------------------
# C. Searching, Locating & Counting Substrings
# ------------------------------------------------------------------------------
sentence = "Apache Kafka and Apache Spark and Apache Flink"
print("\n--- 6C. SEARCHING & COUNTING ---")

# count(sub, start, end): Number of non-overlapping occurrences
print("count('Apache'):", sentence.count("Apache"))  # 3

# find() vs. index():
# - find(): returns starting index of first match; returns -1 if NOT found (Safe!).
# - index(): returns starting index; raises ValueError if NOT found!
print("find('Spark'):", sentence.find("Spark"))       # 24
print("find('Hadoop'):", sentence.find("Hadoop"))     # -1 (Not found, no error)
# print(sentence.index("Hadoop")) # ❌ Raises ValueError: substring not found

# rfind() and rindex() find from right to left:
print("rfind('Apache'):", sentence.rfind("Apache"))   # 34 (Last occurrence)

# startswith() & endswith() - Boolean checks (accepts string or tuple of strings):
filename = "daily_sales_20261104.parquet"
print("startswith('daily_sales'):", filename.startswith("daily_sales")) # True
print("endswith('.parquet'):", filename.endswith(".parquet"))           # True
print("endswith tuple:", filename.endswith((".csv", ".parquet", ".json"))) # True

# ------------------------------------------------------------------------------
# D. Replacing & Splitting / Partitioning / Joining (Data Transformation)
# ------------------------------------------------------------------------------
print("\n--- 6D. REPLACE, SPLIT & JOIN ---")

# replace(old, new, count):
csv_record = "101,John Doe,Data Engineer,95000"
fixed_record = csv_record.replace(",", " | ")
print("replace():", fixed_record)

# replace with count limit:
print("replace 1st comma only:", csv_record.replace(",", " | ", 1))

# split(delimiter, maxsplit): Breaks string into a LIST of substrings
columns = csv_record.split(",")
print("split():", columns)  # ['101', 'John Doe', 'Data Engineer', '95000']
print("split with maxsplit=2:", csv_record.split(",", maxsplit=2))

# rsplit(): Splits from the right:
filepath = "data/bronze/raw_events_2026.json"
print("rsplit('/', 1):", filepath.rsplit("/", 1)) # ['data/bronze', 'raw_events_2026.json']

# partition(sep) and rpartition(sep):
# Splits string at the FIRST occurrence of sep and returns a 3-TUPLE:
# (head, sep, tail). If sep is not found, returns (str, "", "").
header, sep, val = "host=localhost:5432".partition("=")
print(f"partition('='): head='{header}', sep='{sep}', tail='{val}'")

# splitlines(keepends=False): Splits text by line boundaries (\n, \r\n)
log_data = "INFO: Step 1\nWARN: High Memory\nERROR: Connection Timeout"
print("splitlines():", log_data.splitlines())

# join(iterable): Concatenates elements of an iterable using separator string!
# CRITICAL RULE: Elements in the iterable MUST be strings.
tech_stack = ["Kafka", "Spark", "Delta Lake", "Snowflake"]
pipeline_str = " -> ".join(tech_stack)
print("join():", pipeline_str)

# ------------------------------------------------------------------------------
# E. Character & String Inspection / Validation Methods (Boolean is... methods)
# ------------------------------------------------------------------------------
print("\n--- 6E. CHARACTER INSPECTION (is... methods) ---")
print("'12345'.isdigit():", "12345".isdigit())         # True (Digits only)
print("'Alpha'.isalpha():", "Alpha".isalpha())         # True (Alphabetic only)
print("'Alpha123'.isalnum():", "Alpha123".isalnum())   # True (Alphanumeric)
print("'   '.isspace():", "   ".isspace())             # True (Whitespace only)
print("'data'.islower():", "data".islower())           # True
print("'DATA'.isupper():", "DATA".isupper())           # True
print("'Data Engineer'.istitle():", "Data Engineer".istitle()) # True
print("'123.45'.isdecimal()", "123.45".isdecimal()) # True
print("'user_id'.isidentifier():", "user_id".isidentifier())   # True (Valid variable name)
print("'print'.isascii():", "print".isascii())         # True (ASCII chars only)

# ------------------------------------------------------------------------------
# F. Padding & Alignment
# ------------------------------------------------------------------------------
print("\n--- 6F. PADDING & ALIGNMENT ---")
emp_id = "45"
print("zfill(5) (Zero fill):", emp_id.zfill(5))         # '00045' (Great for SQL ID padding!)
print("center(20, '='):", "REPORT".center(20, "="))     # '=======REPORT======='
print("ljust(15, '.'):", "Item".ljust(15, "."))         # 'Item...........'
print("rjust(15, '.'):", "Item".rjust(15, "."))         # '...........Item'

# ------------------------------------------------------------------------------
# G. Character Translation: str.maketrans() and translate()
# ------------------------------------------------------------------------------
# The fastest way to substitute or strip multiple characters at once (C-level speed).
print("\n--- 6G. CHARACTER TRANSLATION (translate) ---")
raw_phone = "+1-(800)-555-0199"
# Remove all punctuation by mapping them to None:
trans_table = str.maketrans("", "", "+-()")
clean_phone = raw_phone.translate(trans_table)
print("Original Phone:", raw_phone)
print("Cleaned Phone with translate():", clean_phone) # '18005550199'


# ==============================================================================
# 7. STRING ENCODING & DECODING (UTF-8, ASCII, BYTES)
# ==============================================================================
# Encoding: str -> bytes (e.g., preparing string to send over network/Kafka)
# Decoding: bytes -> str (e.g., reading payload from file or API response)

print("\n--- 7. ENCODING & DECODING ---")
source_text = "Data Engineering Bootcamp"

# encode() to bytes using UTF-8:
encoded_bytes = source_text.encode("utf-8")
print("Encoded (bytes):", encoded_bytes)

# decode() bytes back to string:
decoded_str = encoded_bytes.decode("utf-8")
print("Decoded (str):", decoded_str)


# ==============================================================================
# 8. STRING FORMATTING (THE 3 GENERATIONS IN PYTHON)
# ==============================================================================
user = "Wasim"
role = "Data Engineer"
salary = 95000.758

print("\n--- 8. STRING FORMATTING METHODS ---")

# Generation 1: % Formatting (Legacy C-style printf)
gen1 = "User: %s | Role: %s | Salary: $%.2f" % (user, role, salary)
print("Gen 1 (%):", gen1)

# Generation 2: str.format() (Python 2.7+)
gen2 = "User: {0} | Role: {1} | Salary: ${2:.2f}".format(user, role, salary)
print("Gen 2 (.format()):", gen2)

# Generation 3: Formatted String Literals (f-strings - Python 3.6+)
# FASTEST, MOST READABLE, and supports inline expressions!
gen3 = f"User: {user} | Role: {role.upper()} | Salary: ${salary:,.2f}"
print("Gen 3 (f-string):", gen3)

# Powerful f-string tricks:
# 1. Comma as thousands separator: {salary:,.2f} -> 95,000.76
# 2. Percentage formatting:
completion_rate = 0.945
print(f"Completion: {completion_rate:.1%}")  # '94.5%'
# 3. Debug syntax (Python 3.8+): {var=} prints expression and its value:
batch_id = 1045
print(f"Debug trick: {batch_id=}")           # 'batch_id=1045'
# 4. Alignment inside f-strings:
print(f"{'ID':<10} | {'Status':>10}")
print(f"{'101':<10} | {'SUCCESS':>10}")


# ==============================================================================
# 9. ASCII & UNICODE (ord() & chr())
# ==============================================================================
# ord(char): Returns integer Unicode code point of a character.
# chr(code): Returns character from integer Unicode code point.

print("\n--- 9. ASCII / UNICODE HELPERS ---")
print("ord('A'):", ord('A'))  # 65
print("ord('a'):", ord('a'))  # 97
print("chr(65):", chr(65))    # 'A'
print("chr(97):", chr(97))    # 'a'


# ==============================================================================
# 10. FREQUENT INTERVIEW CODING PROBLEMS & PATTERNS (STRINGS)
# ==============================================================================
print("\n--- 10. FREQUENT INTERVIEW CODING PROBLEMS ---")

# ------------------------------------------------------------------------------
# Pattern A: Palindrome Check
# ------------------------------------------------------------------------------
# A palindrome reads the same forwards and backwards (e.g., 'radar', 'madam').
candidate = "RaceCar"
# Standardize by lowercasing and compare to reversed slice:
is_palindrome = candidate.lower() == candidate.lower()[::-1]
print(f"Is '{candidate}' a Palindrome?: {is_palindrome}")

# ------------------------------------------------------------------------------
# Pattern B: Count Vowels and Consonants
# ------------------------------------------------------------------------------
sample_text = "Data Engineering Bootcamp 2026"
vowels = "aeiou"
vowel_count = 0
consonant_count = 0

for ch in sample_text.lower():
    if ch.isalpha():
        if ch in vowels:
            vowel_count += 1
        else:
            consonant_count += 1
print(f"Vowels: {vowel_count} | Consonants: {consonant_count}")

# ------------------------------------------------------------------------------
# Pattern C: Reverse Words in a Sentence
# ------------------------------------------------------------------------------
sentence_to_rev = "Apache Spark is fast"
# Step 1: split into words -> ['Apache', 'Spark', 'is', 'fast']
# Step 2: reverse word list -> ['fast', 'is', 'Spark', 'Apache']
# Step 3: join with space
reversed_sentence = " ".join(sentence_to_rev.split()[::-1])
print(f"Original: '{sentence_to_rev}'")
print(f"Reversed Words: '{reversed_sentence}'")

# ------------------------------------------------------------------------------
# Pattern D: Anagram Check
# ------------------------------------------------------------------------------
# Two strings are anagrams if they contain the exact same characters in different order.
str1 = "listen"
str2 = "silent"
is_anagram = sorted(str1) == sorted(str2)
print(f"Are '{str1}' and '{str2}' Anagrams?: {is_anagram}")

# ------------------------------------------------------------------------------
# Pattern E: Remove Duplicate Characters while Preserving Order
# ------------------------------------------------------------------------------
raw_chars = "engineering"
# Method using dict.fromkeys() (keys preserve insertion order since Python 3.7):
unique_chars = "".join(dict.fromkeys(raw_chars))
print(f"Original: '{raw_chars}' -> Unique Preserved: '{unique_chars}'")

# ------------------------------------------------------------------------------
# Pattern F: Character Frequency Counter
# ------------------------------------------------------------------------------
freq_input = "pipeline"
freq_dict = {}
for char in freq_input:
    freq_dict[char] = freq_dict.get(char, 0) + 1
print(f"Character frequency of '{freq_input}': {freq_dict}")


# ==============================================================================
# 💡 SUMMARY CHEAT SHEET FOR INTERVIEWS & DATA PIPELINES
# ==============================================================================
# 1. Immutability:
#    - Strings cannot be modified in place. Any change yields a new string.
# 2. Reversing:
#    - Slice `s[::-1]` is O(N) and optimal.
# 3. String Concatenation:
#    - Inside loops, NEVER use `+=` (O(N^2)). Always use `"".join(list)` (O(N)).
# 4. Searching:
#    - Use `.find()` when the item might be missing (returns -1 safely).
#    - Use `.index()` only when you want an exception (`ValueError`) raised.
# 5. Fast Bulk Replacement / Stripping:
#    - Use `str.maketrans()` with `.translate()` for multi-character cleaning.
# 6. String Interning:
#    - CPython caches and interns certain strings for memory conservation.
