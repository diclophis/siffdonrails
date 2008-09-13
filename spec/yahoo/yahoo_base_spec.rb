require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module ActiveRecord
  module Calculations #:nodoc:
    module ClassMethods
      protected

      def construct_calculation_sql(operation, column_name, options) #:n
      end
    end
  end
end

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
    UpcomingCategory.find :all, :conditions => {:name => 'music'}
  end
end
