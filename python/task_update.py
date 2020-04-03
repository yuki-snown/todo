import requests
import os

#url_items = 'https://fathomless-atoll-84580.herokuapp.com/admin/new'
url_items = "http://127.0.0.1:3000/task/update"

datas = [
    {"id": "1", "status": "true"},
    {"id": "2", "status": "true"},
    {"id": "3", "status": "true"},
    {"id": "4", "status": "true"},
]

for i in range(4):
    r_get = requests.post(url_items, params=datas[i])
    print(r_get.text)