require 'spec_helper'

describe "members/show" do
  before(:each) do
    @member = assign(:member, stub_model(Member,
      :name => "Name",
      :url => "Url",
      :remarks => "Remarks",
      :active => "",
      :reward_cycle => ""
    ))
    assign(:jobs, [stub_model(Job,
      :name => "Job",
      )]
    )
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Url/)
    rendered.should match(/Remarks/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
