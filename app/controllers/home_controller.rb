class HomeController < ApplicationController
  def index
    @new_thread = ForumThread.new
    @forum_threads = ForumThread.where(parent_id: nil).page(params[:page]).per(10)
  end

  def show
    @new_thread = ForumThread.new
    @thread = ForumThread.find_by(id: params[:id])
    @forum_threads = Kaminari.paginate_array(@thread.descendents).page(params[:page]).per(10)
  end
end
