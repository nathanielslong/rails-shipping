class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @jobs = Job.where(user_id: @user.id)
    @boats= Boat.where(user_id: @user.id)
  end
end
