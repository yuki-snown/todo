json.extract! task, :id, :admin, :worker, :do, :status, :created_at, :updated_at
json.url task_url(task, format: :json)
