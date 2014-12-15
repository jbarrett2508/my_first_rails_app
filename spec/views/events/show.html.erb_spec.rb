require 'rails_helper'

RSpec.describe "events/show", :type => :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :name => "Name",
      :date => "Date"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Date/)
  end
end
