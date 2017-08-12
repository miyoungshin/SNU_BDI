import json

tweet_data = open('tweet_movie_stream.txt')
expectation_val = {}
dunkirk_value = 0
spiderman_homecoming_value = 0

for line in tweet_data:
	try:
		content = json.loads(line)
		expectation_val[content['text']] = content['user']['followers_count']
	except:
		continue

for key in expectation_val :
	trimmed_key = key.lower().replace(' ',' ')
	if 'dunkirk' in trimmed_key:
		dunkirk_value += expectation_val[key]
	if 'spidermanhomecoming' in trimmed_key :
		spiderman_homecoming_value += expectation_val[key]

print('Expectancy value of "dunkirk" : {:,}'.format(dunkirk_value))
print('Expectancy value of "spiderman homecoming" : {:,}'.format(spiderman_homecoming_value))
tweet_data.close()