json.extract! response, :id, :title, :content, :question_id, :created_at, :updated_at
json.url response_url(response, format: :json)