# SET CREATION
# METHOD 1

products = {"TV", "Fridge", "AC", "Sofa"}

# METHOD 2

endgame = set(['I', 'am', 'Iron', 'Man'])

# CRUD OPERATIONS
# ADD (To add one element)

products.add("Microwave")

# UPDATE (To add multiple elements)

products.update(["Laptop", "Fan", "Heater"])

# REMOVE (To remove an element when user is sure 
# that the value is present in set, else raises keyError)

products.remove("Fan")

# DISCARD (To remove an element safely so won't raise keyError)

products.discard("Heater")

# POP

new_prod = products.pop()

print(new_prod)

# CLEAR

products.clear()

# MATHEMATICAL OPERATIONS
# 1 UNION (|)

bank="Axis"
savings={101,102,103,104,105,106}
current={103,104,107,108,109}
loan={102,104,108,110,111}

union_users = savings | current | loan
print(union_users)

# 2 INTERSECTION (&)

savings_loan = savings & loan 
not_current = savings_loan - current

print(not_current)



products = {"TV", "Fridge", "AC", "Sofa"}
product_count = len(list(products))
print(product_count)
number_set = set({range(1,6)})
new_products = products.copy()
print (
  products.add("Washing Machine"),
  "\nAdd:", products,
  products.discard("Washing Machine"),
  "\n Discard:", products,
  "\n New Products:", new_products,
  new_products.clear(),
  "\n Clear:", new_products
)