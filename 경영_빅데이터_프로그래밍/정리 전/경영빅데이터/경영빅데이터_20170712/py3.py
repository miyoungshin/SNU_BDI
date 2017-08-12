import json

tweet_data = open('tweet_movie_stream.txt')

for line in tweet_data:
	try:
		c = json.loads(line)
		print(c['text'])
		print(c['user']['followers_count'])
	except:
		continue
tweet_data.close()