# mysql의 데이터를 불러올때 활용


import pymysql

conn = pymysql.connect(host = 'localhost', user = 'root',password = 'zxcqwe123',db = 'company',charset = 'utf8')

curs = conn.cursor()

sql_query = 'select * from employee'

curs.execute(sql_query)

rows = curs.fetchall()

print(rows)

conn.close()