require 'rails_helper'

RSpec.describe "resources/show", :type => :view do
  before(:each) do
    @resource = assign(:resource, Resource.create!(
      :title => "Title",
      :medium => "Medium",
      :year => 1,
      :keywords => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Medium/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
  end
end
