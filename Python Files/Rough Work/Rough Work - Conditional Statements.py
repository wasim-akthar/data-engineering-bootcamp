# IF
rain = True
if(rain):
  print('No go')

# IF - ELSE
a = 10
b = 35
if(a > b):
  print('A is greater')
else:
  print('B is greater')

# ODD OR EVEN

odd_or_even_num = int(input('Enter a number : '))
print('Odd' if (odd_or_even_num % 2 == 1) else 'Even')

# VOTER ELIGIBLITY

voter_age = int(input('Enter your age'))
print('Eligible' if (voter_age >= 18) else 'Not Eligible')

# LOGIN CHECK

login_credential = 'add'
password = 'pass'

user_check = input('Enter Login Cred : ') == login_credential
pass_check = input('Enter Pass : ') == password

print('Success' if (user_check and pass_check) else 'Cred or Pass is wrong')


# IF ELIF ELSE

# MARKS

marks = int(input('Enter Marks: '))
print(
  'A' if marks >=90 
  else 'B' if marks >=80
  else 'C' if marks >=70
  else 'D' if marks >=60
  else 'E' if marks >=50
  else 'F' if marks >=40
  else 'Fail'
)

# DISCOUNT

purchase_amount = int(input('Enter Purchase Amount: '))
discounter = 0.3 if purchase_amount >= 3000 else 0.2 if purchase_amount >=2000 else 0.1 if purchase_amount >=1000 else 0
print(
  'Your Purchase Amount : ', purchase_amount,
  '\n Your Discounted Amount : ', purchase_amount*(discounter),
  '\nYour Discounted Rate : ', (purchase_amount - purchase_amount*(discounter)) 
)

purchase_amount = int(input('Enter Purchase Amount: '))
print('Your Purchase Amount : ', purchase_amount)

if(purchase_amount >= 3000):

  print('Your Discounted amount : ', purchase_amount * 0.3)
  print('Your Total Now : ',  (purchase_amount - purchase_amount*0.3))

elif (purchase_amount >= 2000):

  print('Your Discounted amount : ', purchase_amount * 0.2)
  print('Your Total Now : ',  (purchase_amount - purchase_amount*0.2))

elif ( purchase_amount >= 1000):

  print('Your Discounted amount : ', purchase_amount * 0.1)
  print('Your Total Now : ',  (purchase_amount - purchase_amount*0.1))

else: 
  print('No Discount')


# Nested If

odd_or_even_num = int(input('Enter a number : '))
if(odd_or_even_num > 0):
  if(odd_or_even_num % 2 == 0):
    print('Even Number')
  else:
    print('Odd Number')


parents_permission = input('Are your parents allowing you to go movies? (Y/N) : ').lower().strip()
if(parents_permission == 'y'):
  pocket_amount = int(input('How much do you have ? : ')) 
  if(pocket_amount >= 500):
    print('You can go')
  else:
    print('NO money, cannot go')
else:
  print('Cannot go to movie')
