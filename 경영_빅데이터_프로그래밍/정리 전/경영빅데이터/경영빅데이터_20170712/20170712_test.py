from tweepy import Stream
from tweepy import OAuthHandler
from tweepy.streaming import StreamListener

consumer_token = 'mzx8Q2ZvCYHQcADW8YErYWgg4'
consumer_secret = 'nBs261QdUCUMjAVYsr2KqMOHA96wOgqqPpJz6FTTas5Ge8jPJt'
access_token = '882390562929745920-8b7TcCA0LWqQ0ORJnHazgdX9NLJjJPZ'
access_token_secret = '04VMgIsORw3cV0BMJrW6kfLWKu95sUSbQZ0npW8EURqCQ'


tweet_stream = open('tweet_movie_stream2.txt', 'a')

class Listener(StreamListener) :
	def on_data(self, data) :
		while(True):
			try :
				tweet_stream.write(data)
				tweet_stream.write('\n')
				return True
			except BaseException :
				pass

	def on_error(self, status) :
		print(status)
		return True

	def on_timeout(self) :
		print(sys.stderr)
		return True

listener = Listener()
auth = OAuthHandler(consumer_token, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
stream = Stream(auth, listener)

#stream.filter(track=['dunkirk','spiderman homecoming'])
stream.filter(track=['star wars'])