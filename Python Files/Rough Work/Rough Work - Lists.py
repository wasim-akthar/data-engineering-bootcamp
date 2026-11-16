import copy as cp

employees = ['Wasim', 'Akthar', 'Remo', 'Dublin']
age = [25, 21, 45, 20]
department = ['HR', 'IT', 'Finance', 'Sales']
salary = [90000,70000,28000,40000]
print(
  'Employees :', employees,
  '\nAge :', age,
  '\nDepartment :', department,
  '\nSalary :', salary
  )

using_list_class = list((1,2,3,[21376,31236], "julliente", (212,"wenen", 89.89)))
print(using_list_class)

using_list_class_with_range = list((range(2, 21, 2)))
print(using_list_class_with_range)

using_list_class_with_empty_string = list(("     "))
print(using_list_class_with_empty_string)

# LIST METHODS
method_list = []

# 1. APPEND (For single value addition)

print('List before Append :', method_list)
method_list.append('Monday')
print('Append :',method_list)

# 2. EXTEND (For multiple value addition)

print('List before Extend :', method_list)
method_list.extend(['Tuesday', 'Wednesday'])
print('Extend :',method_list)

# 3. LENGTH CHECK

print('LENGTH :', len(method_list))

# 4. INSERT (To add data in particular index)

print('List before Insert :', method_list)
method_list.insert(3, 'Thursday')
print('Insert :', method_list)

# 5. REMOVE (To remove data from a list, first occurance only will be removed)

print("List before remove :", method_list)
method_list.remove("Monday")
print("Remove :", method_list)

#6 POP (To remove last index data from list unless specified)

print("List before pop :", method_list)
method_list.pop()
print("Pop :", method_list)

# CLEAR (To remove all data from list like truncate)

print("List before clear :", method_list)
method_list.clear()
print("Clear :", method_list)

# INDEXING AND SLICING
'''
Types: Positive , Negative
'''
# Example

employees = ['Arun', 'Priya', 'Kumar', 'Raj', 'Gopal']
print(employees)

# INDEXING

print(
    "\n Positive Indexing:", employees[1],
    "\n Negative Indexing:", employees[-2]
    )

# SLICING

print(
    "\n Positive Slicing:", employees[1:3],
    "\n Negative Slicing:", employees[-4:-2]
    )

# SEARCHING 

products = ['Mobile', 'Laptop', 'PC', 'Speaker', 'Head Phone', 'Charger']

print("Speaker" in products)

# Using Index to find position

print(products.index("PC"))

# REVERSE

products.reverse()

print(products)

products.reverse()

# COUNT

sales = [1000,899,400,180,100,300,200,100,550,690,420,100,200,800,900,200,100,350,200]

print(sales.count(350))

# SORT
sales.sort(reverse=True)
print(sales)

# LIST COMPREHENSION

'''
  List Comprehension is a short and simple way to 
  create a new list using an existing iterable

'''

number_list = [number for number in range(1,11)]
even_numbers_list = [even_number for even_number in range(2,21, 2)]
sq_number_list = [number.__pow__(number) for number in range(1,11)]
even_number_list_using_expression_and_if = [number for number in range(1,21) if number % 2 == 0] # For using IF
even_number_list_using_expression_and_if_else = [number if number % 2 == 0 else "Odd" for number in range(1, 21)]


print(
  "\n Number List:", number_list,
  "\n Even Number List:", even_numbers_list,
  "\n Square Number List:", sq_number_list
)

# LIST NAMES TO UPPERCASE

names = ['wasim', 'akthar', 'james', 'kumar']
upper_case_names = [name.upper() for name in names]
print(upper_case_names)


sales = [1000,899,400,180,100,300,200,100,550,690,420,100,200,800,900,200,100,350,200]

discount_price_in_sales = [round(sale - sale * 0.1, 0) for sale in sales]
print(discount_price_in_sales)

print(sorted(sales, reverse=True))
