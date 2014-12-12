require 'rails_helper'

RSpec.describe "clients/edit", :type => :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :gender => "MyString",
      :age => "MyString"
    ))
  end

  it "renders the edit client form" do
    render

    assert_select "form[action=?][method=?]", client_path(@client), "post" do

      assert_select "input#client_first_name[name=?]", "client[first_name]"

      assert_select "input#client_last_name[name=?]", "client[last_name]"

      assert_select "input#client_gender[name=?]", "client[gender]"

      assert_select "input#client_age[name=?]", "client[age]"
    end
  end
end
