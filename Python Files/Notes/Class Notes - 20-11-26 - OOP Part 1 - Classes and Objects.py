# ==============================================================================
# CLASS NOTES: PYTHON OOP - PART 1: CLASSES, OBJECTS, ATTRIBUTES & METHODS
# Date: 20-11-2026
# ==============================================================================

# ------------------------------------------------------------------------------
# 🌟 BEGINNER'S ANALOGY: WHAT IS OBJECT-ORIENTED PROGRAMMING (OOP)?
# ------------------------------------------------------------------------------
# So far, we have learned:
# - Variables: to store single values (name = "Wasim", age = 25)
# - Data types: lists, tuples, sets, dictionaries to hold collections of values
# - Functions: to perform actions and avoid repeating code
#
# But in real life, things aren't just isolated numbers or functions!
# Think of a Car, a Bank Account, or a Student:
# - A Student has ATTRIBUTES (Data): name, roll_number, marks, email.
# - A Student has BEHAVIORS (Actions/Methods): study(), take_exam(), pay_fees().
#
# OOP allows us to create our OWN custom data types that bundle both
# DATA (Variables/Attributes) and ACTIONS (Functions/Methods) together into one place!


# ==============================================================================
# 1. CLASS vs. OBJECT (THE COOKIE CUTTER & COOKIE ANALOGY)
# ==============================================================================
# - CLASS  = The blueprint / cookie cutter / architectural floor plan.
#            It does not occupy memory for actual data; it just defines the shape!
# - OBJECT = The actual cookie / physical house built using that blueprint.
#            You can build 100 different houses (objects) from 1 single blueprint (class)!
#
# Naming Convention: Class names always use PascalCase (e.g., StudentProfile, Car).

print("--- 1. CLASS BLUEPRINT & OBJECTS ---")

# Step 1: Define the Blueprint (Class)
class Student:
    """A simple blueprint representing a student."""
    pass

# Step 2: Create real objects (instances) from the blueprint:
student1 = Student()
student2 = Student()

print("student1 object in memory:", student1)
print("student2 object in memory:", student2)
print("Are student1 and student2 the exact same object?:", student1 is student2) # False!
# Even though they came from the same blueprint, they are two separate objects in RAM!


# ==============================================================================
# 2. THE CONSTRUCTOR: __init__() AND THE `self` PARAMETER
# ==============================================================================
# When you buy a new phone, it gets configured out of the box with your SIM and name.
# In Python, `__init__()` is the CONSTRUCTOR (Initializer):
# - It runs AUTOMATICALLY every time you create a new object.
# - It assigns initial values (attributes) to that specific object.
#
# WHAT IS `self`?
# - `self` represents the CURRENT object being created or used!
# - When student1 calls a method, `self` refers to student1.
# - When student2 calls a method, `self` refers to student2.
# - You must always write `self` as the first parameter in class methods!

print("\n--- 2. CONSTRUCTOR (__init__) & self ---")

class StudentRecord:
    # The constructor:
    def __init__(self, name, student_id, course="Data Engineering"):
        # self.attribute_name = value
        self.name = name           # "This student's name is name"
        self.student_id = student_id # "This student's ID is student_id"
        self.course = course       # Default value if not provided
        self.marks = []            # Every new student starts with an empty marks list!
        print(f"  [Created]: New student profile for '{self.name}' (ID: {self.student_id})")

    # An Instance Method (Action that a student can do):
    def add_mark(self, score):
        self.marks.append(score)
        print(f"  Added score {score} for {self.name}.")

    def calculate_average(self):
        if len(self.marks) == 0:
            return 0
        return sum(self.marks) / len(self.marks)

# Creating concrete students:
s1 = StudentRecord("Wasim", 101)
s2 = StudentRecord("Arun", 102)

# Performing actions on specific objects:
s1.add_mark(90)
s1.add_mark(80)
s2.add_mark(70)

