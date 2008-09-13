require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class UpcomingCategory < YahooBase
  set_table_name "upcoming.category"
end

describe YahooBase do
  before(:all) do
    @model = UpcomingCategory.new
  end

  it 'should have attributes' do
    UpcomingCategory.columns.should_not be_empty
  end

  it 'should crap on this' do
    lambda {
      @model.wang = "chung"
    }.should raise_error
  end

  it 'should not crap on this' do
    lambda {
      @model.description = "cheese"
      @model.name = "cheese"
    }.should_not raise_error
  end

  it 'should die' do
   puts UpcomingCategory.find(:all, :conditions => ['name = ?',  'Music']).inspect
  end

  it 'should have find(:all)' do
    puts UpcomingCategory.find(:all).inspect
  end

  it 'should have finders' do
    # TODO: remove table names from the WHERE clauses, tail the test log for an example
    # TODO: select * from upcoming.events where id=someid does not work, use `where id=event_someid`
    puts UpcomingCategory.find_by_name("Music").inspect
  end
end
