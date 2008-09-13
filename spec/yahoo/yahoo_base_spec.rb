require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class UpcomingCategory < YahooBase
  set_table_name "upcoming.category"
end

describe YahooBase do
  before(:all) do
    @model = UpcomingCategory.new
  end

  it 'should have attributes' do
    puts UpcomingCategory.columns
  end

  it 'should crap on this' do
    lambda {
      @model.wang = "chung"
    }.should raise_error
  end

  it 'should not crap on this' do
    @model.description = "cheese"
    @model.name = "cheese"
  end
end
