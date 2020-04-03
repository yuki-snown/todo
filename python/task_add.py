import requests
import os

#url_items = 'https://fathomless-atoll-84580.herokuapp.com/admin/new'
url_items = "http://127.0.0.1:3000/task/add"

datas = [
    {"worker": "gopher", "admin": "pythonista", "do": "ねむ"},
    {"worker": "myrails", "admin": "gopher", "do":"だるう"},
]

for i in range(2):
    r_get = requests.post(url_items, params=datas[i])
    print(r_get.text)