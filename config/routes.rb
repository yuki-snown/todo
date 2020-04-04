	Rails.application.routes.draw do

  get "admin" => "admins#index"

  get "admin/auth" => "admins#auth"

  get "admin/icon" => "admins#icon"

  post "admin/new" => "admins#add"
  
  
  

  get "user" => "users#index"

  get "user/rank" => "users#rank"

  get "user/auth" => "users#auth"

  get "user/icon" => "users#icon"

  get "user/update" => "users#update_progress" 

  post "user/new" => "users#add" 
  
  
  

  get "task" => "tasks#index"

  get "task/yet" => "tasks#yet_task"

  get "task/progress" => "tasks#progress"

  post "task/add" => "tasks#add"

  post "task/update" => "tasks#update_status"

end
