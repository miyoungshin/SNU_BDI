
#senti_synset()의 결과는 filter object이므로 내용을 보고 싶으면 list로 변환한다. 품사에 따라 같은 단어라도 다른 유의어 집합이 존재
import nltk
from nltk.corpus import sentiwordnet as swn


def word_sentiment_carculator(word,tag) :
	pos_score = 0
	neg_score = 0

	if 'NN' in tag and len(list(swn.senti_synsets(word, 'n'))) > 0 :
		syn_set = list(swn.senti_synsets(word,'n'))
	elif 'VB' in tag and len(list(swn.senti_synsets(word, 'v'))) > 0 :
		syn_set = list(swn.senti_synsets(word, 'v'))
	elif 'JJ' in tag and len(list(swn.senti_synsets(word, 'a'))) > 0 :
		syn_set = list(swn.senti_synsets(word, 'a'))
	elif 'RB' in tag and len(list(swn.senti_synsets(word, 'r'))) > 0 :
		syn_set = list(swn.senti_synsets(word, 'r'))
	else :
		return (0,0)

	for syn in syn_set :
		pos_score += syn.pos_score()
		neg_score += syn.neg_score()
	return (pos_score/len(syn_set), neg_score/len(syn_set))

# nltk.pos_tag()


def sentence_sentiment_calculator(sent) :
	token = nltk.word_tokenize(sent)
	pos_tags = nltk.pos_tag(token)

	pos_score = 0
	neg_score = 0
	for word, tag in pos_tags:
		pos_score += word_sentiment_carculator(word,tag)[0]
		neg_score += word_sentiment_carculator(word,tag)[1]
	return (pos_score,neg_score)

import os
pos_files = os.listdir('aclImdb/train/pos')[:10]
neg_files = os.listdir('aclImdb/train/neg')[:10]

actual = [1]*10 +[0]*10
predicted = []

for file in pos_files :

	with open('aclImdb/train/pos/{}'.format(file),'r', encoding = 'utf-8')as f:
		scores = sentence_sentiment_calculator(f.read())

		if scores[0] > scores[1]:
			predicted.append(1)
		else :
			predicted.append(0)
		f.close()

for file in neg_files :

	with open('aclImdb/train/neg/{}'.format(file),'r', encoding = 'utf-8')as f:
		scores = sentence_sentiment_calculator(f.read())

		if scores[0] > scores[1]:
			predicted.append(1)
		else :
			predicted.append(0)
		f.close()

print(predicted)
print(actual)

score = 0
for i in range(20) :
	if actual[i] == predicted[i] :
		score += 1
	else :
		pass
print('정확도는', score/20,'% 입니다.')
