require 'rails_helper'

RSpec.describe "clients/index", :type => :view do
  before(:each) do
    assign(:clients, [
      Client.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :gender => "Gender",
        :age => "Age"
      ),
      Client.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :gender => "Gender",
        :age => "Age"
      )
    ])
  end

  it "renders a list of clients" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "Age".to_s, :count => 2
  end
end
