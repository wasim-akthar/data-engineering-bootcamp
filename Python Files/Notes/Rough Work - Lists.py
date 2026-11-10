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

# ACTIVITY, AMAZON CART