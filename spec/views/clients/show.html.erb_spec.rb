require 'rails_helper'

RSpec.describe "clients/show", :type => :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :gender => "Gender",
      :age => "Age"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/Age/)
  end
end
