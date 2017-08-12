import unicodecsv
import csv
# with open('car.csv') as car :

car = open('car.csv','r')
result = []
reader = csv.DictReader(car)

for i in reader :
	result.append(i)