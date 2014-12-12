require 'rails_helper'

RSpec.describe "stats/index", :type => :view do
  before(:each) do
    assign(:stats, [
      Stat.create!(
        :name => "Name",
        :age => 1,
        :height_in_inches => "Height In Inches",
        :integer => "Integer",
        :weight => 2,
        :wellness_goals => "Wellness Goals"
      ),
      Stat.create!(
        :name => "Name",
        :age => 1,
        :height_in_inches => "Height In Inches",
        :integer => "Integer",
        :weight => 2,
        :wellness_goals => "Wellness Goals"
      )
    ])
  end

  it "renders a list of stats" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Height In Inches".to_s, :count => 2
    assert_select "tr>td", :text => "Integer".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Wellness Goals".to_s, :count => 2
  end
end
