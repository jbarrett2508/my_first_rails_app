require 'rails_helper'

RSpec.describe "stats/show", :type => :view do
  before(:each) do
    @stat = assign(:stat, Stat.create!(
      :name => "Name",
      :age => 1,
      :height_in_inches => "Height In Inches",
      :integer => "Integer",
      :weight => 2,
      :wellness_goals => "Wellness Goals"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Height In Inches/)
    expect(rendered).to match(/Integer/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Wellness Goals/)
  end
end
