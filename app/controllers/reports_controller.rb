class ReportsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :athenticate_server
  def handle
    render json: { message: 'testing' }
  end

  def athenticate_server
    code_name = request.headers['X-Server-CodeName']
    server = Server.find_by(code_name: code_name)
    access_token = request.headers['X-Server-Token']
    unless server && server.access_token == access_token
      render json: { message: 'Wrong Credentials' }
    end
  end
end
