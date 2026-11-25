# ==============================================================================
# CLASS NOTES: PYTHON OOP - PART 3: ADVANCED OOP & DESIGN PATTERNS
# Date: 20-11-2026
# ==============================================================================

# ------------------------------------------------------------------------------
# 🌟 BEGINNER'S ROADMAP TO ADVANCED OOP
# ------------------------------------------------------------------------------
# In this part, we look at how senior Python & Data Engineers write real software:
# 1. Composition : Why assembling objects like LEGO blocks is better than deep inheritance.
# 2. Operator Overloading : Teaching custom objects how to use `+`, `-`, or `>`.
# 3. Context Managers : How the `with` statement guarantees files/databases never leak resources.
# 4. __slots__ : The memory optimization trick that saves gigabytes of RAM in big data pipelines.
# 5. Design Patterns : Common, battle-tested solutions to everyday software challenges.


# ==============================================================================
# 1. COMPOSITION vs. INHERITANCE (THE LEGO BLOCKS PRINCIPLE)
# ==============================================================================
# In Part 2, we learned Inheritance ("IS-A" relationship):
# e.g., A `Dog` IS-A `Animal`.
#
# But in real data systems, Inheritance can make code messy and rigid.
# Instead, the golden rule of software engineering is:
# 👉 "Favor Composition over Inheritance" ("HAS-A" relationship).
#
# Think of a computer: A Computer does not "inherit" from a Monitor or Keyboard.
# A Computer HAS-A Monitor, HAS-A Keyboard, and HAS-A Hard Drive!
# If your monitor breaks, you unplug it and plug in a new one without rebuilding the computer!

print("--- 1. COMPOSITION (LEGO ARCHITECTURE) ---")

class FileExtractor:
    def get_data(self):
        return ["ROW_A", "ROW_B"]

class DataTransformer:
    def process_data(self, data):
        return [item.lower() for item in data]

class DatabaseSaver:
    def save(self, data):
        print(f"  [SAVER]: Successfully saved {data} into MySQL Database!")

# The Composed Pipeline:
class DataPipeline:
    def __init__(self, extractor, transformer, saver):
        # The pipeline HAS an extractor, HAS a transformer, and HAS a saver:
        self.extractor = extractor
        self.transformer = transformer
        self.saver = saver

    def execute(self):
        print("Starting composed pipeline...")
        raw = self.extractor.get_data()
        clean = self.transformer.process_data(raw)
        self.saver.save(clean)

# We snap the pieces together like LEGO blocks:
pipeline = DataPipeline(
    extractor=FileExtractor(),
    transformer=DataTransformer(),
    saver=DatabaseSaver()
)
pipeline.execute()


# ==============================================================================
# 2. OPERATOR OVERLOADING (TEACHING OPERATORS NEW TRICKS)
# ==============================================================================
# Have you ever wondered why `+` adds numbers `5 + 10 = 15`,
# but also concatenates strings `"Data " + "Engineering"`?
#
# In Python, whenever you write `a + b`, Python secretly calls `a.__add__(b)`!
# You can teach your custom objects how to react to operators by overriding these dunder methods:
# - `+`  -> `__add__(self, other)`
# - `-`  -> `__sub__(self, other)`
# - `>`  -> `__gt__(self, other)` (Greater than)
# - `<`  -> `__lt__(self, other)` (Less than)

print("\n--- 2. OPERATOR OVERLOADING ---")

class Money:
    def __init__(self, amount, currency="INR"):
        self.amount = amount
        self.currency = currency

    # Teach Money objects how to add with `+`:
    def __add__(self, other):
        if isinstance(other, Money) and self.currency == other.currency:
            return Money(self.amount + other.amount, self.currency)
        raise ValueError("Cannot add different currencies!")

    # Teach Money objects how to compare with `>`:
    def __gt__(self, other):
        return self.amount > other.amount

    def __repr__(self):
        return f"Money({self.amount} {self.currency})"

wallet1 = Money(500, "INR")
wallet2 = Money(300, "INR")

total_wallet = wallet1 + wallet2 # Calls wallet1.__add__(wallet2)
print("wallet1 + wallet2:", total_wallet) # Money(800 INR)
print("Is wallet1 > wallet2?:", wallet1 > wallet2) # True!


# ==============================================================================
# 3. CONTEXT MANAGERS (__enter__ AND __exit__): NEVER LEAK RESOURCES!
# ==============================================================================
# In Python, you have probably used:
#   `with open("file.txt", "r") as f:`
#
# WHY is `with` so special?
# Because even if your program crashes or throws an error in the middle of reading,
# Python GUARANTEES that the file or database connection will be closed safely!
#
# How does `with` work behind the scenes?
# 1. When entering the `with` block -> Python calls `__enter__()`.
# 2. When leaving the `with` block (or if an error happens) -> Python calls `__exit__()`.

print("\n--- 3. CUSTOM CONTEXT MANAGER ---")

