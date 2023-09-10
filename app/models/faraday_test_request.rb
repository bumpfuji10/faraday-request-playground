class FaradayTestRequest

  def initialize(url = 'https://jsonplaceholder.typicode.com')
    @url = url
  end

  def title
    posts_response.body['title']
  end

  def body
    posts_response.body
  end

  def headers
    posts_response.headers
  end

  def status
    posts_response.status
  end

  def posts_response
    @posts_response ||= connection.get('/posts/1')
  end

  def connection
    Faraday.new(url: @url) do |conn|
      conn.request :url_encoded
      conn.response :json, content_type: /\bjson$/
      conn.adapter Faraday.default_adapter
    end
  end
end
