import numpy as np

arr1 = np.array([1,2,3])
arr2 = np.array([[1,2,3],[4,5,6]])
arr3 = np.zeros((2,2))
arr4 = np.ones((3,3))
arr5 = np.full((3,3),20)
arr6 = np.eye(3)
arr7 = np.random.random((2,2))

# 배열의 차원을 알려주는 함수
arr7.ndim 
arr6.shape

# list와 같은 방식으로 slicing할 수 있음
arr7[1][1] 

# 특정 조건을 만족하는 요소를 불러오기
arr1 = np.array([[1,2],[3,4],[5,6]])
idx = (arr1 > 3)
arr1[idx]

arr1 = np.array([[1,2],[3,4]])
arr2 = np.array([[5,6],[7,8]])


#=========================배열 연산 =========================
arr1 + arr2

# 행렬의 곱셉법칙과 다름
arr1 * arr2

arr1 / arr2

np.sqrt(arr1)

# 백터의 내적
vector1 = np.array([1,2])
vector2 = np.array([3,4])
np.dot(vector1,vector2)

# 행렬의 곱연산
np.dot(arr1,arr2)

# sum 연산자
arr1 = np.array([[1,2],[3,4]])
np.sum(arr1)

np.sum(arr1,axis = 0)
# dtype = np.flat64 로 정의해주면 숫자 뒤에 '.'이 찍힘 
arr1 = np.array([[1,2],[3,4]],dtype = np.float64)
np.sum(arr1,axis = 1)

# 전치행렬 연산
arr1.T