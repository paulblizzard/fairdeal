json.extract! answer, :id, :title, :content, :question_id, :created_at, :updated_at
json.url answer_url(answer, format: :json)