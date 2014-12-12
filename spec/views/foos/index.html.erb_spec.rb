require 'rails_helper'

RSpec.describe "foos/index", :type => :view do
  before(:each) do
    assign(:foos, [
      Foo.create!(
        :first_name => "First Name",
        :last_name => "Last Name"
      ),
      Foo.create!(
        :first_name => "First Name",
        :last_name => "Last Name"
      )
    ])
  end

  it "renders a list of foos" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
  end
end
