age = int(input('What is your age? :'))
a = age - 20 # 앞서 설명 안하고 뒤에서 부터 설명해도 되지만 사람들이 코드를 볼때 위에서 부터 보기 때문에 필요하다

if a >= 0 :
	print('성인이 된지',a,'년 지났습니다')
# str을 중간에 끊지 않고 print('성인이 되고 {}년 지났습니다'.format(a))
# 중간에 두개를 넣을경우에는  print('~{}~{}~'.format(a,b))

elif a < 0 :
	print('성인이 되려면 {}년 남았습니다'.format(-a))

