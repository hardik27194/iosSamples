import requests

s = requests.session()

params = {
    'name': 'your user id',
    'password': 'your password',
}
#r =  s.post('https://script.googleusercontent.com/macros/echo?user_content_key=p4nUEhKwpxj1bBxOmj1w79N-pXB1AUFSrDgiP0JYrW14xY3lz972M7fEY-zY3B-XigHxFu0POHF68ZFXxS29TMANBr-SYR8im5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnBoXqDG6mD85Vr5dGeo9eX1icFkqWD3bv3VmgKuaHigY_aHyJrBNemVbn4NF78PC3aOIp7sEUsJ2&lib=M3NzqnhZLLdw1j02S0rOSDELtCVDiixkz', params=params)
r =  s.post('https://script.google.com/macros/s/AKfycbyLKoXh9uR6eD2pOsmZlGLZFv9pu7eK7AjReiu2eMhYmWntwFE/exec')

print r.text

