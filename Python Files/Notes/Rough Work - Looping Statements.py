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



