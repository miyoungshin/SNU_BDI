from splinter import Browser
browser = Browser('chrome')
browser.visit('http://dictionary.cambridge.org/dictionary/learner-english/python')
browser.fill('q','java')
button = brower.find_by_xpath('//*[@class="cdo-search__button"]')
button.click()