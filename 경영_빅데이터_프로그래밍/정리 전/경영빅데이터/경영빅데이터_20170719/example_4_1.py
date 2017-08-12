import nltk
from nltk.corpus import stopwords
from collections import Counter

review = open('reviews3.txt','r',encoding="utf-8")

word = []
for i in review.readlines() :
	word.append(i)

t1 = (nltk.word_tokenize(str(word)))

lemmatizer = nltk.wordnet.WordNetLemmatizer()  #WordNetLemmatizer는 클래스
lemma1=[]
for i in t1:
	lemma1.append(lemmatizer.lemmatize(i))

stopWords = stopwords.words('english')
result1 = []
for i in lemma1 :
	if i.lower() not in stopWords :
		result1.append(i)
print(result1)


