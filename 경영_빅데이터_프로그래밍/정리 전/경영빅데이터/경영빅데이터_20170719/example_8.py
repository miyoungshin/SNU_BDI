import nltk
from nltk.corpus import stopwords
from collections import Counter



with open('reviews4.txt','r',encoding = 'utf-8') as a :
	lines = a.readlines()
	a.close()   # 파일을 오픈 한뒤에는 꼭 close를 해야함

StopWords = stopwords.words('english')
StopWords.append('.')
StopWords.append(',')
StopWords.append("'s")
StopWords.append("?")
StopWords.append("n't")



tokens = []
for i in lines :
	j = nltk.word_tokenize(i.lower())
	for token in j :
		if token not in StopWords :
			tokens.append(token)

# 2-4-4-1 전체 리뷰 토큰 개수 출력

corpus = nltk.Text(tokens)
print(len(corpus.tokens))
print(len(set(corpus.tokens)))

counts = Counter(corpus)
print(counts.most_common(10))


