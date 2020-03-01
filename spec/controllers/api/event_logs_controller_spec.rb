require 'rails_helper'

RSpec.describe ::Api::EventLogsController, type: :'request' do
  let(:event_log_params) {
    {
      event_name: Faker::Name.name,
      timestamp: Time.now
    }
  }

  let(:invalid_params) {
    {
      event_name: Faker::Name.name
    }
  }

  describe "#create" do
    context "when valid params" do
      it "should create" do
        post "/api/event_logs", headers: {}, params: event_log_params
        json_response = JSON.parse(response.body)
        expect(json_response["status"]).to be true
      end
    end

    context "when invalid params" do
      it "should not create, return errors message" do
        post "/api/event_logs", headers: {}, params: invalid_params
        json_response = JSON.parse(response.body)
        expect(json_response["status"]).to be false
      end
    end
  end
end