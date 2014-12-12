require 'rails_helper'

RSpec.describe "stats/new", :type => :view do
  before(:each) do
    assign(:stat, Stat.new(
      :name => "MyString",
      :age => 1,
      :height_in_inches => "MyString",
      :integer => "MyString",
      :weight => 1,
      :wellness_goals => "MyString"
    ))
  end

  it "renders new stat form" do
    render

    assert_select "form[action=?][method=?]", stats_path, "post" do

      assert_select "input#stat_name[name=?]", "stat[name]"

      assert_select "input#stat_age[name=?]", "stat[age]"

      assert_select "input#stat_height_in_inches[name=?]", "stat[height_in_inches]"

      assert_select "input#stat_integer[name=?]", "stat[integer]"

      assert_select "input#stat_weight[name=?]", "stat[weight]"

      assert_select "input#stat_wellness_goals[name=?]", "stat[wellness_goals]"
    end
  end
end
