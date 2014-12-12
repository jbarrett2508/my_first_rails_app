require 'rails_helper'

RSpec.describe "events/index", :type => :view do
  before(:each) do
    assign(:events, [
      CreateEvent.create!(
        :name => "Name",
        :start_at => "Start At",
        :end_at => "End At"
      ),
      CreateEvent.create!(
        :name => "Name",
        :start_at => "Start At",
        :end_at => "End At"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Start At".to_s, :count => 2
    assert_select "tr>td", :text => "End At".to_s, :count => 2
  end
end
