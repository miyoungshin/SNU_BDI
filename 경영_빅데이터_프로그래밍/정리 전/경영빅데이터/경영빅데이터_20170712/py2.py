import json
tweet_data = open('tweet_movie_stream.txt')
tweet = []

for line in  tweet_data:
    try:
            c = json.loads(line)
            tweet.append(c)
    except:
            continue

print(len(tweet))