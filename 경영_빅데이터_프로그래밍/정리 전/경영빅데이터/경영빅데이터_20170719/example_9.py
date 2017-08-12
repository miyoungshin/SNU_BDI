# 행렬 정규화
import numpy as np


arr = np.random.randint(1,100,size = (5,5))

arrMax,arrMin=arr.max(), arr.min()
arr_normalized = (arr - arrMin)/(arrMax - arrMin)

print(arr_normalized)


#행렬 곱

A = np.array([[1,2,3],[4,5,6]])
B = np.array([[1,2],[3,4],[5,6]])

result = np.dot(A,B)
print(result)

# 데이터 불러와 분할 하기
data = np.loadtxt('stock-data.csv',delimiter=',')
data_x = data[:,0:3] # data[행,렬]
data_y = data[:,-1]  # 일반적으로 y는 예측하고 싶은 데이터 x는 예측에 활용되는 데이터
data_y = data[:,6:] #6번째 부터 마지막 까지의 열을 포함
