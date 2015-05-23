class LikesController < ApplicationController
  def create
    @liked = params[:likeable_type].capitalize.constantize.find(params[:likeable_id])
    if current_user.like!(@liked)
      flash[:success] = "Liked!"
      redirect_to :back
    else
      flash[:error] = "Error"
      redirect_to :back
    end
  end
end
