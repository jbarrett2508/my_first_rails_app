require 'rails_helper'

RSpec.describe "profiles/new", :type => :view do
  before(:each) do
    assign(:profile, Profile.new(
      :name => "MyString",
      :age => 1,
      :height_in_inches => "MyString",
      :weight_in_lbs => 1,
      :wellness_goals => "MyString"
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input#profile_name[name=?]", "profile[name]"

      assert_select "input#profile_age[name=?]", "profile[age]"

      assert_select "input#profile_height_in_inches[name=?]", "profile[height_in_inches]"

      assert_select "input#profile_weight_in_lbs[name=?]", "profile[weight_in_lbs]"

      assert_select "input#profile_wellness_goals[name=?]", "profile[wellness_goals]"
    end
  end
end
