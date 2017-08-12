# 감성분석은 지식기반 테크닉과 통계적 방법론 2가지
# 감성분석.py는 지식 기반
# 통계쩍 방법론은 기계학습 기반은 학습 데이터가 필수적으로 필요함 


# http://ai.stanford.edu/~amaas/data/sentiment/ 접속 데이터 중 train 데이터 중 첫번째 불러오기
import os
files = os.listdir('aclImdb/train/pos')

first_file = files[0]

with open('aclImdb/train/pos/{}'.format(first_file),'r', encoding = 'utf-8')as f: review = f.read()
f.close()

print(review)


#senti_synset()의 결과는 filter object이므로 내용을 보고 싶으면 list로 변환한다. 품사에 따라 같은 단어라도 다른 유의어 집합이 존재
import nltk
from nltk.corpus import sentiwordnet as swn

print(list(swn.senti_synsets('hate','v')))

# 유의어 집단을 찾아 단어가 긍정/부정인지 확인해 척도로서 활용하기 위해
#print(list(swn.senti_synsets('hate')))
#print(list(swn.senti_synsets('hate','v')))

# senti~ 단어가 부정적 긍정적 측도에서 몇점인지
#print(list(swn.senti_synsets('hate','v'))[0].pos_score())
#print(list(swn.senti_synsets('hate','v'))[0].neg_score())

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

print(nltk.pos_tag(['love']))

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
s1 = 'In the Echi dot, amazon has created a near perfect blend of hardware and software.'
s2 = 'The author dose a good job of presenting a wide range of psychological traps and irrational tendencies to which human fall prey'
s3 = 'pulp fiction is inane, self-indulgent, and bloated'

#print(sentence_sentiment_calculator(s1))
#print(sentence_sentiment_calculator(s2))
#print(sentence_sentiment_calculator(s3))


