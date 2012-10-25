require 'spec_helper'

describe "news/new" do
  before(:each) do
    assign(:news, stub_model(News,
      :text => "MyText",
      :character => nil
    ).as_new_record)
  end

  it "renders new news form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => news_index_path, :method => "post" do
      assert_select "textarea#news_text", :name => "news[text]"
      assert_select "input#news_character", :name => "news[character]"
    end
  end
end
