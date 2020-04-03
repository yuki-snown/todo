import requests
from PIL import Image
import os
import wave
import io
import time

base_path = "image"
files = os.listdir(base_path)
image = {}
for f in files:
    f_name = base_path + "\\" +  f
    image[f] = open(f_name, "rb")

base_path = "sound"
files = os.listdir(base_path)
sound = {}
for f in files:
    f_name = base_path + "\\" +  f
    sound[f] = open(f_name, "rb")

datas = [
    {
        "user_id": 1,
        "title": "test1",
    },
    {
        "user_id": 2,
        "title": "test2",
    },
    {
        "user_id": 3,
        "title": "test3",
    },
    {
        "user_id": 1,
        "title": "test4",
    },
    {
        "user_id": 3,
        "title": "test5",
    }
]

files = [
    {
        "image": image["image1.jpg"],
        "sound": sound["sound1.mp3"]
    },
    {
        "image": image["image2.jpg"],
        "sound": sound["sound2.mp3"]
    },
    {
        "image": image["image3.jpg"],
        "sound": sound["sound3.mp3"]
    },
    {
        "image": image["image4.png"],
        "sound": sound["sound4.mp3"]
    },
    {
        "image": image["image5.jpg"],
        "sound": sound["sound5.mp3"]
    }
]

for i in range(len(datas)):
    url_items = 'https://fathomless-atoll-84580.herokuapp.com/resister'
    #url_items = 'http://127.0.0.1:3000/resister'
    r_get = requests.post(url_items, params=datas[i], files=files[i])
    time.sleep(1)
    print(r_get.text)
