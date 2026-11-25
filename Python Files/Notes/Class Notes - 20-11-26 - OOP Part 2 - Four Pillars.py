# ==============================================================================
# CLASS NOTES: PYTHON OOP - PART 2: THE 4 PILLARS OF OOP (EXHAUSTIVE GUIDE)
# Date: 20-11-2026
# ==============================================================================

# ------------------------------------------------------------------------------
# 🌟 THE BIG PICTURE: WHY DO THE 4 PILLARS EXIST?
# ------------------------------------------------------------------------------
# The 4 Pillars of Object-Oriented Programming (OOP) are design rules invented
# to solve 4 fundamental problems in software engineering:
#
# 1. ENCAPSULATION -> Solves the "Messy Data & Security" Problem.
#    (How do we bundle data together and stop outside code from corrupting it?)
#
# 2. INHERITANCE   -> Solves the "Code Duplication" Problem.
#    (How do we reuse existing code without copying and pasting?)
#
# 3. POLYMORPHISM  -> Solves the "Rigid Code & If-Else Explosion" Problem.
#    (How do we write flexible functions that work with multiple data types identically?)
#
# 4. ABSTRACTION   -> Solves the "Overwhelming Complexity & Architecture Chaos" Problem.
#    (How do we hide intricate inner workings and enforce architectural rules on teams?)


# ==============================================================================
# ==============================================================================
# PILLAR 1: ENCAPSULATION
# ==============================================================================
# ==============================================================================
#
# WHAT IS IT?
# Encapsulation is the bundling of data (variables) and the methods (functions)
# that act on that data into a single unit (a Class), while restricting direct
# outside access to the internal state.
#
# WHY DO WE USE IT?
# 1. Data Integrity: Prevents accidental modification (e.g. setting age = -5 or balance = -1000).
# 2. Security: Hides sensitive internal mechanics (API tokens, passwords, raw credentials).
# 3. Maintainability: You can change the internal implementation without breaking outside code!
#
# ------------------------------------------------------------------------------
# THE 3 ACCESS MODIFIERS IN PYTHON:
# ------------------------------------------------------------------------------
# Unlike C++ or Java which use rigid keywords (`public`, `private`, `protected`),
# Python uses NAMING CONVENTIONS with underscores:
#
# 1. PUBLIC ATTRIBUTES (e.g., `self.name`):
#    - No leading underscores.
#    - Accessible from anywhere: inside the class, subclasses, and from outside objects.
#    - Usage: General attributes meant for public reading and modification.
#
# 2. PROTECTED ATTRIBUTES (e.g., `self._database`):
#    - Single leading underscore (`_`).
#    - Python does NOT block access, but it is an official PEP 8 warning:
#      "Protected: Internal to this class and its subclasses. Do not touch from outside!"
#    - Usage: Internal helper variables, base configurations shared with subclasses.
#
# 3. PRIVATE ATTRIBUTES (e.g., `self.__password`):
#    - Double leading underscores (`__`), without trailing underscores.
#    - Python actively restricts direct outside access by NAME MANGLING.
#    - Usage: Critical credentials, passwords, cryptographic keys, internal states.

print("=" * 70)
print("--- PILLAR 1: ENCAPSULATION DEMONSTRATION ---")
print("=" * 70)

class BankAccount:
    """Demonstrates all 3 access levels and getter/setter encapsulation."""

    def __init__(self, account_holder, account_number, secret_pin, initial_balance=0.0):
        self.account_holder = account_holder     # 1. PUBLIC: Freely accessible
        self._account_number = account_number    # 2. PROTECTED: Internal/subclass use
        self.__secret_pin = secret_pin           # 3. PRIVATE: Hidden via Name Mangling
        self.__balance = initial_balance         # 3. PRIVATE: Protected money balance

    # --- PUBLIC GETTER METHODS (Controlled Read Access) ---
    def get_balance(self):
        """Allows read access to private balance."""
        return self.__balance

    # --- PUBLIC SETTER / ACTION METHODS (Controlled Write Access) ---
    def deposit(self, amount):
        """Validates input before mutating state."""
        if amount <= 0:
            print("  ❌ [REJECTED]: Deposit amount must be positive!")
            return False
        self.__balance += amount
        print(f"  ✅ [SUCCESS]: Deposited ${amount:,.2f}. New Balance: ${self.__balance:,.2f}")
        return True

    def withdraw(self, amount, entered_pin):
        """Enforces authentication and business rules before changing state."""
        if entered_pin != self.__secret_pin:
            print("  ❌ [SECURITY ALERT]: Invalid PIN! Withdrawal denied.")
            return False
        if amount > self.__balance:
            print("  ❌ [REJECTED]: Insufficient funds!")
            return False
        if amount <= 0:
            print("  ❌ [REJECTED]: Withdrawal amount must be positive!")
            return False

        self.__balance -= amount
        print(f"  ✅ [SUCCESS]: Withdrew ${amount:,.2f}. Remaining Balance: ${self.__balance:,.2f}")
        return True

