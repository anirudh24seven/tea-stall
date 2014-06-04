json.array!(@cards) do |card|
  json.extract! card, :id, :poster_comment, :title, :description, :url, :poster, :count_read, :count_liked, :category, :image_url
  json.url card_url(card, format: :json)
end
