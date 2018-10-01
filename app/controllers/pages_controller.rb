class PagesController < ApplicationController
  def home
  end

  def welcome
  	@user = User.find_by_username(params[:username])
    @messages = Message.where(role: current_user.roles).order(created_at: :asc)
  end
end
