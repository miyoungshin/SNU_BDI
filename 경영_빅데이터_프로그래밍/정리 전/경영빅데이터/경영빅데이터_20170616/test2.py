x = int(input('first number? :'))
# 파이썬은 문자, 숫자를 자동적으로 구분이 안됨 따라서 input('first number? ;')
# 위와 같이 입력하면 문자로 인식 따라서 int()를 따로 설정 해줘야함
y = int(input('second number? :'))

z = x + y
# 결과 값을 나타낼때 ''이후 ,를 해야 함
print('Result :', z)