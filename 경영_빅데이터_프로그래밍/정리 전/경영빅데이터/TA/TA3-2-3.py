import pymysql


conn = pymysql.connect(host = 'localhost', user = 'root',password = 'zxcqwe123',db = 'company',charset = 'utf8')

curs = conn.cursor()

sql_query = '''insert into `employee` values ('Daniel','Craig','100006','1968-03-02','M','800000');''' 

curs.execute(sql_query)

sql_query = 'select * from employee'
curs.execute(sql_query)

rows = curs.fetchall()
print(rows)