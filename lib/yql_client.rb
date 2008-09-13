require 'oauth/consumer'

class YqlClient
  attr_accessor :consumer

  def initialize
    @config = YAML.load_file("#{RAILS_ROOT}/config/yahoo.yml")['yahoo']
    @consumer=OAuth::Consumer.new(@config['consumer_key'], @config['shared_secret'], {
      :site => "https://api.login.yahoo.com/",
      :request_token_path => "/oauth/v2/get_request_token",
      :access_token_path => "/oauth/v2/get_token",
      :authorize_path => "/oauth/v2/request_auth"
      })
    @request_token = @consumer.get_request_token
  end
  
  def close

  end

  def errorn

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
