
# coding: utf-8

# In[12]:

class PartTimer:
	'''A Simple Class'''
	hour_rate = 7500
	nickname = None # 아르바이트 학생마다 이름을 정해주려고
	def setnickname(self,name):
		self.nickname = name
		print('My nickname is', self.nickname)
	def whoareyou(self):
		return 'I am a Part-Timer'


# In[13]:

print(PartTimer.__doc__)

print(help(PartTimer))

PartTimer.nickname = 'Teddy'
print(PartTimer.hour_rate)
PartTimer.hour_rate = 10000
x = PartTimer()

print(PartTimer.hour_rate)

PartTimer.workplace = '113-dong'
print(PartTimer.workplace)

print(x.workplace)

x.major = 'MIS'
print(x.major)
x = PartTimer()
PartTimer.setnickname(x,'Teddybear')


# In[10]:

print(PartTimer.nickname)
print(x.setnickname)


# In[11]:

x.setnickname('PolarBear')


# In[28]:

class PartTimer:
    '''A Simple Class'''
    hour_rate = 7500
    nickname = None # 아르바이트 학생마다 이름을 정해주려고
    total_parttimers = 0
    def __init__(self,name):
        self.nickname = name
        def getnickname(self):
            return 'My nickname is' + self.nickname
        PartTimer.total_parttimers += 1
        print('My nickname is', self.nickname)


# In[29]:

x = PartTimer('Teddy')
y = PartTimer('arnor')

x.total_parttimers


# In[ ]:



