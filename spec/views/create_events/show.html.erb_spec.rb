require 'rails_helper'

RSpec.describe "events/show", :type => :view do
  before(:each) do
    @create_event = assign(:create_event, CreateEvent.create!(
      :name => "Name",
      :start_at => "Start At",
      :end_at => "End At"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Start At/)
    expect(rendered).to match(/End At/)
  end
end
