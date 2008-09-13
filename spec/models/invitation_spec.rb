require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Invitation do
  before(:each) do
    @valid_attributes = {
      :plan_id => "1",
      :person_id => "1",
      :status => "value for status"
    }
  end

  it "should create a new instance given valid attributes" do
    Invitation.create!(@valid_attributes)
  end
end
