class PostsController < ApplicationController
   before_action :authenticate_user!
  def index
    @sectors = Sector.where(role: current_user.roles).order(created_at: :asc)
  end
end


