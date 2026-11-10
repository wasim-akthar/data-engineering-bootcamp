# For loop in range
for i in range (1, 10):
  print('Value = ', i)

# String iteration
word = 'Data Engineering'
for letter in word:
  print(letter)

# Range with skip
for i in range (0, 100, 7):
  print('Value = ', i)

# List
fruits = ['Apple', 'Mango', 'Grapes', 'Guava', 'Mosambi']
for fruit in fruits:
  print(fruit)

# Decreasing range
for i in range (10, 1, -1):
  print('Value = ', i)

# Marks check
total_marks = [100, 99, 89, 34, 63, 28, 97, 37]
for marks in total_marks:
  if(marks >= 40):
    print(marks, ': Passed')
  else:
    print(marks, ': Failed')

# Students Check

students = ['Vandana', 'Sandhana', 'Meena', 'Leena',
            'Aruna', 'Abbas', 'Hamsa', 'Shruthi',
            'Wasim', 'Akthar']
search_name = input('Enter your Name: ').lower().strip()
for student in students:
  if(student.lower() == search_name):
    print(student,': Present')
    break
  else:
    print(student,': Absent')

# Latest Tamil movie check

latest_tamil_movies = [
    "Jailer 2", "Jana Nayagan", "Karuppu", "Vishwanath & Sons",
    "Mandaadi", "Baththa", "Dorothy", "Love Insurance Kompany",
    "Sardar 2", "TTT: Thalaivar Thambi Thalaimaiyil", "With Love", "Thaai Kizhavi",
    "Blast", "Scene", "Tourist Family", "Kaantha",
    "Bison: Kaalamaadan", "Vidamuyarchi", "Dragon", "Veera Deera Sooran"
]
search_movie = input('Enter Movie Name: ').lower()
for movie in latest_tamil_movies:
  if(movie.lower() == search_movie):
    print(movie, ' Ticket Available')
  else:
    print(movie, ' Ticket Not Available')



for number in range(1,21):
  if (number == 10):
    continue
  print(number)

number = int(input('Enter your number : '))
for table_number in range(1,11):
  print(number,'X', table_number ,'=', table_number*number)


times_number = 1
number = int(input('Enter your number : '))
while times_number <= 10:
  print(number,'X', times_number , '=', number*times_number)
  times_number += 1


for i in range(1,11):
    print(' ' * (10 - i),'* ' * i)

ages = [30,20,34,42,19,28,36,21,24,59,25]
eligible_ages = []
for age in ages:
  if(age >= 25):
    print(age,': Eligible Age')
    eligible_ages.append(age)

for number in range(1,11):
  print(number,', ' if number != 10 else '' , end='')

for number in range(10,0,-1):
  print(number,', ' if number != 1 else '' , end='')

for number in range(1, 21):
  print(number if number%2==0 else '', end = ' ')

for number in range (2,21,2):
  print(number, end='')

total = 0
for number in range(1,11):
  total += number
print(total)  

print(sum(range(1,11)))

count = 1
while count <= 10:
    print(count,', ' if count != 10 else '' , end='')
    count += 1
print()
count -= 1
while count >= 1:
    print(count,', ' if count != 1 else '' , end='')
    count -= 1
count = 1
while count <= 10:
      print(count,', ' if count != 9 else '' , end='')
      count += 2
print()
count -= 1
while count >= 1:
    print(count,', ' if count != 2 else '' , end='')
    count -= 2