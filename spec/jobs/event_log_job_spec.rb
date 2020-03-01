require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe EventLogJob, type: :job do
  let(:job_params) {
    {
      event_name: Faker::Name.name,
      timestamp: Time.now
    }
  }

  describe "#perform_async" do
    it "should create job" do
      expect {
        EventLogJob.perform_async(job_params)
      }.to change(EventLogJob.jobs, :size).by(1)
    end
  end

  describe "#perform_now" do
    it "should create job and create event log" do
      expect(EventLog.count).to eq(0)
      EventLogJob.new.perform(job_params)
      expect(EventLog.count).to eq(1)
    end
  end
end