require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Entry do
  before(:each) do
    @valid_attributes = {
      :position => "1",
      :plan_id => "1",
      :start_time => Time.now,
      :phase => "value for phase",
      :type => "value for type",
      :remote_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Entry.create!(@valid_attributes)
  end
end
