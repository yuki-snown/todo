import requests
import os

url_items = "https://calm-coast-93883.herokuapp.com/user/new"

datas = [
    {"name": "gopher", "password": "go"},
    {"name": "pythonista", "password": "python"},
    {"name": "myrails", "password": "ruby"}
]

base_path = "./image"
files = os.listdir(base_path)
image = {}
for f in files:
    f_name = base_path + "\\" +  f
    image[f] = open(f_name, "rb")

files = [
    {
        "image": image["image1.jpg"],
    },
    {
        "image": image["image2.jpg"],
    },
    {
        "image": image["image3.jpg"],
    }
]


for i in range(3):
    r_get = requests.post(url_items, params=datas[i], files=files[i])
    print(r_get.text)