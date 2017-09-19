class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find(params[:session][:id])
    if user
      log_in user
      queries = user.queries
      redirect_to queries_path
    else
      flash.now[:danger] = 'Invalid id of user'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
