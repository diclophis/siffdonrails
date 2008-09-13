require 'oauth/consumer'
require 'oauth/client/net_http'

class YqlClient
  attr_accessor :consumer

  def initialize
    @config = YAML.load_file("#{RAILS_ROOT}/config/yahoo.yml")['yahoo']
    @consumer=OAuth::Consumer.new(@config['consumer_key'], @config['shared_secret'], {
      :site => "http://query.yahooapis.com/",
    })
wang = @consumer.create_signed_request(:get, '/v1/yql?q=show%20tables&format=xml')

puts wang.inspect



@http = Net::HTTP.new('query.yahooapis.com')
@req = Net::HTTP::Get.new('/v1/yql?q=show%20tables&format=xml')
@token = OAuth::Token.new('', '')
#then, configure OAuth for the request:
@req.oauth!(@http, @consumer, @token)

@response = Net::HTTP.start('query.yahooapis.com', 80) {|http|
  http.request(@req)
}

puts @response.inspect
puts @response.inspect
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
  end
  
  def close

  end

  def errno
    return 0
  end

  def open

  end

  def query(sql_frag)

  end

  def quote

  end

  def stat
    
  end

  def version
    "0.0.1"
  end

end
