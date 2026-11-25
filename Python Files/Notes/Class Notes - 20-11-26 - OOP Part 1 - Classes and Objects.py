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
# Have you ever wondered why `print([1, 2, 3])` prints nicely, or `len([1, 2])` works?
# Because Python uses Dunder Methods ("Double Underscore") under the hood!
#
# You can give your own custom objects superpowers:
# - `__str__`  : What should `print(my_object)` show to human users?
# - `__repr__` : What should developers see in debuggers?
# - `__len__`  : What should `len(my_object)` return?
# - `__eq__`   : What does `obj1 == obj2` mean?

print("\n--- 5. MAGIC DUNDER METHODS ---")

class ShoppingCart:
    def __init__(self, customer_name):
        self.customer_name = customer_name
        self.items = []

    def add_item(self, item_name):
        self.items.append(item_name)

    # 1. Human-friendly display for print():
    def __str__(self):
        return f"{self.customer_name}'s Cart with {len(self.items)} items"

    # 2. Technical representation for developers:
    def __repr__(self):
        return f"ShoppingCart(customer_name='{self.customer_name}', items={self.items})"

    # 3. Makes len(my_cart) work:
    def __len__(self):
        return len(self.items)

    # 4. Makes cart1 == cart2 compare the items inside:
    def __eq__(self, other):
        if isinstance(other, ShoppingCart):
            return self.items == other.items
        return False

cart1 = ShoppingCart("Wasim")
cart1.add_item("Laptop")
cart1.add_item("Mouse")

print("print(cart1) using __str__:", cart1)
print("len(cart1) using __len__:", len(cart1))

cart2 = ShoppingCart("Wasim Duplicate")
cart2.add_item("Laptop")
cart2.add_item("Mouse")

print("Are the items in cart1 and cart2 equal? (cart1 == cart2):", cart1 == cart2) # True!


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
