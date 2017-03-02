class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @jobs = Job.where(user_id: @user.id)
  end
end
