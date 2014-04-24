class SalesforceUsersController < ApplicationController
  def index
    salesforce_client
    user_class = @client.materialize("User")
    @users = User.all
  end

  def show
    salesforce_client
    user_class = @client.materialize("User")
    @user = User.find_by_Id(params[:id])
  end

  private

  def salesforce_client
    @client = Databasedotcom::Client.new client_id: ENV['DATABASEDOTCOM_CLIENT_ID'], client_secret: ENV['DATABASEDOTCOM_CLIENT_SECRET']
    @client.authenticate :username => ENV['DATABASEDOTCOM_CLIENT_USERNAME'], :password => ENV['DATABASEDOTCOM_CLIENT_AUTHENTICATE_PASSWORD']
  end
end
