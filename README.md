# To Do

## DB設計

 - ## db.txt 
    データベースの設計定義書

<br>

## API samples
- ## python/ *.py
    - admin_auth.py         *admin認証
    - admin_new.py          *admin新規作成
    - task_add.py           *task新規作成
    - task_update.py        *task達成状況更新
    - user_auth.py          *user認証
    - user_new.py           *user新規作成
    
<br>

## APIエンドポイント

 - ## base URL
    - https://calm-coast-93883.herokuapp.com/

- ## Admin
    ### AdminUserの確認用API
    - method: GET
    - endpointURL: https://calm-coast-93883.herokuapp.com/admin
    - example: https://calm-coast-93883.herokuapp.com/admin

    ### AdminUserAuth認証用API
    - method: GET
    - endpointURL: https://calm-coast-93883.herokuapp.com/admin/auth
    - params = {"name": string, "password": string}   
    - example: https://calm-coast-93883.herokuapp.com/admin/auth?name=hoge&password=hogehoge

    ### AdminUserIconのURL取得用API
    - method: GET
    - endpointURL: https://calm-coast-93883.herokuapp.com/admin/icon
    - params = {"name": string}
    - example: https://calm-coast-93883.herokuapp.com/admin/icon?name=hoge

    ### AdminUserNewのユーザの新規作成用のAPI
    - method: POST
    - endpointURL: https://calm-coast-93883.herokuapp.com/admin/new
    - params = {"name": string , "password": string , "image": request.FILES }   
    - example: https://calm-coast-93883.herokuapp.com/admin/new?name=hoge&passowrd=hogehoge&icon=c:\test.png

<br>

- ## User
    ### Userの確認用API
    - method: GET
    - endpointURL: https://calm-coast-93883.herokuapp.com/user
    - example: https://calm-coast-93883.herokuapp.com/user

    ### UserRankの取得用API
    - method: GET
    - endpointURL: https://calm-coast-93883.herokuapp.com/user/rank
    - params = {"num": int }   
    - example: https://calm-coast-93883.herokuapp.com/user/rank?num=10

    ### UserAuth認証用API
    - mehtod: GET
    - endpointURL: https://calm-coast-93883.herokuapp.com/user/auth
    - params = {"name": string, "password": string }   
    - example: https://calm-coast-93883.herokuapp.com/user/auth?name=hoge&password=hogehoge

    ### UserIconのURL取得用API
    - mehtod: GET
    - endpointURL: https://calm-coast-93883.herokuapp.com/user/icon
    - params = {"name": string}
    - example: https://calm-coast-93883.herokuapp.com/user/icon?name=hoge

    ### Userの進捗の更新用API
    - mehtod: GET
    - endpointURL: https://calm-coast-93883.herokuapp.com/user/update
    - params = {"name": string, "progress": float}   
    - example: https://calm-coast-93883.herokuapp.com/user/update?name=hoge&preogress=10.0

    ### Userの新規作成用のAPI
    - mehtod: POST
    - endpointURL: https://calm-coast-93883.herokuapp.com/user/new
    - params = {"name": string, "password": string, "image": request.FILES } 
    - example: https://calm-coast-93883.herokuapp.com/user/new?name=hoge&passowrd=hogehoge&icon=c:\test.png

<br>

- ## Task
    ### Taskの確認用API
    - mehtod: GET    
    - endpointURL: https://calm-coast-93883.herokuapp.com/task
    - example: https://calm-coast-93883.herokuapp.com/task

    ### Taskの未消化の取得用のAPI
    - mehtod: GET
    - endpointURL: https://calm-coast-93883.herokuapp.com/task/yet
    - params = {"worker": string}   
    - example: https://calm-coast-93883.herokuapp.com/task/yet?worker=hoge
    
    ### Taskの進捗の取得用のAPI
    - mehtod: GET
    - endpointURL: https://calm-coast-93883.herokuapp.com/task/progress
    - params = {"worker"; string}   
    - example: https://calm-coast-93883.herokuapp.com/task/progress
    
    ### Taskの新規作成用のAPI
    - mehtod: POST
    - endpointURL: https://calm-coast-93883.herokuapp.com/task/add
    - params = {"admin": string, "worker": string, "do": string}   
    - example: https://calm-coast-93883.herokuapp.com/task/add?admin=hoge&worker=hoge&do=hogehogehoge
    
    ### Taskの更新用のAPI
    - mehtod: POST
    - endpointURL: https://calm-coast-93883.herokuapp.com/task/update
    - params = {"id": int, "status": bool}   *bool = "true" or "false"
    - example: https://calm-coast-93883.herokuapp.com/task/update?id=1&status=true