# Testing Encapsulation:
acc = BankAccount("Wasim Akthar", "ACC-998877", secret_pin=1234, initial_balance=5000.0)

# 1. Public Access:
print("Public Holder Name:", acc.account_holder) # Wasim Akthar

# 2. Protected Access (Works, but IDEs and linters flag it as a warning):
print("Protected Account Number:", acc._account_number)

# 3. Private Access:
# Direct access fails with AttributeError!
try:
    print(acc.__secret_pin)
except AttributeError as err:
    print("Direct Private Access Blocked! Error:", err)

# 4. Safe Interaction through Encapsulated Methods:
acc.deposit(1500)
acc.withdraw(2000, entered_pin=9999) # Bad PIN -> Denied!
acc.withdraw(2000, entered_pin=1234) # Correct PIN -> Allowed!

# ------------------------------------------------------------------------------
# 💡 INTERVIEW DEEP-DIVE: NAME MANGLING UNDER THE HOOD
# ------------------------------------------------------------------------------
# Question: Does Python have truly private variables?
# Answer: NO! Python's philosophy is "We are all consenting adults here."
# When you define `__secret_pin`, Python internally renames (mangles) it to:
# `_ClassName__attributeName` -> `_BankAccount__secret_pin`.
# This is NOT for military-grade security; it was designed to PREVENT NAME CLASHES
# when subclasses override variables!
print("Bypassing private via mangled name:", acc._BankAccount__secret_pin) # 1234


# ==============================================================================
# ==============================================================================
# PILLAR 2: INHERITANCE
# ==============================================================================
# ==============================================================================
#
# WHAT IS IT?
# Inheritance allows a new class (Child / Derived / Subclass) to inherit
# attributes and methods from an existing class (Parent / Base / Superclass).
#
# WHY DO WE USE IT?
# 1. Eliminates Code Duplication (DRY Principle): Write logic once in the parent.
# 2. Extensibility: Add new features to child classes without altering parent code.
# 3. Establishes an "IS-A" Relationship (e.g. A `PostgresDB` IS-A `Database`).
#
# ------------------------------------------------------------------------------
# THE 5 TYPES OF INHERITANCE IN PYTHON:
# ------------------------------------------------------------------------------
# 1. Single Inheritance       : Child inherits from 1 Parent (A -> B).
# 2. Multi-Level Inheritance  : Hierarchy chain of inheritance (A -> B -> C).
# 3. Hierarchical Inheritance : Multiple Children inherit from 1 Parent (A -> B, A -> C).
# 4. Multiple Inheritance     : Child inherits from MULTIPLE Parents (A, B -> C).
# 5. Hybrid Inheritance       : A combination of two or more of the above!

print("\n" + "=" * 70)
print("--- PILLAR 2: THE 5 TYPES OF INHERITANCE ---")
print("=" * 70)

# ------------------------------------------------------------------------------
# TYPE 1: SINGLE INHERITANCE (One Parent -> One Child)
# ------------------------------------------------------------------------------
print("\n--- TYPE 1: SINGLE INHERITANCE ---")

class Database:
    def __init__(self, host, port):
        self.host = host
        self.port = port
        self.is_connected = False

    def connect(self):
        self.is_connected = True
        return f"Connected to generic database at {self.host}:{self.port}"

class MySQLDatabase(Database): # Child inherits from Database
    def __init__(self, host, port, schema):
        # super() calls the Parent's __init__ method!
        super().__init__(host, port)
        self.schema = schema

    def execute_query(self, query):
        return f"Executing '{query}' on MySQL schema '{self.schema}'."

mysql = MySQLDatabase("localhost", 3306, "analytics")
print("Inherited method:", mysql.connect())
print("Child specific method:", mysql.execute_query("SELECT * FROM users;"))


# ------------------------------------------------------------------------------
# TYPE 2: MULTI-LEVEL INHERITANCE (Grandparent -> Parent -> Child)
# ------------------------------------------------------------------------------
print("\n--- TYPE 2: MULTI-LEVEL INHERITANCE ---")

