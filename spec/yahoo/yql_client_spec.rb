require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe YqlClient do
  before(:all) do
    @yql_client = YqlClient.new
  end

  it 'should open a connection' do
    @yql_client.open
  end

  it 'should close a connection' do
    @yql_client.close
  end

  it 'should quote input variables' do
    @yql_client.quote("\"\"!@$%^&*()")
  end

  it 'should respond to errno with something that responds to zero?' do
    @yql_client.errno.zero?
  end

  it 'should query with a statement' do
    @yql_client.open
    json = @yql_client.query("show tables")
    puts json.inspect
    json = @yql_client.query("select * from flickr.photos.search where text='Cat' limit 10")
    # /v1/yql?q=select%20*%20from%20flickr.photos.search%20where%20text%3D%22Cat%22%20limit%2010&format=xml
    # /v1/yql?q=select%20*%20from%20flickr.photos.search%20where%20text%3D%22Cat%22%20limit%2010
    puts json.inspect
  end

  it 'should respond to stat with a boolean' do
    @yql_client.stat
  end

  it 'should have an version' do
    @yql_client.version
  end
end
