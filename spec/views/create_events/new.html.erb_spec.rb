require 'rails_helper'

RSpec.describe "events/new", :type => :view do
  before(:each) do
    assign(:create_event, CreateEvent.new(
      :name => "MyString",
      :start_at => "MyString",
      :end_at => "MyString"
    ))
  end

  it "renders new create_event form" do
    render

    assert_select "form[action=?][method=?]", create_events_path, "post" do

      assert_select "input#create_event_name[name=?]", "create_event[name]"

      assert_select "input#create_event_start_at[name=?]", "create_event[start_at]"

      assert_select "input#create_event_end_at[name=?]", "create_event[end_at]"
    end
  end
end