print(f"{s1.name}'s Average Marks: {s1.calculate_average()}") # 85.0
print(f"{s2.name}'s Average Marks: {s2.calculate_average()}") # 70.0

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES TO REMEMBER (__init__ and self):
# ------------------------------------------------------------------------------
# 1. Why does Python need `self` explicitly?
#    - When you call `s1.calculate_average()`, Python internally converts it to:
#      `StudentRecord.calculate_average(s1)`.
#      The `self` parameter is how Python knows WHICH student's marks to calculate!
# 2. Can __init__ return something?
#    - NO! `__init__()` must always return `None`. If you write `return "done"`,
#      Python raises a `TypeError: __init__() should return None`.


# ==============================================================================
# 3. CLASS ATTRIBUTES vs. INSTANCE ATTRIBUTES
# ==============================================================================
# Analogy:
# - Instance Attribute = Your personal smartphone (each student has their own unique one).
# - Class Attribute    = The classroom ceiling fan or institute name (shared by all students in the room!).

print("\n--- 3. CLASS vs. INSTANCE ATTRIBUTES ---")

class InstituteStudent:
    # 🏫 CLASS ATTRIBUTE: Shared by EVERY student in the institute
    institute_name = "Data Engineering Academy"
    total_enrolled = 0

    def __init__(self, name):
        # 👤 INSTANCE ATTRIBUTE: Unique to this individual student
        self.name = name
        
        # Increment the shared counter every time someone joins:
        InstituteStudent.total_enrolled += 1

stud_A = InstituteStudent("Wasim")
stud_B = InstituteStudent("Priya")

print(f"{stud_A.name} studies at: {stud_A.institute_name}")
print(f"{stud_B.name} studies at: {stud_B.institute_name}")
print(f"Total students enrolled in academy: {InstituteStudent.total_enrolled}") # 2

# ⚠️ BEWARE OF THE SHADOWING TRAP:
# If you write `stud_A.institute_name = 'Tech School'`, you DO NOT change the institute
# for Priya! You just gave stud_A a private variable that overrides the shared one!
stud_A.institute_name = "Tech School"
print(f"\nAfter override -> stud_A: {stud_A.institute_name} | stud_B: {stud_B.institute_name}")
print(f"Class level untouched: {InstituteStudent.institute_name}")


# ==============================================================================
# 4. THE THREE TYPES OF METHODS (INSTANCE, CLASS, STATIC)
# ==============================================================================
# 1. Instance Method (`def action(self):`):
#    - Standard method. Operates on individual object data (uses `self`).
#
# 2. Class Method (`@classmethod` with `def action(cls):`):
#    - Operates on the whole CLASS (uses `cls`).
#    - Often used as "Alternative Constructors" (e.g. creating an object from a CSV string).
#
# 3. Static Method (`@staticmethod` with `def action():`):
#    - A simple utility function that belongs inside the class for neat organization.
#    - Does NOT access `self` or `cls`.

print("\n--- 4. THE THREE METHOD TYPES ---")

class Employee:
    standard_bonus_percent = 10 # Class attribute

    def __init__(self, name, salary):
        self.name = name
        self.salary = salary

    # 1. Instance Method: Needs `self` to know the employee's salary
    def calculate_annual_income(self):
        return self.salary * 12

    # 2. Class Method: Alternative constructor (takes `cls` instead of `self`)
    @classmethod
    def from_string(cls, emp_str):
        """Creates an Employee object from a comma-separated string: 'Name,Salary'"""
        name, sal = emp_str.split(",")
        return cls(name.strip(), float(sal.strip())) # Calls Employee(name, sal)

    # 3. Static Method: General utility helper (doesn't care about specific employee or class)
    @staticmethod
    def is_valid_salary(amount):
        return amount > 0

# Using Instance Method:
e1 = Employee("Wasim", 8000)
print(f"{e1.name}'s Annual Income: ${e1.calculate_annual_income():,}")

# Using Class Method to create an object directly from raw string:
raw_record = "Arun, 9500"
e2 = Employee.from_string(raw_record)
print(f"Created via classmethod: {e2.name} earning ${e2.salary:,}")

# Using Static Method:
print("Is -500 a valid salary?:", Employee.is_valid_salary(-500)) # False
print("Is 8000 a valid salary?:", Employee.is_valid_salary(8000)) # True


