

class YqlClient
  attr_accessor :consumer, :config, :http, :request, :errno

  def initialize
    @config = YAML.load_file("#{RAILS_ROOT}/config/yahoo.yml")['yahoo']
    @errno = 0
  end
  
  def close
    @consumer = nil
    @http = nil
  end

  def encode_query_string(query_string)
    query_string.map { |k, v| "#{k}=#{raw_url_encode(v)}" }.join("&")
  end

  def open
    @consumer = OAuth::Consumer.new(@config['consumer_key'], @config['shared_secret'], {:http_method => :get})
    @http = Net::HTTP.new('query.yahooapis.com')
  end

  def query (sql)
    query_string = encode_query_string(:q => sql, :format => "json")
    url = "/v1/yql?#{query_string}"
    @request = Net::HTTP::Get.new(url)
    @request.oauth!(@http, @consumer, nil)

    Net::HTTP.start('query.yahooapis.com', 80) { |http|
      response = http.request(@request)
      case response
        when Net::HTTPOK
          @errno = 0
          #TODO
          #ActiveRecord::Base::logger.debug(response.read_body)
          json = ActiveSupport::JSON.decode(response.read_body)
          return json
      else
        @errno = -1
      end
    }
  end

  def quote (string)
    string
  end

  def raw_url_encode(url)
    CGI.escape(url).gsub("+", "%20")
  end

  def stat
    true
  end

  def version
    1
  end
end

