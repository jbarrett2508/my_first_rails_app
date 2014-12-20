require 'rails_helper'

RSpec.describe "profiles/index", :type => :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        :name => "Name",
        :age => 1,
        :height_in_inches => "Height In Inches",
        :weight_in_lbs => 2,
        :wellness_goals => "Wellness Goals"
      ),
      Profile.create!(
        :name => "Name",
        :age => 1,
        :height_in_inches => "Height In Inches",
        :weight_in_lbs => 2,
        :wellness_goals => "Wellness Goals"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Height In Inches".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Wellness Goals".to_s, :count => 2
  end
end
