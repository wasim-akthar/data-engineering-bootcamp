# List – Practice Questions

# Create a list with 5 product names.
products = ["Laptop", "Mobile", "Tablet", "Keyboard", "Mouse"]
# Display the first and last product.
print("First product:", products[0])
print("Last product:", products[-1])
# Add two new products.
products.append("Headphones")
products.append("Speaker")
# Change the second product to "Smart Watch".
products[1] = "Smart Watch"
# Remove "Mobile" from the list.
products.remove("Mobile")
# Count how many times "Laptop" appears.
print("Number of 'Laptop' occurrences:", products.count("Laptop"))
# Sort the products alphabetically.
products.sort()
# Check whether "Keyboard" is available.
if "Keyboard" in products:
    print("Keyboard is available.")
else:
    print("Keyboard is not available.")
# Display the total number of products.
print("Total number of products:", len(products))
# Remove the last product using pop().
removed_product = products.pop()
print("Removed product:", removed_product)

# Tuple – Practice Questions

# Create a tuple with 5 product details.
product_details = ("Laptop", 55000, "Electronics", "Dell", 2023)
# Display the product name.
print("Product Name:", product_details[0])
# Display the price.
print("Price:", product_details[1])
# Find the length of the tuple.
print("Length of tuple:", len(product_details))
# Check whether "Electronics" exists.
if "Electronics" in product_details:
    print("Electronics is available.")
else:
    print("Electronics is not available.")
# Find the index of "Laptop".
print("Index of 'Laptop':", product_details.index("Laptop"))
# Count how many times 55000 appears.
print("Number of '55000' occurrences:", product_details.count(55000)) 
# Create another tuple containing the brand name and concatenate it.
brand_details = ("Dell",)
concatenated_tuple = product_details + brand_details
# Display the first three elements using slicing.
print("First three elements:", concatenated_tuple[:3])
# Try updating the price. Observe the error and explain why.
product_details[1] = 60000  # This will raise a TypeError because tuples are immutable.

# Set – Practice Questions

# Add "Printer" to online.
online = {"Laptop", "Mobile", "Tablet", "Keyboard", "Mouse", "Printer"}
# Add "Scanner" and "Camera" to offline.
offline = {"Scanner", "Camera"}
# Find all unique products from both sets.
all_products = online | offline #union
# Find common products.
common_products = online & offline #intersection
# Find products available only online.
online_only = online - offline #difference
# Find products available only offline.
offline_only = offline - online #difference
# Find products that are not common.
not_common = online_only | offline_only #union
# Check whether "Laptop" is available online.
if "Laptop" in online:
    print("Laptop is available online.")
else:
    print("Laptop is not available online.")
# Find the number of unique products.
print("Number of unique products:", len(all_products))
# Remove "Tablet" from online.
online.remove("Tablet") #Removing an element that exists in the set.

# Dictionary – Practice Questions

# Create a dictionary with customer ID, name, city and salary.
customer = {
    "customer_id": 101,
    "name": "John Doe",
    "city": "New York",
    "salary": 75000
}
# Display the customer name.
print("Customer Name:", customer["name"])
# Display the customer city using get().
print("Customer City:", customer.get("city"))
# Add a new key called "email".
customer["email"] = "john.doe@example.com"
# Update the city to "Bangalore".
customer["city"] = "Bangalore"
# Add a new key called "membership".
customer["membership"] = "Gold"
# Remove the orders key using pop().
customer.pop("orders", None)
# Display all keys.
print("All Keys:", list(customer.keys()))
# Display all values.
print("All Values:", list(customer.values()))
# Display all key-value pairs.
print("All Key-Value Pairs:", list(customer.items()))
# Check whether "customer_id" exists.
if "customer_id" in customer:
    print("Customer ID exists.")
else:
    print("Customer ID does not exist.")
# Find the total number of key-value pairs.
print("Total Number of Key-Value Pairs:", len(customer))