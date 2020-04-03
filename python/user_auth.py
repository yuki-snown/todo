import requests
import os

#url_items = 'https://fathomless-atoll-84580.herokuapp.com/admin/new'
url_items = "http://127.0.0.1:3000/user/auth"

datas = [
    {"name": "gopher", "password": "go"},
    {"name": "test", "password": "TEST"},
]

for i in range(2):
    r_get = requests.get(url_items, params=datas[i])
    print(r_get.text)