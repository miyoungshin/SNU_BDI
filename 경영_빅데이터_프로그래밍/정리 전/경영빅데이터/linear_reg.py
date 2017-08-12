import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression
from sklearn.cross_validation import train_test_split
from sklearn.metrics import mean_squared_error

data = pd.read_excel('data.xlsx')

y_data = list(data['audience'])
for i in range(len(y_data)):
	y_data[i] = int(y_data[i])
y_data = np.array(y_data)
home_win = list(data['home_win'])
home_lose = list(data['home_lose'])
home_p_win = list(data['home_p_win'])
home_p_lose = list(data['home_p_lose'])
away_win = list(data['away_win'])
away_lose = list(data['away_lose'])
away_p_win = list(data['away_p_win'])
away_p_lose = list(data['away_p_lose'])
holiday = list(data['holiday'])

home_win_rate = [None]*len(home_win)
away_win_rate = [None]*len(away_win)
home_p_win_rate = [None]*len(away_win)
away_p_win_rate = [None]*len(away_win)

for i in range(len(home_win)):
	if (home_win[i]+home_lose[i]) != 0:
		home_win_rate[i] = home_win[i]/(home_win[i]+home_lose[i])
	else: 
		home_win_rate[i] = 0
	if (away_win[i]+away_lose[i]) != 0:
		away_win_rate[i] = away_win[i]/(away_win[i]+away_lose[i])
	else:
		away_win_rate[i] = 0
	if (home_p_win[i]+home_p_lose[i]) != 0:
		home_p_win_rate[i] = home_p_win[i]/(home_p_win[i]+home_p_lose[i])
	else: 
		home_p_win_rate[i] = 0
	if (away_p_win[i]+away_p_lose[i]) != 0:
		away_p_win_rate[i] = away_p_win[i]/(away_p_win[i]+away_p_lose[i])
	else:
		away_p_win_rate[i] = 0
	
x_data = np.array([home_win_rate, away_win_rate, home_p_win_rate, away_p_win_rate, holiday]).transpose()

X_train, X_test, y_train, y_test = train_test_split(x_data, y_data, test_size=0.3, random_state=0)

reg = LinearRegression().fit(X_train, y_train)
y_pred = reg.predict(X_test)
error = mean_squared_error(y_test, y_pred)
print(error)
print(reg.coef_)
print(reg.intercept_)
#print(reg.summary())