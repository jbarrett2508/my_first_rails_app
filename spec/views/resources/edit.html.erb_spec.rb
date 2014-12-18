require 'rails_helper'

RSpec.describe "resources/edit", :type => :view do
  before(:each) do
    @resource = assign(:resource, Resource.create!(
      :title => "MyString",
      :medium => "MyString",
      :year => 1,
      :keywords => "MyText"
    ))
  end

  it "renders the edit resource form" do
    render

    assert_select "form[action=?][method=?]", resource_path(@resource), "post" do

      assert_select "input#resource_title[name=?]", "resource[title]"

      assert_select "input#resource_medium[name=?]", "resource[medium]"

      assert_select "input#resource_year[name=?]", "resource[year]"

      assert_select "textarea#resource_keywords[name=?]", "resource[keywords]"
    end
  end
end
