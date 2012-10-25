require 'spec_helper'

describe "news/edit" do
  before(:each) do
    @news = assign(:news, stub_model(News,
      :text => "MyText",
      :character => nil
    ))
  end

  it "renders the edit news form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => news_index_path(@news), :method => "post" do
      assert_select "textarea#news_text", :name => "news[text]"
      assert_select "input#news_character", :name => "news[character]"
    end
  end
end