class BaseComponent: # Level 1 (Grandparent)
    def __init__(self, component_id):
        self.component_id = component_id

    def health_check(self):
        return f"Component [{self.component_id}]: Healthy."

class IngestionSource(BaseComponent): # Level 2 (Parent)
    def __init__(self, component_id, protocol):
        super().__init__(component_id)
        self.protocol = protocol

    def read_stream(self):
        return f"Reading stream via {self.protocol}."

class KafkaIngestion(IngestionSource): # Level 3 (Child)
    def __init__(self, component_id, topic_name):
        # Passes up the chain to IngestionSource which passes to BaseComponent:
        super().__init__(component_id, protocol="Kafka_Brokers")
        self.topic_name = topic_name

    def poll_topic(self):
        return f"Polling messages from Kafka topic: '{self.topic_name}'."

kafka = KafkaIngestion("INGEST_001", "telemetry_events")
print("Grandparent method:", kafka.health_check())
print("Parent method:", kafka.read_stream())
print("Child method:", kafka.poll_topic())


# ------------------------------------------------------------------------------
# TYPE 3: HIERARCHICAL INHERITANCE (One Parent -> Multiple Children)
# ------------------------------------------------------------------------------
print("\n--- TYPE 3: HIERARCHICAL INHERITANCE ---")

class CloudStorage: # Single Parent
    def __init__(self, bucket_name):
        self.bucket_name = bucket_name

    def base_uri(self):
        return f"storage://{self.bucket_name}"

class AWSS3(CloudStorage): # Child 1
    def generate_s3_url(self):
        return f"https://s3.amazonaws.com/{self.bucket_name}"

class GoogleGCS(CloudStorage): # Child 2
    def generate_gcs_url(self):
        return f"https://storage.googleapis.com/{self.bucket_name}"

s3_obj = AWSS3("bronze-data-lake")
gcs_obj = GoogleGCS("gold-analytics-lake")
print("S3 URL:", s3_obj.generate_s3_url())
print("GCS URL:", gcs_obj.generate_gcs_url())


# ------------------------------------------------------------------------------
# TYPE 4: MULTIPLE INHERITANCE & MRO (Multiple Parents -> One Child)
# ------------------------------------------------------------------------------
# A class inherits from 2 or more distinct parent classes!
# Python solves the famous "Diamond Problem" using the C3 LINEARIZATION ALGORITHM (MRO).

print("\n--- TYPE 4: MULTIPLE INHERITANCE & MRO ---")

class AuditLogger: # Parent 1
    def log_action(self, action):
        print(f"  [AUDIT LOG]: Action '{action}' recorded.")

class NotificationService: # Parent 2
    def send_alert(self, msg):
        print(f"  [ALERT]: Notification sent: '{msg}'.")

# Child inheriting from BOTH parents:
class ProductionPipelineTask(AuditLogger, NotificationService):
    def run_task(self, task_name):
        print(f"Executing pipeline task: '{task_name}'")
        self.log_action(task_name)                         # Inherited from Parent 1
        self.send_alert(f"Task '{task_name}' completed.") # Inherited from Parent 2

prod_task = ProductionPipelineTask()
prod_task.run_task("DEDUPLICATE_ORDERS")

# ------------------------------------------------------------------------------
# 💡 INTERVIEW DEEP-DIVE: METHOD RESOLUTION ORDER (MRO)
# ------------------------------------------------------------------------------
# Question: If both Parent 1 and Parent 2 have a method with the SAME name,
# which one runs?
# Answer: Python searches in order: Child -> Parent1 -> Parent2 -> object.
# You can inspect the MRO anytime using `ClassName.__mro__`:
print("\nProductionPipelineTask MRO Resolution:")
for idx, c in enumerate(ProductionPipelineTask.__mro__, start=1):
    print(f"  Step {idx}: {c.__name__}")


