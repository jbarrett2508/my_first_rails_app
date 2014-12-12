require 'rails_helper'

RSpec.describe "foos/new", :type => :view do
  before(:each) do
    assign(:foo, Foo.new(
      :first_name => "MyString",
      :last_name => "MyString"
    ))
  end

  it "renders new foo form" do
    render

    assert_select "form[action=?][method=?]", foos_path, "post" do

      assert_select "input#foo_first_name[name=?]", "foo[first_name]"

      assert_select "input#foo_last_name[name=?]", "foo[last_name]"
    end
  end
end
