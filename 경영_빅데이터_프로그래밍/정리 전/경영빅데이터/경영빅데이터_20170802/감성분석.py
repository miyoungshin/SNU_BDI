# http://sentiwordnet.isti.cnr.it 
# http://blackbird.dcc.ufmg.br:1210  감성분석 관련 사이트
# 한글 감성분석 잘 안되어 있음
# 감성분석은 1. 감정 2. 부정(가중치가 없음) 3. 강조

# 알고리즘 개발이 목적

def parse_input(str):
	'''Parse the given sentence and store it to a list 

	str.........: sentence(string)
	Return......: a list of words
	'''
	import re
	str = re.sub(r'[?!;,.]', '',str) # 기호를 다 없애고
	str = str.lower()  # 모든 단어를 소문자로
	words = str.split(' ') # 단어 하나하나를 리스트에 집어 넣는것

	return words
	# 데이터를 따로 저장하려면 json 또는 open/write로 따로 txt 파일로 저장 하면 됨

def parse_weight(fname):
	'''Parse boosters and their weights

	fname........: file containing boosters list
	Return.......: a dictionary containing boosters as keys and thier weights as values

	'''
	w = {}
	f= open(fname, 'r')

	for line in f:
		rule = line.split('\t')
		w[rule[0]] = int(rule[1])

	return w

def parse_negate(fname) :
	'''Parse parse_negators

	fname........: file containing negators list
	Return.......: a list of negators
	'''
	w = []

	f= open(fname,'r')

	w = f.read().splitlines() # 쓸때 없는 요소를 다 없애주는

	return w

def weight_default(list_words, dic_weights):
	'''Set default weights of words

	list_words..: a list of words to be analyzed
	dic_weights.: a dictionary of words and their defaults weights
	              processed by parse_weight() using
	              EmotionLookupTable.txt
	Return......: a list of (word,weight) pairs
	'''
	l = []
	for word in list_words:
		if word in dic_weights:
			l.append((word, dic_weights[word]))
		else: # ~*로 끝나는 단어들을 처리하기 위한 코딩
			substr = word
			while substr != '':
				pat = substr + '*'
				if pat in dic_weights:
					l.append((word, dic_weights[pat]))
					break
				else :
					substr = substr[:-1] # 마지막 하나 빼는거
			if substr == '':
				l.append((word,0))
	return l

def weight_boost(list_pairs, dic_boost): # 부스트 단어를 확인하고 그 가중치 만큼을 추가하는 함수
	'''If any booster exists, appply the booster to the corresponding word

	list_pairs.: a list of (word, weight) processed by weight_default()
	dic_boost..: a dictionary processed by parse_weight() using
				 BoosterWordList.txt
	Return.....: a list of boosted (word,weight) pairs
	'''

	l = []
	boost = 0
	for p in list_pairs:
		w = p[1]
		if boost != 0 :
			if w > 0 :
				w += boost
			elif w < 0:
				w -= boost
			l.append((p[0],w))
		else:
			l.append(p)
		if p[0] in dic_boost:
			boost = dic_boost[p[0]]
	return l

def weight_negate(list_pairs, list_negates): # I not happy / 긍정으로 볼것이냐 부정으로 볼것이냐 (부정어 처리 관련 issue)
	''' If any negator exists, apply the negator to the corresponding word

	list_pairs...: a list of (word, weight) processed by weight_boost()
				   which updates the weights
	list_negates.: a dictionary processed by parse_negate() using
				   NegatingWordList.txt
	Return.......: a list of negated (word,weight) pairs
	'''
	l = []
	negate = 0
	for p in list_pairs :
		w = p[1]
		if negate != 0:
			if w > 0 :
				if w % 2 == 1:
					w = (w + 1) * -0.5
				else :
					w *= -0.5
			else:
				w = 0
			negate = 0
			l.append((p[0], int(w)))
		else:
			l.append(p)
		if p[0] in list_negates:
			negate = 1
		return l

def extract_avg(list_pairs) :
	'''Extract average weights for words in the text

	list_pairs.: a list of (word, weight)
	Return.....: a tuple of (avg_positive, avg_negative)
	'''

	pos_sum = 0
	neg_sum = 0

	for p in list_pairs:
		if p[1] > 0:
			pos_sum += p[1]
		elif p[1] < 0 :
			neg_sum += p[1]
	pos_avg = pos_sum / len(list_pairs)
	neg_avg = neg_sum / len(list_pairs)

	return (pos_avg, neg_avg)

def senti(str):
	'''Aggregation of methods to get sentiment value
	(pos or neg strength) of words Input

	str........: any sentence
	Return.....: positive, negative strength
	'''


	#Parsing Rule
	w_emotion = parse_weight('EmotionLookupTable.txt')
	w_boost = parse_weight('BoosterWordList.txt')
	w_negate = parse_negate('NegatingWordList.txt')

	# Parse Input
	words = parse_input(str)
	# Weighting
	default = weight_default(words, w_emotion)
	boosted = weight_boost(default, w_boost)
	negated = weight_negate(boosted, w_negate)

	return extract_avg(negated)

print(senti("i am very not satisfied with my iphone but i think i will just go with it"))