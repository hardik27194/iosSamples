#!/usr/bin/env python
# coding: UTF-8

import urllib2, json

dicH = {}
dicM = {}

'''
# http connection
url = "https://script.google.com/macros/s/AKfycbyLKoXh9uR6eD2pOsmZlGLZFv9pu7eK7AjReiu2eMhYmWntwFE/exec"
response = urllib2.urlopen(url);

# json parse 
jsonData = json.loads(response.read())
'''

# テスト用データ
FILEIN = "jsondata.txt"
f = open(FILEIN, "r")
jsonData = json.load(f)
f.close



# key
for tableName in jsonData:
	#print "tableName :" + tableName 

	listH = []
	listM = []

	listH.append("#import \"RLMObject.h\"")
	listH.append("")
	listH.append("@class " + tableName + ";")
	listH.append("")
	listH.append("@interface " + tableName + " : RLMObject")
	listH.append("")

	# .m ファイル
	listM.append("#import \""+ tableName + ".h\"")
	listM.append("")
	listM.append("@implementation " + tableName)
	listM.append("")
	listM.append("@end")

	table = jsonData[tableName]
	for columnObj in table:
		#print "--"
		if columnObj['type'] == "NSString":
			listH.append("@property " + columnObj['type'] +" *"+ columnObj['name'] + ";")
		else:
			listH.append("@property " + columnObj['type'] +" "+ columnObj['name'] + ";")

	listH.append("")
	listH.append("@end")

	dicH[tableName] = listH
	dicM[tableName] = listM

# 出力 .h
for key in dicH:
	wf = open('./Ankimo/Model/DB/' + key + '.h','w')
	print 'output : ' + key + '.h'
	for line in dicH[key]:
		tmp = line + "\n"
		wf.writelines(tmp)
	wf.close()

# 出力 .m
for key in dicM:
	wf = open('./Ankimo/Model/DB/' + key + '.m','w')
	print 'output : ' + key + '.m'
	for line in dicM[key]:
		tmp = line + "\n"
		wf.writelines(tmp)
	wf.close()
