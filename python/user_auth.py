import requests
import os

url_items = "https://calm-coast-93883.herokuapp.com/user/auth"

datas = [
    {"name": "gopher", "password": "go"},
    {"name": "test", "password": "TEST"},
]

for i in range(2):
    r_get = requests.get(url_items, params=datas[i])
    print(r_get.text)