# ==============================================================================
# 5. DUNDER (MAGIC) METHODS: MAKING YOUR OBJECTS SMART
# ==============================================================================
# "Dunder" stands for "Double Underscore" (__method__).
# Magic methods are NOT called directly (like `obj.__len__()`).
# Instead, Python invokes them AUTOMATICALLY under the hood when you use built-in
# syntax, operators, or functions:
#
#   You write in Python:        Python secretly executes:
#   ─────────────────────────────────────────────────────────────
#   len(cart)             ───>  cart.__len__()
#   print(cart)           ───>  cart.__str__()
#   cart[0]               ───>  cart.__getitem__(0)
#   "Laptop" in cart      ───>  cart.__contains__("Laptop")
#   cart1 == cart2        ───>  cart1.__eq__(cart2)
#   cart1 < cart2         ───>  cart1.__lt__(cart2)
#   cart1 + cart2         ───>  cart1.__add__(cart2)
#   for item in cart:     ───>  iter(cart) -> cart.__iter__()
#   cart("discount10")    ───>  cart.__call__("discount10")
#
# ------------------------------------------------------------------------------
# CORE DUNDER METHOD CATEGORIES & PROTOCOLS:
# ------------------------------------------------------------------------------
# 1. String Representation:
#    - `__str__`  : Human-friendly text for `print()` and `str()`.
#    - `__repr__` : Unambiguous developer representation for debuggers and lists.
# 2. Container & Sequence Protocol:
#    - `__len__`      : Size for `len()`.
#    - `__getitem__`  : Bracket lookup (`obj[i]`) and slicing (`obj[1:3]`).
#    - `__setitem__`  : Bracket assignment (`obj[i] = val`).
#    - `__contains__` : Membership test (`val in obj`).
# 3. Iteration Protocol:
#    - `__iter__` : Makes your custom class loopable in `for ... in obj:`.
# 4. Rich Comparisons:
#    - `__eq__` : Equality (`==`).
#    - `__lt__` : Less-than (`<`), enables native `sorted([obj1, obj2])`.
# 5. Arithmetic & Operator Overloading:
#    - `__add__` : Plus operator (`obj1 + obj2`).
# 6. Callable Objects:
#    - `__call__` : Allows instances to be called like functions (`obj(arg)`).

print("\n--- 5. MAGIC DUNDER METHODS IN DEPTH ---")

class SmartCart:
    """An advanced container demonstrating core magic dunder protocols."""

    def __init__(self, customer_name, items=None):
        self.customer_name = customer_name
        self.items = list(items) if items else []

    def add_item(self, item_name):
        self.items.append(item_name)

    # --------------------------------------------------------------------------
    # 1. String Representations: __str__ vs __repr__
    # --------------------------------------------------------------------------
    def __str__(self):
        """Human-friendly summary shown by print(cart) or str(cart)."""
        return f"{self.customer_name}'s Cart ({len(self.items)} items)"

    def __repr__(self):
        """Unambiguous developer display (used in debuggers and lists)."""
        return f"SmartCart(customer_name='{self.customer_name}', items={self.items!r})"

    # --------------------------------------------------------------------------
    # 2. Container & Truthiness Protocol: __len__, __getitem__, __setitem__, __delitem__, __contains__, __bool__
    # --------------------------------------------------------------------------
    def __len__(self):
        """Allows len(cart). Also used by bool(cart) if __bool__ isn't defined."""
        return len(self.items)

    def __getitem__(self, index):
        """Allows cart[0] bracket access AND cart[0:2] slicing!"""
        return self.items[index]

    def __setitem__(self, index, value):
        """Allows cart[0] = 'Tablet' in-place modification."""
        self.items[index] = value

    def __delitem__(self, index):
        """Allows del cart[0] deletion."""
        del self.items[index]

    def __contains__(self, item):
        """Allows 'Laptop' in cart (O(n) list check or custom O(1) hash check)."""
        return item in self.items

    def __bool__(self):
        """Custom truthiness for if cart: (True if cart has at least 1 item)."""
        return len(self.items) > 0

    # --------------------------------------------------------------------------
    # 3. Iteration Protocol: __iter__
    # --------------------------------------------------------------------------
    def __iter__(self):
        """Makes the object directly iterable: `for item in cart:`"""
        return iter(self.items)

    # --------------------------------------------------------------------------
    # 4. Rich Comparisons: __eq__ and __lt__
    # --------------------------------------------------------------------------
    def __eq__(self, other):
        """Compares carts based on contents rather than memory IDs."""
        if isinstance(other, SmartCart):
            return sorted(self.items) == sorted(other.items)
        return False

    def __lt__(self, other):
        """Allows comparing carts by item count (enables sorted() functionality!)."""
        if isinstance(other, SmartCart):
            return len(self.items) < len(other.items)
        return NotImplemented

    # --------------------------------------------------------------------------
    # 5. Operator Overloading: __add__
    # --------------------------------------------------------------------------
    def __add__(self, other):
        """Combines two carts into a new merged cart using the '+' operator."""
        if isinstance(other, SmartCart):
            merged_customer = f"{self.customer_name} & {other.customer_name}"
            return SmartCart(merged_customer, self.items + other.items)
        return NotImplemented

    # --------------------------------------------------------------------------
    # 6. Callable Objects: __call__
    # --------------------------------------------------------------------------
    def __call__(self, discount_code):
        """Allows instance to be called directly: cart('SUMMER50')."""
        return f"Applied discount coupon '{discount_code}' to {self.customer_name}'s Cart!"


