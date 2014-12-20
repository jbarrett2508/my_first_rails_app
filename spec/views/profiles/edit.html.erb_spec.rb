require 'rails_helper'

RSpec.describe "profiles/edit", :type => :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :name => "MyString",
      :age => 1,
      :height_in_inches => "MyString",
      :weight_in_lbs => 1,
      :wellness_goals => "MyString"
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "input#profile_name[name=?]", "profile[name]"

      assert_select "input#profile_age[name=?]", "profile[age]"

      assert_select "input#profile_height_in_inches[name=?]", "profile[height_in_inches]"

      assert_select "input#profile_weight_in_lbs[name=?]", "profile[weight_in_lbs]"

      assert_select "input#profile_wellness_goals[name=?]", "profile[wellness_goals]"
    end
  end
end
