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

	listH = []

	listH.append("import Realm")
	listH.append("import ObjectMapper")
	listH.append("")
	listH.append("class " + tableName + ": RLMObject, Mappable {")
	listH.append("")

	table = jsonData[tableName]
	for columnObj in table:
		#print "--"
		if columnObj['type'] == "string":
			listH.append("	dynamic var "+ columnObj['name'] + ": String = \"\"")
		elif columnObj['type'] == "int":
			listH.append("	dynamic var "+ columnObj['name'] + ": Int = 0")
		elif columnObj['type'] == "bool":
			listH.append("	dynamic var "+ columnObj['name'] + ": Bool = false")
		else:
			listH.append("	dynamic var "+ columnObj['name'] + ": Bool = false")

	listH.append("")
	listH.append("    override init!() {")
	listH.append("        super.init()")
	listH.append("    }")
	listH.append("")
	listH.append("    required convenience init?(_ map: Map) {")
	listH.append("        self.init()")
	listH.append("        mapping(map)")
	listH.append("    }")
	listH.append("")

	listH.append("    func mapping(map: Map) {")
	for columnObj in table:
		listH.append("        "+ columnObj['name'] + "    <- map[\"" + tableName + "." + columnObj['name'] + "\"]")

	listH.append("    }")

	listH.append("}")

	dicH[tableName] = listH

# 出力 .h
for key in dicH:
	wf = open('./Ankimo/Model/DB/' + key + '.swift','w')
	print 'output : ' + key + '.swift'
	for line in dicH[key]:
		tmp = line + "\n"
		wf.writelines(tmp)
	wf.close()
