class ForumThreadsController < ApplicationController

  def create
    ForumThread.create(ft_params) if ft_params[:text].present?
    return redirect_to home_show_path(id: params[:id], page: params[:page]) if params[:id].present?
    return redirect_to home_path
  rescue => e
    return redirect_to home_path
  end

  private

  def ft_params
    params.require(:forum_thread).permit(:text, :parent_id)
  end
end
