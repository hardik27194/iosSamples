
import urllib2, json


'''
# http connection
url = "https://script.google.com/macros/s/AKfycbyLKoXh9uR6eD2pOsmZlGLZFv9pu7eK7AjReiu2eMhYmWntwFE/exec"
response = urllib2.urlopen(url);
*/

# json parse 
jsonData = json.loads(response.read())


'''

FILEIN = "jsondata.txt"
f = open(FILEIN, "r")
jsonData = json.load(f)
f.close




# key
for tableName in jsonData:
	print tableName 
	print "---------"
	table = jsonData[tableName]
	for columnObj in table:
		#print columnObj
		for key3 in columnObj:
			print columnObj[key3]