# ==============================================================================
# ==============================================================================
# PILLAR 3: POLYMORPHISM
# ==============================================================================
# ==============================================================================
#
# WHAT IS IT?
# "Poly" = Many, "Morph" = Forms.
# Polymorphism allows different classes to define methods with the EXACT SAME NAME,
# so that a single unified interface can trigger different behaviors based on the object.
#
# WHY DO WE USE IT?
# 1. Eliminates Giant If-Else Ladders:
#    Without polymorphism: `if type == 'csv': read_csv() elif type == 'db': read_db()...`
#    With polymorphism: `source.read()` works for ANY source!
# 2. Extensibility: Add 10 new data connectors without touching existing pipeline code!
#
# ------------------------------------------------------------------------------
# THE 3 TYPES OF POLYMORPHISM IN PYTHON:
# ------------------------------------------------------------------------------
# 1. Method Overriding (Runtime Polymorphism): Child redefines a parent's method.
# 2. Duck Typing ("Dynamic Polymorphism"): Python checks for methods, NOT class types.
# 3. Operator Overloading: Custom classes responding to built-in operators (`+`, `*`, `==`).

print("\n" + "=" * 70)
print("--- PILLAR 3: POLYMORPHISM DEMONSTRATION ---")
print("=" * 70)

# ------------------------------------------------------------------------------
# TYPE 1: METHOD OVERRIDING (Inheritance-based Polymorphism)
# ------------------------------------------------------------------------------
print("\n--- TYPE 1: METHOD OVERRIDING ---")

class DataExporter:
    def export(self, data):
        """Default base implementation."""
        print(f"Exporting raw data: {data}")

class CSVExporter(DataExporter):
    def export(self, data):
        # Overrides parent's export method with CSV logic:
        formatted = ",".join(str(x) for x in data)
        print(f"  [CSV Exporter]: Writing comma-delimited row: '{formatted}'")

class JSONExporter(DataExporter):
    def export(self, data):
        # Overrides parent's export method with JSON logic:
        print(f"  [JSON Exporter]: Formatting as JSON array: {data}")

# Polymorphic Execution:
exporters = [CSVExporter(), JSONExporter()]
sample_records = [101, "Wasim", 95000]

for exp in exporters:
    exp.export(sample_records) # Exact same method name, different behavior!


# ------------------------------------------------------------------------------
# TYPE 2: DUCK TYPING (The Soul of Python)
# ------------------------------------------------------------------------------
# "If it walks like a duck and quacks like a duck, it's a duck."
# In Python, two classes DO NOT need to inherit from each other!
# As long as both classes have a method called `process()`, Python treats them interchangeably.

print("\n--- TYPE 2: DUCK TYPING ---")

class SparkProcessor:
    def process(self, batch):
        return f"Spark distributed processing on {len(batch)} items."

class PandasProcessor:
    def process(self, batch):
        return f"Pandas in-memory DataFrame processing on {len(batch)} items."

class SQLProcessor:
    def process(self, batch):
        return f"SQL pushdown query processing on {len(batch)} items."

# A generic runner that accepts ANY object with a `process()` method:
def execute_batch(engine, data):
    # Notice: No `isinstance()` checks! Duck typing in action!
    print("Engine result:", engine.process(data))

batch_data = [1, 2, 3, 4, 5]
execute_batch(SparkProcessor(), batch_data)
execute_batch(PandasProcessor(), batch_data)
execute_batch(SQLProcessor(), batch_data)


# ------------------------------------------------------------------------------
# TYPE 3: OPERATOR OVERLOADING (Polymorphism via Dunder Methods)
# ------------------------------------------------------------------------------
print("\n--- TYPE 3: OPERATOR OVERLOADING ---")

class FileChunk:
    def __init__(self, size_mb):
        self.size_mb = size_mb

    # Polymorphic behavior for the `+` operator:
    def __add__(self, other):
        if isinstance(other, FileChunk):
            return FileChunk(self.size_mb + other.size_mb)
        return NotImplemented

    def __repr__(self):
        return f"FileChunk({self.size_mb} MB)"

chunk1 = FileChunk(250)
chunk2 = FileChunk(400)
merged_chunk = chunk1 + chunk2 # Python polymorphic + dispatch
print("chunk1 + chunk2:", merged_chunk)


# ==============================================================================
# ==============================================================================
# PILLAR 4: ABSTRACTION
# ==============================================================================
# ==============================================================================
#
# WHAT IS IT?
# Abstraction is the practice of hiding the complex internal implementation
# details and exposing ONLY the essential, high-level features/interfaces.
#
# WHY DO WE USE IT?
# 1. Reduces Cognitive Load: Users don't need to know HOW a motor works to drive a car.
# 2. Team Architecture Enforcement (Contracts): Senior architects define blueprints
#    with `@abstractmethod`. Developers MUST implement those methods, or Python crashes!
# 3. Design Patterns: Foundation for the Template Method, Factory, and Strategy patterns.
#
# ------------------------------------------------------------------------------
# HOW ABSTRACTION IS IMPLEMENTED IN PYTHON:
# ------------------------------------------------------------------------------
# Python provides the built-in `abc` (Abstract Base Class) module:
# - Inherit from `ABC`.
# - Use the `@abstractmethod` decorator.
# - Concrete subclasses MUST override all abstract methods before instantiation!

