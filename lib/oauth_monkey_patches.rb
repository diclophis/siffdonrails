#

module OAuth::Client
  class Helper
    def oauth_parameters
      {
        'oauth_consumer_key'     => options[:consumer].key,
        #'oauth_token'            => options[:token] ? options[:token].token : '',
        'oauth_signature_method' => options[:signature_method],
        'oauth_timestamp'        => timestamp,
        'oauth_nonce'            => nonce,
        'oauth_version'          => '1.0'
      }
    end

    def header
      parameters = oauth_parameters
      parameters.merge!( { 'oauth_signature' => signature( options.merge({ :parameters => parameters }) ) } )
      header_params_str = parameters.map { |k,v| "#{k}=\"#{escape(v)}\"" }.join(', ')
      #return "OAuth realm=\"#{options[:realm]||''}\", #{header_params_str}"
      return "OAuth #{header_params_str}"
    end
  end
end

class Net::HTTPRequest
  def oauth!(http, consumer = nil, token = nil, options = {})
    options = { :request_uri => oauth_full_request_uri(http),
                :consumer => consumer,
                #:token => token,
                :scheme => 'header',
                :signature_method => nil,
                :nonce => nil,
                :timestamp => nil }.merge(options)

    @oauth_helper = OAuth::Client::Helper.new(self, options)
    self.send("set_oauth_#{options[:scheme]}")
  end

  def signature_base_string(http, consumer = nil, token = nil, options = {})
    options = { :request_uri => oauth_full_request_uri(http),
                :consumer => consumer,
                #:token => token,
                :scheme => 'header',
                :signature_method => nil,
                :nonce => nil,
                :timestamp => nil }.merge(options)

    OAuth::Client::Helper.new(self, options).signature_base_string
  end
end
