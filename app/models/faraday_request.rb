class FaradayRequest

  def initialize(url = 'https://jsonplaceholder.typicode.com')
    @url = url
  end

  def title
    response.body['title']
  end

  def body
    response.body
  end

  def headers
    response.headers
  end

  def status
    response.status
  end

  def posts_response
    response = connection.get('/posts/1')
  end

  def connection
    Faraday.new(url: @url) do |conn|
      conn.request :url_encoded
      conn.response :json, content_type: /\bjson$/
      conn.adapter Faraday.default_adapter
    end
  end
end
