a, b, c = int(input('enter number 1 : ')), int(input('enter number 2 : ')), int(input('enter number 3 : '))

print(
 a if (a > b and a > c) else b if (b > c) else c
)