# --- Practical Demonstration ---

cart1 = SmartCart("Wasim", ["Laptop", "Mouse"])
cart2 = SmartCart("Arun", ["Keyboard", "Monitor", "Headphones"])

# 1. Testing __str__ and __repr__:
print("print(cart1)   [__str__] :", cart1)
print("repr(cart1)    [__repr__]:", repr(cart1))
print("Inside a list  [__repr__]:", [cart1, cart2])

# 2. Testing Container Protocol (__len__, __getitem__, __contains__):
print("len(cart1)     [__len__] :", len(cart1))
print("cart1[0]       [__getitem__]:", cart1[0])
print("cart1[0:2]     [slice]   :", cart1[0:2])
print("Is 'Mouse' in cart1? [__contains__]:", "Mouse" in cart1)
print("Is 'Phone' in cart1? [__contains__]:", "Phone" in cart1)

# Mutating an item with __setitem__:
cart1[1] = "Wireless Mouse"
print("After cart1[1] = 'Wireless Mouse':", cart1.items)

# Deleting an item with __delitem__:
del cart1[1]
print("After del cart1[1] [__delitem__]:", cart1.items)
cart1.add_item("Wireless Mouse") # Re-add for remaining tests

# Testing Truthiness with __bool__:
empty_cart = SmartCart("Empty User")
print("bool(cart1)      [__bool__]:", bool(cart1))      # True (has items)
print("bool(empty_cart) [__bool__]:", bool(empty_cart)) # False (0 items)

# 3. Testing Iteration Protocol (__iter__):
print("Iterating over cart1 directly with `for item in cart1`:")
for item in cart1:
    print(f"  - Item: {item}")

# 4. Testing Comparisons & Sorting (__eq__, __lt__):
cart_duplicate = SmartCart("Wasim Twin", ["Wireless Mouse", "Laptop"])
print("cart1 == cart_duplicate [__eq__]:", cart1 == cart_duplicate) # True (same items)
print("cart1 < cart2            [__lt__]:", cart1 < cart2)            # True (2 items < 3 items)

# Sorting a list of carts using __lt__:
sorted_carts = sorted([cart2, cart1]) # Sorts smallest cart to largest!
print("Sorted carts by size:", [c.customer_name for c in sorted_carts])

# 5. Testing Operator Overloading (+ via __add__):
merged_cart = cart1 + cart2
print("cart1 + cart2  [__add__] :", merged_cart)
print("Merged items             :", merged_cart.items)

# 6. Testing Callable Objects (__call__):
print("cart1('SAVE20') [__call__]:", cart1("SAVE20"))

