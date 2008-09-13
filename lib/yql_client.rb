
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

  def open
    @consumer = OAuth::Consumer.new(@config['consumer_key'], @config['shared_secret'], {:http_method => :get})
    @http = Net::HTTP.new('query.yahooapis.com')
  end

  def query (sql)
    query_string = {:q => sql, :format => "json"}.map do |k, v|
      "#{k}=#{URI.escape(v).gsub("=", "%3D").gsub("'", "%22")}"
    end.join("&")

    url = "/v1/yql?#{query_string}"
    puts url
    @request = Net::HTTP::Get.new(url)
    @request.oauth!(@http, @consumer, nil)
    Net::HTTP.start('query.yahooapis.com', 80) { |http|
      response = http.request(@request)
      case response
        when Net::HTTPOK
          @errno = 0
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

  def stat
    true
  end

  def version
    1
  end
end

#this works
=begin
    @consumer = OAuth::Consumer.new(@config['consumer_key'], @config['shared_secret'], {:http_method => :get})
    @http = Net::HTTP.new('query.yahooapis.com')
    @request = Net::HTTP::Get.new('/v1/yql?q=show%20tables&format=json')
    @request.oauth!(@http, @consumer, nil)
    Net::HTTP.start('query.yahooapis.com', 80) {|http|
      r = http.request(@request)
      puts r.inspect
      puts r.read_body.inspect
    }
=end

#none of this works
#puts @consumer.inspect
#puts @http.inspect
#puts @req.inspect
#puts @token.inspect
#php [0] => Authorization: OAuth oauth_version="1.0",oauth_nonce="8d95c32b157a7404d7e8664e15cb39ad",oauth_timestamp="1221316633",oauth_consumer_key="dj0yJmk9OHZNS1RtZFJERnY2JmQ9WVdrOWQzcHRPR1JVTXpnbWNHbzlNVFV6T0RnNE5EY3dOQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD0zMA--",oauth_signature_method="HMAC-SHA1",oauth_signature="A%2BDhNClJErtdZSmnN8jta%2FdHvWg%3D"
#
#OAuth realm="", oauth_nonce="pXAwYgVZvwEeKR1cxIfyVwjEfszH4HAQa0n2jgDPk", oauth_signature_method="HMAC-SHA1", oauth_token="", oauth_timestamp="1221316911", oauth_consumer_key="dj0yJmk9OHZNS1RtZFJERnY2JmQ9WVdrOWQzcHRPR1JVTXpnbWNHbzlNVFV6T0RnNE5EY3dOQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD0zMA--", oauth_signature="HE9i2EMTfGUTyP3qcH8rXZmyn%2B0%3D", oauth_version="1.0"
#
#    puts @config.inspect
#    @consumer=OAuth::Consumer.new(@config['consumer_key'], @config['shared_secret'], {
#      :site => "http://query.yahooapis.com/",
#    })
#wang = @consumer.create_signed_request(:get, '/v1/yql?q=show%20tables&format=xml')
#
#puts wang.inspect
#@http = Net::HTTP.new('query.yahooapis.com')
#@req = Net::HTTP::Get.new('/v1/yql?q=show%20tables&format=xml')
#@token = OAuth::Token.new('', '')
#@req.oauth!(@http, @consumer, @token)
#
#@response = Net::HTTP.start('query.yahooapis.com', 80) {|http|
#  http.request(@req)
#}
#
#puts @response.inspect
#puts @response.inspect
#which sets the Authorization header:
#@req.oauth!(@http, @consumer, @token, :scheme => 'query_string')
#setting the scheme to 'query_string' adds the parameters to the query
#string. Alternatively (for POSTs) you can set the request body with :scheme => 'body'.
#req.path
=begin
    @consumer=OAuth::Consumer.new(@config['consumer_key'], @config['shared_secret'], {
      :site => "http://query.yahooapis.com/v1/yql",
      :http_method=>:get,
      #:site => "http://query.yahooapis.com/"
      #:site => "https://api.login.yahoo.com/",
      :request_token_path => "/v1/yql",
      #:access_token_path => "/oauth/v2/get_token",
      #:authorize_path => "/oauth/v2/request_auth"
    })
    #@helper = OAuth::Client::Helper.new
    @request_token = @consumer.get_request_token
=end
