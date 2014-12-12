require 'rails_helper'

RSpec.describe "CreateEvents", :type => :request do
  describe "GET /events" do
    it "works! (now write some real specs)" do
      get create_events_path
      expect(response).to have_http_status(200)
    end
  end
end
