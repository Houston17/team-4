json.extract! event, :id, :description, :client_id, :created_at, :updated_at
json.url event_url(event, format: :json)
