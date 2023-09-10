class CatApiService

  def initialize(url="https://api.thecatapi.com/v1/")
    @url = url
  end

  def random_cat_image
    response = @conn.get('images/search')
    JSON.parse(response.body).first
  end

  def connection
    @conn = Faraday.new(url: @url) do |conn|
      conn.request :url_encoded
      conn.adapter Faraday.default_adapter
      conn.headers['x-api-key'] = ENV['CAT_API_KEY']
    end
  end
end
