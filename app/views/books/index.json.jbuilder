json.array!(@books) do |book|
  json.extract! book, :id, :title, :short_description, :description, :price, :cr_id, :sample_url, :isbn, :cover_image, :format_type, :drm_id, :author, :distribution_model
  json.url book_url(book, format: :json)
end
