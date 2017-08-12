a = int(input("Enter a 3-digit integer: "))
b = input("Enter another 3-digit integer: ")
second = list(b)


line3 = int(b[2])*a
print(line3)

line4 = int(b[1])*a
print(line4)
   
line5 = int(b[0])*a
print(line5)

line6 = line3+line4*10+line5*100
print(line6)
