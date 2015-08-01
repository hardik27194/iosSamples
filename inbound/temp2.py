#!/usr/bin/env python
# coding: UTF-8

import urllib2, json

list1 = []

'''

# http connection
url = "https://script.google.com/macros/s/AKfycbyLKoXh9uR6eD2pOsmZlGLZFv9pu7eK7AjReiu2eMhYmWntwFE/exec"
response = urllib2.urlopen(url);

# json parse 
jsonData = json.loads(response.read())

'''


FILEIN = "jsondata.txt"
f = open(FILEIN, "r")
jsonData = json.load(f)
f.close


list1.append("#import \"RLMObject.h\"")
list1.append("")
list1.append("@class Person;")
list1.append("")
list1.append("@interface Person : RLMObject")



# key
for tableName in jsonData:
	print "---------"
	print "tableName :" + tableName 
	table = jsonData[tableName]
	for columnObj in table:
		#print "--"
		if columnObj['type'] == "NSString":
			print "@property " + columnObj['type'] +" *"+ columnObj['name']
		else:
			print "@property " + columnObj['type'] +" "+ columnObj['name']


		'''
		for key3 in columnObj:
			print key3 +" : "+ columnObj[key3]
		'''

'''
f = open('./Ankimo/Model/Person.h','r')
for line in f:
	print line ,
'''

list1.append("@end")

for line in list1:
	print line 


