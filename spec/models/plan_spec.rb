require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Plan do
  it 'should belong to a person' do
    p = Factory :person
    plan = Factory :plan, :person => p
    plan.person.should == p
  end
end
