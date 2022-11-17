json.extract! recipelist, :id, :name, :preparation_time, :cooking_time, :description, :public, :created_at, :updated_at
json.url recipelist_url(recipelist, format: :json)
