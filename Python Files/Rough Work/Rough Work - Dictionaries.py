my_details = {
  "name": "Wasim",
  "age": 25,
  "gender": "M",
  "degree": "B.Tech"
}

me_deets = dict(name="kevin", age=30, native="British")

student = {
  "name": "Wasim",
  "age": 18,
  "marks": (100, 35,40,90,80),
  "pass": False,
  "number": {9884387746}
}

print(student)

# VALUE ACCESS

student.get('name')
student["marks"]

print(student.fr)

# keys, values, items, get, update, pop, 
# popitem, clear, copy, setdefault, fromkeys


student_detail = {
  "name": "Wasim",
  "age": 26,
  "course": "Data Engineering",
  "price": 20000
}

print(student_detail["course"])

courses = {
  "s1": "AI",
  "s2": "ML",
  "s3": "DE",
  "s4": "DA"
}


new_course_details = courses.fromkeys()
print(new_course_details)

price = {
  "s1": 47000,
  "s2": 78000,
  "s3": 24000,
  "s4": 36000
}

copied_price = price.copy()
print(copied_price)
price.popitem()
print(price)

print(courses.keys())
print(price.keys())
print(courses.values())
print(price.values())
print(courses.items())
print(price.items())
print(courses.update({'s5': 'GenAI'}))
print(courses.setdefault("s6",'MEAN'))

new_course = ("Science", "Maths", "Social")
result_course = dict.fromkeys(new_course, 90)

print(result_course)