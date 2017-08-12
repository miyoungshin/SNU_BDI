# 2강 9페이지
print("\nWelcome to Python Programming"). # Greetings
print("This is Your Python Program\n"). #\n 한 줄을 띄움 (=print()로도 가능), 문자열 안의 명령(앞에오든 뒤에 오든 상관 없음) n은 newline의 약자 t는 tab의 약자
print("What is your name? ")
name = input()

print("Hi! " + name)  # compare this with the following line
# 1+1은 출력값이 2 , a+b는 출력값이 ab (+는 old 스타일)
print("Hi!", name)
print("The Length of your name is:")
print(len(name))

age = input("\nWhat is your age? ")
print("You will be " + str(int(age) + 1) + " years old in the next year.")
print("You will be", int(age) + 1, "years old in the next year.")
print("Bye~~~!")