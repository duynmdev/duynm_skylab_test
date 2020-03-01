module Api
  class EventLogsController < ApplicationController
    include Swagger::Blocks
    swagger_path '/event_logs' do
      operation :post do
        key :summary, 'Create Event Logs'
        key :description, 'Creates the event specified in the params'
        key :operationId, 'addEventLog'
        key :produces, ['application/json']
        key :tags, [
          'Event Logs'
        ]
        parameter do
          key :name, :event_name
          key :in, :body
          key :description, 'Event name'
          key :required, true
          key :type, :string
        end

        parameter do
          key :name, :timestamp
          key :in, :body
          key :description, 'Event time'
          key :required, true
          key :type, :string
        end
        response 202 do
          key :description, 'events response'
          schema do
            key :'$ref', :EventLog
          end
        end

        response :default do
          key :description, 'unexpected error'
          schema do
            key :'$ref', :ErrorModel
          end
        end
      end
    end
  end

  def create
  end

  private
    def event_params
      params.permit(:event_name, :timestamp)
    end
end