print("\n" + "=" * 70)
print("--- PILLAR 4: ABSTRACTION (abc MODULE) ---")
print("=" * 70)

from abc import ABC, abstractmethod

# THE ABSTRACT CONTRACT (Architecture Blueprint):
class BaseDataConnector(ABC):
    def __init__(self, connection_string):
        self.connection_string = connection_string

    # 1. Abstract Method: Subclasses MUST build this!
    @abstractmethod
    def open_connection(self):
        """Open network connection to source."""
        pass

    # 2. Abstract Method: Subclasses MUST build this!
    @abstractmethod
    def fetch_data(self, query):
        """Fetch records from source."""
        pass

    # 3. Abstract Method: Subclasses MUST build this!
    @abstractmethod
    def close_connection(self):
        """Safely disconnect."""
        pass

    # 4. Concrete Method: Shared pre-built workflow for ALL connectors!
    # (Design Pattern: Template Method Pattern)
    def query_and_disconnect(self, query):
        """Standard execution template implemented in base class."""
        self.open_connection()
        records = self.fetch_data(query)
        self.close_connection()
        return records

# ⚠️ Attempting to instantiate the Abstract Base Class directly raises TypeError:
try:
    bad_obj = BaseDataConnector("sqlite:///")
except TypeError as err:
    print("Cannot instantiate Abstract Base Class! Error:\n ", err)

# Concrete Implementation 1: Postgres Connector
class PostgresConnector(BaseDataConnector):
    def open_connection(self):
        print(f"  [Postgres]: Socket opened to {self.connection_string}")

    def fetch_data(self, query):
        print(f"  [Postgres]: Executing '{query}'...")
        return [{"id": 1, "status": "COMPLETED"}]

    def close_connection(self):
        print("  [Postgres]: Socket closed.")

# Concrete Implementation 2: Snowflake Connector
class SnowflakeConnector(BaseDataConnector):
    def open_connection(self):
        print(f"  [Snowflake]: Cloud session authenticated for {self.connection_string}")

    def fetch_data(self, query):
        print(f"  [Snowflake]: Cloud warehouse running query '{query}'...")
        return [{"id": 101, "revenue": 450000}]

    def close_connection(self):
        print("  [Snowflake]: Cloud warehouse session closed.")

print("\nTesting Concrete Postgres Connector via Template Method:")
pg = PostgresConnector("postgresql://localhost:5432/dw")
pg_data = pg.query_and_disconnect("SELECT * FROM dim_users;")
print("  Returned:", pg_data)

print("\nTesting Concrete Snowflake Connector via Template Method:")
sf = SnowflakeConnector("snowflake://account.region/warehouse")
sf_data = sf.query_and_disconnect("SELECT SUM(sales) FROM fact_orders;")
print("  Returned:", sf_data)


# ==============================================================================
# ==============================================================================
# 💡 MASTER CHEAT SHEET: THE 4 PILLARS QUICK COMPARISON
# ==============================================================================
# ==============================================================================
#
# Pillar        | Core Concept                  | Python Syntax / Tool         | Real-World Metaphor
# ------------- | ----------------------------- | ---------------------------- | -----------------------------
# Encapsulation | Data privacy & bundling       | `self._prot`, `self.__priv`  | Capsule holding medicine / ATM PIN
# Inheritance   | Code reuse ("IS-A")           | `class Child(Parent):`       | Child inheriting traits from Parent
# Polymorphism  | Many forms, same method name  | Method overriding, Duck Type | Universal TV remote / USB-C cable
# Abstraction   | Hiding complexity & contracts | `abc.ABC`, `@abstractmethod` | Car dashboard (pedals & steering)
#
# Summary Checklist for Technical Interviews:
# 1. Encapsulation: Python uses Name Mangling (`_Class__attr`), not true private memory locks.
# 2. Inheritance: Use `super().__init__()` to delegate constructor calls; MRO uses C3 Linearization.
# 3. Polymorphism: Python prioritizes Duck Typing ("if it quacks like a duck") over explicit interfaces.
# 4. Abstraction: Classes with `@abstractmethod` CANNOT be instantiated directly.
