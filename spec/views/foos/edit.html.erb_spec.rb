require 'rails_helper'

RSpec.describe "foos/edit", :type => :view do
  before(:each) do
    @foo = assign(:foo, Foo.create!(
      :first_name => "MyString",
      :last_name => "MyString"
    ))
  end

  it "renders the edit foo form" do
    render

    assert_select "form[action=?][method=?]", foo_path(@foo), "post" do

      assert_select "input#foo_first_name[name=?]", "foo[first_name]"

      assert_select "input#foo_last_name[name=?]", "foo[last_name]"
    end
  end
end
