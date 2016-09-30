json.extract! work, :id, :isbn, :title, :author, :format, :pub_date, :pages, :created_at, :updated_at
json.url work_url(work, format: :json)