# ------------------------------------------------------------------------------
# 💡 INTERVIEW NOTES & BEST PRACTICES FOR MAGIC DUNDER METHODS:
# ------------------------------------------------------------------------------
# 1. Never invoke dunder methods directly:
#    Always prefer `len(obj)` over `obj.__len__()`. Python optimizes `len()`
#    at the C-level (reading ob_size in CPython struct in O(1) time).
# 2. The __str__ vs __repr__ Rule:
#    "If you only implement one, implement __repr__."
#    If __str__ is missing, Python falls back to __repr__.
# 3. The __hash__ and __eq__ Relationship:
#    If you override `__eq__`, Python automatically sets `__hash__ = None` to
#    prevent mutable objects from corrupting hash tables (sets/dicts).
#    If your object is immutable and needs to be used in sets or dict keys,
#    you MUST explicitly implement `def __hash__(self): return hash(...)`.
# 4. Returning NotImplemented:
#    In operators like `__add__` and `__lt__`, return `NotImplemented` instead
#    of raising `TypeError`. This allows Python to try the reflected method
#    (e.g., `other.__radd__(self)`) before throwing an error.
# 5. Full Curriculum Cross-Reference for Dunder Methods:
#    - Part 1 (This File): __init__, __str__, __repr__, __len__, __getitem__,
#      __setitem__, __delitem__, __contains__, __bool__, __iter__, __eq__, __lt__,
#      __add__, __call__.
#    - Part 2 (Four Pillars): Name Mangling (__private_var) in Encapsulation,
#      __mro__ in Inheritance, Operator Overloading (__add__) in Polymorphism.
#    - Part 3 (Advanced OOP): Memory optimization via __slots__, resource management
#      via Context Managers (__enter__ and __exit__), and Singleton instance
#      allocation via __new__.


# ==============================================================================
# 6. PROPERTY DECORATORS (@property): CLEAN GETTERS AND SETTERS
# ==============================================================================
# Imagine you have a `BankBalance`. You don't want anyone to do:
# `account.balance = -1000` (Negative balance shouldn't be allowed!).
#
# In other languages like Java, you had to write awkward methods like:
# `account.getBalance()` and `account.setBalance(value)`.
#
# In Python, we use `@property`! It looks and behaves like an ordinary variable:
# `account.balance = 500`
# But behind the scenes, Python runs a validation function to protect your data!

print("\n--- 6. PROPERTY DECORATORS ---")

class BankAccount:
    def __init__(self, account_holder, initial_deposit):
        self.account_holder = account_holder
        self._balance = initial_deposit # Single underscore: internal variable

    # GETTER: Allows reading `account.balance`
    @property
    def balance(self):
        return self._balance

    # SETTER: Runs validation when someone types `account.balance = new_amount`
    @balance.setter
    def balance(self, new_amount):
        if new_amount < 0:
            print("  ❌ ERROR: Balance cannot be negative! Transaction rejected.")
        else:
            self._balance = new_amount
            print(f"  ✅ Updated balance: ${self._balance:,}")

account = BankAccount("Wasim", 5000)
print(f"Current Balance for {account.account_holder}: ${account.balance:,}")

# Depositing money:
account.balance = 7000 # Triggers the setter cleanly!

# Trying to set an invalid balance:
account.balance = -200 # Rejected by validation!
print(f"Balance remained safe at: ${account.balance:,}")


# ==============================================================================
# 7. BEGINNER'S REAL-WORLD DATA ENGINEERING EXAMPLE: BATCH PROCESSOR
# ==============================================================================
# Bringing it all together: How Data Engineers use classes to clean dirty data!

print("\n--- 7. DATA ENGINEERING BATCH CLEANER CLASS ---")

class DataCleaner:
    def __init__(self, table_name):
        self.table_name = table_name
        self.cleaned_rows = []

    def clean_records(self, raw_data):
        """Cleans a list of messy text strings."""
        print(f"Cleaning {len(raw_data)} records for table '{self.table_name}'...")
        for row in raw_data:
            # Drop empty rows and strip whitespace:
            if row and row.strip():
                clean_text = row.strip().upper()
                self.cleaned_rows.append(clean_text)
        return self.cleaned_rows

    def print_summary(self):
        print(f"Table '{self.table_name}' Cleaned Total: {len(self.cleaned_rows)} rows.")
        for idx, row in enumerate(self.cleaned_rows, start=1):
            print(f"  Row {idx}: {row}")

# Messy input data from a web log or CSV:
raw_log_data = ["  order_101 ", "", "  order_102  ", "   ", "order_103\n"]

cleaner = DataCleaner("fact_orders")
cleaner.clean_records(raw_log_data)
cleaner.print_summary()
