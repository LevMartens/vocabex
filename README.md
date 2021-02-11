# Vocabex

Vocabex is native IOS app that allows you to scan any page and filter out the most commonly used English words in order to help improve your English vocabulary.. The scanner comes from the Vision framework. 
Whenever a scan is made vision will read the page from the scan/photograph, then the page will be filtered through and you\'ll be left with the uncommon words that you can save in the app and study.

The words that will be filtered out are stored in Firebase FireStore and fetched on startup. 
The words that will be filtered are: the 5000 most common used words, 4000 common names, numbers, and close to 20.000 word forms derived from the 5000 most common words. 
After the scan completes, the words are presented and the user can choose to save the word, the words get saved in CoreData.

I am working on incorporating added features including: word definitions, word difficulty levels, notes and word favoriting, a personalised filter as well as a personalised English level tracker.
