import requests
import os

url_items = "https://calm-coast-93883.herokuapp.com/task/add"

datas = [
    {"worker": "gopher", "admin": "pythonista", "do": "ねむ"},
    {"worker": "myrails", "admin": "gopher", "do":"だるう"},
]

for i in range(2):
    r_get = requests.post(url_items, params=datas[i])
    print(r_get.text)