require 'spec_helper'

describe "UriEligibilityValidator" do
  before(:each) do
    @validator = UriEligibilityValidator.new({attributes: {}})
    @mock = double('model')
    @mock.stub("errors").and_return([])
    @mock.errors.stub('[]').and_return({})  
    @mock.errors[].stub('<<')
  end

  it "should validate valid uri strings" do
    @mock.should_not_receive('errors')    
    @validator.validate_each(@mock, "uri_field", "Claquesous #371's -+ Coth_Valania")
  end

  it "should validate invalid uri strings" do
    @mock.errors[].should_receive('<<')
    @validator.validate_each(@mock, "uri_field", '#?@&/')
  end  
end