class SafeDatabaseSession:
    def __init__(self, db_name):
        self.db_name = db_name

    def __enter__(self):
        print(f"  [1. OPEN]: Connection to '{self.db_name}' opened.")
        return self # This is what gets assigned to `as db`

    def query(self, sql):
        print(f"  [2. QUERY]: Running '{sql}'...")
        return ["record1", "record2"]

    def __exit__(self, exc_type, exc_val, exc_tb):
        # This cleanup code is 100% GUARANTEED to run!
        print(f"  [3. CLOSE]: Connection to '{self.db_name}' closed safely.")
        return False # Propagate errors if any occurred

# Using our custom context manager:
with SafeDatabaseSession("analytics_warehouse") as db:
    data = db.query("SELECT * FROM fact_orders LIMIT 5;")
    print("  Inside block: Got data ->", data)

print("Outside block: Database connection is safely closed!")


# ==============================================================================
# 4. MEMORY OPTIMIZATION WITH __slots__ (BIG DATA SPEEDUP)
# ==============================================================================
# By default, Python creates an internal dictionary called `__dict__` for EVERY object
# you create, to store its variables.
#
# This makes Python flexible, but dictionaries consume a lot of RAM!
# If your data pipeline processes 1,000,000 records, storing 1,000,000 dictionaries
# can easily crash your server with an Out-of-Memory (OOM) error!
#
# THE FIX: `__slots__`
# By adding `__slots__ = ('col1', 'col2')` inside your class:
# - Python disables `__dict__`.
# - Python allocates a tiny, fixed-size memory array instead.
# - Saves 40% to 60% of memory and makes attribute access much faster!

print("\n--- 4. SAVING MEMORY WITH __slots__ ---")

class RegularRecord:
    def __init__(self, record_id, value):
        self.record_id = record_id
        self.value = value

class OptimizedRecord:
    # Tell Python exactly which attributes exist to eliminate __dict__:
    __slots__ = ("record_id", "value")

    def __init__(self, record_id, value):
        self.record_id = record_id
        self.value = value

reg = RegularRecord(101, "Sales Data")
opt = OptimizedRecord(101, "Sales Data")

print("Does RegularRecord have a memory-hungry __dict__?:", hasattr(reg, "__dict__")) # True
print("Does OptimizedRecord have a __dict__?:", hasattr(opt, "__dict__"))             # False (Slim & Fast!)


# ==============================================================================
# 5. CORE DESIGN PATTERNS (SOLVING COMMON ARCHITECTURE PROBLEMS)
# ==============================================================================

# ------------------------------------------------------------------------------
# Pattern A: THE SINGLETON PATTERN (Only ONE instance allowed!)
# Example: Database Connection Pool or Logging System.
# We don't want 50 different parts of our app creating 50 different connection pools.
# We want EVERYONE to share the EXACT same single pool!
# ------------------------------------------------------------------------------
print("\n--- 5A. SINGLETON PATTERN ---")

class DatabasePool:
    _instance = None # Class-level cache

    def __new__(cls):
        # __new__ is called BEFORE __init__ to allocate memory:
        if cls._instance is None:
            print("  [Creating]: Allocating the ONE and ONLY Database Pool...")
            cls._instance = super().__new__(cls)
        return cls._instance

pool_A = DatabasePool()
pool_B = DatabasePool()

print("Is pool_A the exact same object as pool_B?:", pool_A is pool_B) # True!


# ------------------------------------------------------------------------------
# Pattern B: THE FACTORY PATTERN (Object Creation Simplified)
# Example: You need a database connector, but depending on the user's input,
# you want to instantiate MySQL, Postgres, or Snowflake without messy `if-else` chains.
# ------------------------------------------------------------------------------
print("\n--- 5B. FACTORY PATTERN ---")

class MySQLClient:
    def connect(self):
        return "Connected to MySQL Database."

class PostgresClient:
    def connect(self):
        return "Connected to PostgreSQL Database."

class SnowflakeClient:
    def connect(self):
        return "Connected to Snowflake Cloud Warehouse."

# The Factory Class:
class DatabaseFactory:
    @staticmethod
    def get_database(db_type):
        db_type = db_type.lower()
        if db_type == "mysql":
            return MySQLClient()
        elif db_type == "postgres":
            return PostgresClient()
        elif db_type == "snowflake":
            return SnowflakeClient()
        else:
            raise ValueError(f"Unknown database type: {db_type}")

# Now our application code just asks the Factory for what it needs:
db_choice = "snowflake"
db_client = DatabaseFactory.get_database(db_choice)
print(f"Factory returned client: {db_client.connect()}")


# ==============================================================================
# 💡 SUMMARY CHEAT SHEET FOR PART 3
# ==============================================================================
# 1. Composition: Prefer assembling objects ("HAS-A") over deep inheritance ("IS-A").
# 2. Operator Overloading: Use `__add__`, `__sub__`, `__gt__` to make custom objects work with `+`, `-`, `>`.
# 3. Context Managers: Write `__enter__` and `__exit__` to make your classes safely work with `with`.
# 4. __slots__: Add `__slots__ = (...)` to eliminate `__dict__` and save up to 60% memory on large datasets.
# 5. Singleton: Overrides `__new__` so only one instance ever exists.
# 6. Factory: Uses a helper function/method to create objects based on inputs.
