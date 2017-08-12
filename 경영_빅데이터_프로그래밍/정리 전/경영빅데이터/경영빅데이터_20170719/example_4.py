import nltk
from nltk.corpus import stopwords





# nltk.dwonload()
# models averaged_perceptron_tag, maxent_treebank_pos,punkt
# corpora stopwords, wordnet

# 토큰화 할때는 하나의 str -> 리스트(t1,t2,t3..)로
s1 = 'My only regret in life is that I did not drink more whin'
s2 = 'I drink to make other people more interesting'
s3 = 'An intelligent man is sometimes forced to be drunk to spend time with his fools'

t1 = (nltk.word_tokenize(s1))
t2 = (nltk.word_tokenize(s2))
t3 = (nltk.word_tokenize(s3))

# 품사태깅 (pos_tag)는 리스트를 받아 하나의 쌍의 튜플 형식((t1,T1),(t2,T2))
#print(nltk.pos_tag(t1))
#print(nltk.pos_tag(t2))
#print(nltk.pos_tag(t3))


# Lemmatization은 str을 넣어 스트링으로 반환 (not list)
# 단어의 기본형을 찾는 방법 , 꼭 객체를 생성한다음 함수를 사용해야 함
lemmatizer = nltk.wordnet.WordNetLemmatizer()  #WordNetLemmatizer는 클래스
lemma1=[]
for i in t1:
	lemma1.append(lemmatizer.lemmatize(i))
print(lemma1)



lemma2=[]
for i in t2:
	lemma2.append(lemmatizer.lemmatize(i))
print(lemma2)

lemma3=[]
for i in t3:
	lemma3.append(lemmatizer.lemmatize(i))
print(lemma3)
#nltk.wordnet.WordNetLemmatizer()

stopWords = stopwords.words('english')

result1 = []
for i in t1 :
	if i.lower() not in stopWords :
		result1.append(i)
print(result1)

result2 = []
for i in t2 :
	if i.lower() not in stopWords :
		result2.append(i)
print(result2)

result3 = []
for i in t3 :
	if i.lower() not in stopWords :
		result3.append(i)
print(result3)