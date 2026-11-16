
# Class Notes 28/10/26

# print(
#   'First Value is =',int(input('Enter First Value = ')),
#   '\nSecond Value is =', int(input('Enter Second Value = '))
# )

# a = int(input('Enter First Number = '))
# b = int(input('Enter Second Number = '))

# Arithmetic Operators

a = int(input('Enter First Number = '))
b = int(input('Enter Second Number = '))

print(
  '----------Arithmetic Operators----------\n'
  'Addition (a + b) = ', a + b,
  '\nSubtraction (a - b) = ', a - b,
  '\nMultiplication (a * b) = ', a * b,
  '\nDivision (a / b) = ', a / b,
  '\nModulus (a % b) = ', a % b,
  '\nFloor Division (a // b) = ', a // b,
  '\nExponentiation (a ** b) = ', a ** b
)

## Comparison Operators

print(
  '\n----------Comparison Operators----------'
  '\nMore Than (a > b) = ', a > b,
  '\nLess Than (a < b) = ', a < b,
  '\nMore Than OR Equal to (a >= b) = ', a >= b,
  '\nLess Than OR Equal to (a <= b) = ', a <= b,
  '\nEqual to (a == b) = ', a == b,
  '\nNOT Equal to (a != b) = ', a != b
)

## Assignment Operators

print('\n----------Assignment Operators----------')

c = a; print('Assign (c = a) = ', c)
c = a; c += b; print('Add and Assign (c += b) = ', c)
c = a; c -= b; print('Subtract and Assign (c -= b) = ', c)
c = a; c *= b; print('Multiply and Assign (c *= b) = ', c)
c = a; c /= b; print('Divide and Assign (c /= b) = ', c)
c = a; c %= b; print('Modulus and Assign (c %= b) = ', c)
c = a; c //= b; print('Floor Division and Assign (c //= b) = ', c)
c = a; c **= b; print('Exponentiation and Assign (c **= b) = ', c)

## Logical Operators

print(
  '\n----------Logical Operators----------'
  '\nLogical AND (a > 0 and b > 0) = ', a > 0 and b > 0,
  '\nLogical OR (a > 0 or b > 0) = ', a > 0 or b > 0,
  '\nLogical NOT (not (a > b)) = ', not (a > b),
  '\nLogical NOT on Equal (not (a == b)) = ', not (a == b)
)

## Membership Operators

numbers = [1, 2, 5, 10, 20]
course = "Data Engineering"

print(
  '\n----------Membership Operators----------'
  '\nIN list check (a in [1, 2, 5, 10, 20]) = ', a in numbers,
  '\nNOT IN list check (a not in [1, 2, 5, 10, 20]) = ', a not in numbers,
  '\nIN list check (b in [1, 2, 5, 10, 20]) = ', b in numbers,
  '\nNOT IN list check (b not in [1, 2, 5, 10, 20]) = ', b not in numbers,
  '\nIN string check ("Data" in course) = ', 'Data' in course,
  '\nNOT IN string check ("Java" not in course) = ', 'Java' not in course
)

## Identity Operators

x = [1, 2, 3]
y = [1, 2, 3]
z = x

print(
  '\n----------Identity Operators----------'
  '\nIs a identical to b (a is b) = ', a is b,
  '\nIs a not identical to b (a is not b) = ', a is not b,
  '\nSame object reference (x is z) = ', x is z,
  '\nDifferent object, same values (x is y) = ', x is y,
  '\nValue equality check (x == y) = ', x == y,
  '\nNot the same object (x is not y) = ', x is not y
)

# Finding the greatest number

print(f"\n{'First' if a > b else 'Second'} is greater")

## People above 1000, coupon 
amount = 1100
coupon = True

print('Eligible' if amount > 1000 and coupon else 'Not Eligible' )