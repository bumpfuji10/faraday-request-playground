class CatApiService

  def initialize
    @conn = Faraday.new(url: "https://api.thecatapi.com/v1/") do |conn|
      conn.request :url_encoded
      conn.adapter Faraday.default_adapter
      conn.headers['x-api-key'] = ENV['CAT_API_KEY']
    end
  end

  def random_cat_image
    response = @conn.get('images/search')
    JSON.parse(response.body).first
  end
end
