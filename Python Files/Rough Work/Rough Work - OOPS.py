# Single Inheritance
class Instagram:
  def __init__(self, name, mail):
    self.name = name
    self.mail = mail
  def details(self):  
    print("Your Name :", self.name)
    print("\nYour mail :", self.mail)
class Reels(Instagram):
  def reels(self):
    print("Showing reels for :",self.name)

acct = Reels('Wasim', 'wasim@example.com')
acct.reels()

# Multiple Inheritance

#Parent class 1
class Camera:
  def capture(self):
    print("Capturing your moments")
#Parent class 2
class Music_Player:
  def play(self):
    print("Playing your favorite songs")
#Child class
class Phone(Camera, Music_Player):
  def phone(self):
    print("This is your phone")
    self.capture()
    self.play()

xiaomi = Phone()
xiaomi.phone()



# Example for Multiple Inheritance in Production For DB and file related operations

class Database:
  def read_db(self):
    print("Reading data from the database")
  def write_db(self):
    print("Writing data to the database")

class File:
  def read_file(self):
    print("Reading file from the system")
  def write_file(self):
    print("Writing file to the system")

class Application(Database, File):
  def app(self):
    print("This is your application")
    self.read_db()
    self.write_db()
    self.read_file()
    self.write_file()

app = Application()
app.app()

# Multi Level Inheritance

class Aptitude:
  aptitude_test_status = 1
  def aptitude(self):
    print("This is your aptitude test")
    print("You passed your aptitude test")
class Reasoning(Aptitude):
  reasoning_test_status = 1
  def reasoning(self):
    print("This is your reasoning test")
    if self.aptitude_test_status == 1:
      print("You passed your reasoning test")
class Technical(Reasoning):
  technical_test_status = 1
  def technical(self):
    print("This is your technical test")
    if self.reasoning_test_status == 1:
      print("You passed your technical test")
class Interview(Technical):
  interview_test_status = 1
  def interview(self):
    print("This is your interview test")
    if self.technical_test_status == 1:
      print("You passed your interview test")
class Final(Interview):
  final_test_status = 1
  def final(self):
    print("This is your final test")
    if self.interview_test_status == 1:
      print("You passed your final test")
class Status(Final):
  def last(self):
    print("This is your last test")
    if self.final_test_status == 1:
      print("You passed your last test")

employee = Status()
employee.aptitude()
employee.reasoning()
employee.technical()
employee.interview()
employee.final()
employee.last()

# Hierarchical Inheritance

def account_details(type, interest, balance):
  print("This is your", type, "account which gives you interest of", interest, "%")
  print("Your Balance :", balance)
  print("Your Interest :", balance * (interest / 100))
  print("Your Total Balance :", balance + (balance * (interest / 100)))

class Bank_Account:
  def __init__(self, name, balance):
    self.name = name
    self.balance = balance
  def details(self):
    print("Your Name :", self.name)
    print("Your Balance :", self.balance)
class Savings_Account(Bank_Account):
  def savings(self):
    self.details()
    account_details("savings", 4, self.balance)
class Current_Account(Bank_Account):
  def current(self):
    self.details()
    account_details("current", 2, self.balance)
class Fixed_Deposit_Account(Bank_Account):
  def fixed_deposit(self):
    self.details()
    account_details("fixed deposit", 6, self.balance)

ICICI = Savings_Account('Wasim', 10000)
ICICI.savings()

HDFC = Current_Account('Wasim', 20000)
HDFC.current()

SBI = Fixed_Deposit_Account('Wasim', 30000)
SBI.fixed_deposit()



# File Handling
# All Types of File Handling
'''
1. Read File
2. Write File
3. Append File
4. Read and Write File


'''

# Access Modifiers
# Public Access Modifier

class Public:
  def __init__(self, name, age):
    self.name = name
    self.age = age
  def details(self):
    print("Your Name :", self.name)
    print("Your Age :", self.age)
p_access = Public('Wasim', 25)
p_access.details()

# Protected Access Modifier

class Protected:
  def __init__(self, name, age):
    self._name = name
    self._age = age
  def details(self):
    print("Your Name :", self._name)
    print("Your Age :", self._age)
protected = Protected('Wasim', 25)
protected.details()
print(protected._name) # This will give the value of _name because we are accessing it through the class name
# Private Access Modifier

class Private:
  def __init__(self, name, age):
    self.__name = name
    self.__age = age
  def details(self):
    print("Your Name :", self.__name)
    print("Your Age :", self.__age)

private = Private('Wasim', 25)
private.details()
print(private.__name) # This will give an error because __name is private
print((private._Private__name)) # This will give the value of __name because we are accessing it through the class name


from abc import ABC,abstractmethod
class vehicle(ABC):
    @abstractmethod
    def start(self):
        pass
class Bike(vehicle):
    def start(self):
        print("self start")
class car(vehicle):
    def start(self):
        print("using button")
c=car()
b=Bike()
c.start()
b.start()